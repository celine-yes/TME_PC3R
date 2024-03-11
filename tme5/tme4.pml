
#define MAX_SIZE 5 // Taille maximale des paquets
#define TAILLE_G 3 // Taille maximale de la file des gestionnaires
#define NB_G int = 2   // nombre de gestionnaires
#define NB_P int = 2   // nombre de producteurs
#define NB_O int = 4     // nombre d'ouvriers
#define MILLIS_PER_TICK 10

mtype = {VIDE, EN_COURS, FINI, p, rp, ro, og, oc, c};

init {

    chan producteurGestion = [1] {mtype, byte[MAX_SIZE]};
    chan ouvrierGestion = [1] {mtype, byte[MAX_SIZE]};
    chan gestionOuvrier = [1] of {mtype, byte[MAX_SIZE]};
    chan ouvrierCollecteur= [1] of {mtype, byte[MAX_SIZE]};
    chan obs = [1] of {mtype};
    chan fin = [1] of {int};

    run observateur(obs);
    for (i : 0 .. NB_G){
        run gestionnaire(producteurGestion, ouvrierGestion, gestionOuvrier, obs);
    }
    for (i : 0 .. NB_P){
        run producteur(producteurGestion, obs);
    }
    for (i : 0 .. NB_O){
        run ouvrier(gestionOuvrier, ouvrierGestion, obs);
    }
    run collecteur(ouvrierCollecteur, obs, fin);

    wait(1000);
    fin!0;  
}

proctype observateur(chan obs) {
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
        goto boucle
}

proctype producteur(chan producteurGestion, chan obs) {
    byte paquet[MAX_SIZE];

    do
    :: true ->
        // Générer un paquet (par exemple, une chaîne de caractères aléatoire)
        paquet[0] = 'A' + (rand() % 26);
        paquet[1] = 'B' + (rand() % 26);
        paquet[2] = 'C' + (rand() % 26);
        paquet[3] = 'D' + (rand() % 26);
        paquet[4] = 'E' + (rand() % 26);

        // Envoyer le paquet au premier gestionnaire disponible avec le statut VIDE
        printf("Producteur envoie un paquet aux gestionnaires");
        producteurGestion ! VIDE, paquet;
        obs ! p;
    od
}

proctype gestionnaire(chan producteurGestion, chan ouvrierGestion, chan gestionOuvrier, chan obs) {

    // File pour les paquets gérés par le gestionnaire
    byte fileGestion[TAILLE_G][MAX_SIZE];
    mtype statutGestion[TAILLE_G];
    byte fileCounter = 0;

    byte paquet[MAX_SIZE];
    mtype statut;

    do
    :: (fileCounter < TAILLE_G) ->
        // Tant qu'il y a de la place dans la file, essayer de recevoir un paquet
        if
        :: producteurGestion ? statut, paquet ->
            // Ajouter le paquet à la file du gestionnaire
            printf("Gestionnaire a recu un paquet de la part des producteurs");
            fileGestion[fileCounter] = paquet;
            statutGestion[fileCounter] = statut;
            fileCounter++;
            obs ! rp;
        :: ouvrierGestion ? statut, paquet ->
            // Ajouter le paquet à la file du gestionnaire
            printf("Gestionnaire a recu un paquet de la part des ouvriers");
            fileGestion[fileCounter] = paquet;
            statutGestion[fileCounter] = statut;
            fileCounter++;
            obs ! ro;
        fi
    :: (fileCounter > 0) ->
        // Si la file n'est pas vide, envoyer le paquet en tête de la file aux ouvriers
        printf("Gestionnaire envoie un paquet aux ouvriers");
        gestionOuvrier ! fileGestion[0], statutGestion[0];
        // Décaler les paquets dans la file
        for (i : 0 .. fileCounter-1) {
            fileGestion[i] = fileGestion[i+1];
            statutGestion[i] = statutGestion[i+1];
        }
        fileCounter--;
    od
}


proctype ouvrier(chan gestionOuvrier, chan ouvrierGestion, chan obs) {
    byte paquet[MAX_SIZE];
    mtype statut;

    do
    :: gestionOuvrier ? statut, paquet ->
        // Traiter le paquet en fonction de son statut
        switch(statut) {
            case VIDE: // Paquet vide
                printf("Ouvrier a recu un paquet VIDE");
                ouvrierGestion ! EN_COURS, paquet;
                obs ! og;
            case EN_COURS: // Paquet en cours de modification
                paquet = travaille(paquet); 
                printf("Ouvrier a recu un paquet EN_COURS");
                ouvrierGestion ! FINI, paquet;
                obs ! og;
            case FINI: // Paquet terminé
                printf("Ouvrier a recu un paquet FINI");
                ouvrierCollecteur ! FINI, paquet;
                obs ! oc;
        }
    od
}

proctype collecteur(chan ouvrierCollecteur, chan obs, chan fin) {
    byte paquet[MAX_SIZE];
    mtype statut;
    int f;
    boucle:
        do
        :: ouvrierCollecteur ? statut, paquet ->
            printf("Collecteur: paquet reçu: %c %c %c %c %c\n", paquet[0], paquet[1], paquet[2], paquet[3], paquet[4]);
            obs ! c;
        :: fin?f -> goto fin
        od
    fin: 
        printf("Collecteur a fini");
}

//pour l'attente avant d'envoyer au collecteur signal de fin
proctype wait(millis)
{
    int ticks = millis / MILLIS_PER_TICK;
    int i;
    for (i : 1 .. ticks) {
       d_step;
    }
}