
#define NB_PAQUETS 5 // Taille maximale des paquets
#define TAILLE_G 3 // Taille maximale de la file des gestionnaires
#define NB_G 2   // nombre de gestionnaires
#define NB_P 2   // nombre de producteurs
#define NB_O 2     // nombre d'ouvriers
#define MILLIS_PER_TICK 10

mtype = {VIDE, EN_COURS, FINI, p, rp, ro, og, oc, c, paquet};

init {
    chan producteurGestion = [1] of {mtype, mtype};
    chan ouvrierGestion = [1] of {mtype, byte};
    chan gestionOuvrier = [1] of {mtype, byte};
    chan ouvrierCollecteur = [1] of {mtype, byte};
    chan obs = [1] of {mtype};
    chan fin = [1] of {int};

    run observateur(obs, fin);

    int i;

    for (i : 1 .. NB_G){
        run gestionnaire(i, producteurGestion, ouvrierGestion, gestionOuvrier, obs, fin);
    }
    for (i : 1 .. NB_P){
        run producteur(i, producteurGestion, obs, fin);
    }
    for (i : 1 .. NB_O){
        run ouvrier(i,gestionOuvrier, ouvrierGestion, ouvrierCollecteur, obs, fin);
    }
    run collecteur(ouvrierCollecteur, obs, fin); 
}

proctype observateur(chan obs; chan fin) {
    int produits = 0;  // Nombre de paquets produits
    int traiteOuvGest = 0;  // Nombre de paquets traités par les ouvriers et envoyé aux gestionnaires
    int traiteOuvColl = 0;  // Nombre de paquets envoyés au collecteur
    int recuProdGest = 0; //nombre de paquets gestionnaire a recus par les producteurs
    int recuOuvrGest = 0; //nombre de paquets gestionnaire a recus par les producteurs
    int collectes = 0;  // Nombre de paquets collectés
    mtype m;

    boucle:
        assert(produits >= recuProdGest);
        assert(recuOuvrGest >= traiteOuvGest);
        assert(traiteOuvColl >= collectes);
        if
        :: obs?m ->
            // Observer les actions des différents types d'acteurs
            if
            :: m == p -> produits++;
            :: m == og -> traiteOuvGest++;
            :: m == oc -> traiteOuvColl++;
            :: m == c -> collectes++;
            :: m == rp -> recuProdGest++;
            :: m == ro -> recuOuvrGest++;
            fi;
            printf("Observateur: produit %d; ouvGest %d; ouvColl %d; prodGest %d; ouvGest %d; collectes %d\n", produits, traiteOuvGest, traiteOuvColl, recuProdGest, recuOuvrGest, collectes );
            goto boucle;

        :: fin?0 -> fin!0; goto fini;

        fi;

    fini:
        printf("Observateur fini\n");
        
}

proctype producteur(int id; chan producteurGestion; chan obs; chan fin) {
    int i;

    for (i : 0 .. NB_PAQUETS){
        printf("Producteur %d envoie un paquet aux gestionnaires\n", id);
        producteurGestion ! VIDE, paquet;
        obs ! p;    
    }

    fin!0;
    printf("Producteur %d fini\n", id);

}

proctype gestionnaire(int id; chan producteurGestion; chan ouvrierGestion; chan gestionOuvrier; chan obs; chan fin) {

    // File pour les paquets gérés par le gestionnaire
    byte fileGestion[TAILLE_G];
    mtype statutGestion[TAILLE_G];
    byte fileCounter = 0;
    mtype statut;
    int i;

    debut:
        do
        :: (fileCounter < TAILLE_G) ->
            // Tant qu'il y a de la place dans la file, essayer de recevoir un paquet
            if
            :: producteurGestion ? statut, paquet ->
                // Ajouter le paquet à la file du gestionnaire
                printf("Gestionnaire %d a recu un paquet de la part des producteurs\n", id);
                fileGestion[fileCounter] = paquet;
                statutGestion[fileCounter] = statut;
                fileCounter++;
                obs ! rp;
                
            :: ouvrierGestion ? statut, paquet ->
                // Ajouter le paquet à la file du gestionnaire
                printf("Gestionnaire %d a recu un paquet de la part des ouvriers\n", id);
                fileGestion[fileCounter] = paquet;
                statutGestion[fileCounter] = statut;
                fileCounter++;
                obs ! ro;

            :: fin? 0 -> fin!0; goto fini;
            fi
        :: (fileCounter > 0) ->
            // Si la file n'est pas vide, envoyer le paquet en tête de la file aux ouvriers
            printf("Gestionnaire %d envoie un paquet aux ouvriers\n", id);
            gestionOuvrier ! fileGestion[0], statutGestion[0];
            // Décaler les paquets dans la file
            for (i : 0 .. fileCounter-1) {
                fileGestion[i] = fileGestion[i+1];
                statutGestion[i] = statutGestion[i+1];
            }
            fileCounter--;
            goto debut;
        od
    
    fini:
        printf("Gestionnaire %d fini\n", id);

}


proctype ouvrier(int id; chan gestionOuvrier; chan ouvrierGestion; chan ouvrierCollecteur; chan obs; chan fin) {
    mtype statut;

    debut:

        if
        :: gestionOuvrier ? statut, paquet ->
            // Traiter le paquet en fonction de son statut
            if 
                :: statut == VIDE ->
                    printf("Ouvrier %d a recu un paquet VIDE\n", id);
                    ouvrierGestion ! EN_COURS, paquet;
                    obs ! og;
                :: statut == EN_COURS -> // Paquet en cours de modification
                    printf("Ouvrier %d a recu un paquet EN_COURS\n", id);
                    printf("Ouvrier %d travaille sur le paquet EN_COURS\n", id);
                    ouvrierGestion ! FINI, paquet;
                    obs ! og;
                :: statut == FINI -> // Paquet terminé
                    printf("Ouvrier %d a recu un paquet FINI\n", id);
                    ouvrierCollecteur ! FINI, paquet;
                    obs ! oc;
            fi;

        :: fin? 0 -> fin!0; goto fini;
        fi;

    fini:
        printf("Ouvrier %d fini\n", id);
}

proctype collecteur(chan ouvrierCollecteur; chan obs; chan fin) {
    mtype statut;
    int f;
    boucle:
        do
        :: ouvrierCollecteur ? statut, paquet ->
            printf("Collecteur: paquet reçu\n");
            obs ! c; goto boucle;
        :: fin?0 -> fin!0; goto fini;
        od
    fini: 
        fin!0;
        printf("Collecteur a fini");
}

