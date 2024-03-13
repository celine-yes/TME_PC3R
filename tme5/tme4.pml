
#define NB_PAQUETS 10 // Taille maximale des paquets
#define TAILLE_G 8 // Taille maximale de la file des gestionnaires
#define NB_G 1   // nombre de gestionnaires
#define NB_P 2   // nombre de producteurs
#define NB_O 2     // nombre d'ouvriers
#define MILLIS_PER_TICK 10

mtype = {VIDE, EN_COURS, FINI, p, rp, ro, og, oc, c, paquet};

init {
    chan producteurGestion = [0] of {mtype, mtype};
    chan ouvrierGestion = [0] of {mtype, byte};
    chan gestionOuvrier = [0] of {mtype, byte};
    chan ouvrierCollecteur = [0] of {mtype, byte};
    chan obs = [0] of {mtype};
    chan fin = [0] of {int};

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
    int collectes = 0;  // Nombre de paquets collectés
    mtype m;

    boucle:
        assert(produits >= recuProdGest);
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
            fi;
            printf("Observateur: produit %d; ouvGest %d; ouvColl %d; prodGest %d; collectes %d\n", produits, traiteOuvGest, traiteOuvColl, recuProdGest, collectes );
            goto boucle;

        :: fin?0 -> fin!0; goto fini;

        fi;

    fini:
        printf("Observateur fini\n");
        
}

proctype producteur(int id; chan producteurGestion; chan obs; chan fin) {
    int i;

    for (i : 0 .. NB_PAQUETS){
        obs ! p;
        producteurGestion ! VIDE, paquet;
        printf("Producteur %d envoie un paquet aux gestionnaires\n", id);
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
        if
        :: fileCounter > 0 ->
                    // Si la file n'est pas vide, envoyer le paquet en tête de la file aux ouvriers
                    gestionOuvrier ! fileGestion[0], statutGestion[0];
                    printf("Gestionnaire %d envoie un paquet aux ouvriers\n", id);
                    // Décaler les paquets dans la file
                    for (i : 0 .. fileCounter-1) {
                        fileGestion[i] = fileGestion[i+1];
                        statutGestion[i] = statutGestion[i+1];
                    }
                    fileCounter--;
                    goto debut
        :: (fileCounter < TAILLE_G) ->
            // Tant qu'il y a de la place dans la file, essayer de recevoir un paquet
            if
            :: producteurGestion ? statut, paquet ->
                // Ajouter le paquet à la file du gestionnaire
                obs ! rp;
                printf("Gestionnaire %d a recu un paquet de la part des producteurs\n", id);
                fileGestion[fileCounter] = paquet;
                statutGestion[fileCounter] = statut;
                fileCounter++;
                printf("filecounter = %d\n", fileCounter);

            :: ouvrierGestion ? statut, paquet ->
                // Ajouter le paquet à la file du gestionnaire
                obs ! ro;
                printf("Gestionnaire %d a recu un paquet de la part des ouvriers\n", id);
                fileGestion[fileCounter] = paquet;
                statutGestion[fileCounter] = statut;
                fileCounter++;
            fi
            goto debut
        :: fin? 0 -> fin!0; goto fini;
        fi
    
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
                    obs ! og;
                    ouvrierGestion ! EN_COURS, paquet;
                    goto debut
                :: statut == EN_COURS -> // Paquet en cours de modification
                    printf("Ouvrier %d a recu un paquet EN_COURS\n", id);
                    printf("Ouvrier %d travaille sur le paquet EN_COURS\n", id);
                    obs ! og;
                    ouvrierGestion ! FINI, paquet;
                    goto debut
                :: statut == FINI -> // Paquet terminé
                    printf("Ouvrier %d a recu un paquet FINI\n", id);
                    obs ! oc;
                    ouvrierCollecteur ! FINI, paquet;
                    goto debut
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