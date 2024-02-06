
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <pthread.h>
#include <fthread.h>
#include <unistd.h>


//Initialisation
//NB MAX de producteurs est égal à la taille du tableau fruits
//dans le main
#define CAPACITE_TAPIS 2
#define NB_PRODUCTEURS 5
#define NB_CONSOMMATEURS 4
#define NB_MESSAGERS 2
#define CIBLE 3


//Mutex, conditions, ordonnanceur
ft_scheduler_t scheduler_prod;
ft_scheduler_t scheduler_cons;



ft_event_t ecriture_journal_prod, ecriture_journal_cons, ecriture_journal_mess;
ft_event_t peut_enfiler, peut_defiler, peut_transporter, peut_deposer, compteur_event;


//Fichiers Journaux
char* journal_prod, journal_cons, journal_mess;

//Structures de données
typedef struct paquet{
    char* contenu;
}Paquet;

typedef struct {
    Paquet* tapis[CAPACITE_TAPIS];
    int tete;
    int queue;
    int cpt; //nb d'element actuel
    int compt; //compteur de consommation 

} Tapis;


typedef struct argprod{
    Tapis* tapis;
    char * produit;
    int cible;
    char* journal;
}argProd;


typedef struct argcons{
    Tapis* tapis;
    int ident;
    char* journal;
}argCons;


typedef struct argmess{
    Tapis* tapis_cons;
    Tapis* tapis_prod;
    int ident;
    char* journal;
}argMess;



int ecrire_fichier(char* nom_fichier, char* texte){
    FILE *fichier = fopen(nom_fichier, "a");

    if (fichier == NULL) {
        printf("Le fichier n'a pas pu s'ouvrir correctement\n");
        return 1; 
    }

    fprintf(fichier, "%s", texte);

    fclose(fichier);
    return 0;
}

int effacer_fichier(char* nom_fichier){
    FILE *fichier = fopen(nom_fichier, "w");

    if (fichier == NULL) {
        printf("Le fichier n'a pas pu s'ouvrir correctement\n");
        return 1; 
    }
    fclose(fichier);
    return 0;
}


// fonction appelé par producteur
void enfiler(Tapis* tapis, Paquet * paquet){

    printf("je suis dans enfiler\n");
    while(tapis->cpt == CAPACITE_TAPIS){
        printf("j'attends peut_enfiler soit genere\n");
        ft_thread_await(peut_enfiler);
        printf("apres ft_thread_await(peut_enfiler) dans enfiler\n");
    }

    printf("je suis en train d'enfiler\n");
    tapis->tapis[tapis->queue] = paquet;
    tapis->queue = (tapis->queue+1)%CAPACITE_TAPIS;
    tapis->cpt++;
    printf("producteur a enfilé %s\n", paquet->contenu);

    printf("enfiler en train de generer peut_transformer\n");
    ft_thread_generate(peut_transporter);

}


// fonction appelé par consommateur
Paquet* defiler(Tapis* tapis){

    printf("je suis dans defiler\n");


    printf("je suis en train de defiler\n");
    Paquet* paquet = tapis->tapis[tapis->tete];
    tapis->tete = (tapis->tete+1)%CAPACITE_TAPIS;
    tapis->cpt--;
    printf("j'ai defile\n");

    printf("defiler en train de generate peut_deposer\n ");
    ft_thread_generate(peut_deposer);

    return paquet;
}


//fonctions appelées par messager
Paquet* transporter(Tapis* tapis){

    //printf("je suis dans transporter\n");
    while(tapis->cpt==0 ){
       // printf("aucun paquet sur le tapis donc j'attends peut_transporter\n");
        ft_thread_await(peut_transporter);
       // printf("apres ft_thread_await(peut_transporter) dans transporter\n");

    }
    //printf("je suis en train de transporter le paquet\n");
    Paquet* paquet = tapis->tapis[tapis->tete];
    tapis->tete = (tapis->tete+1)%CAPACITE_TAPIS;
    tapis->cpt--;

    //printf("transporter en train de generate peut_enfiler\n");
    ft_thread_generate(peut_enfiler);
    return paquet;
}


void deposer(Tapis* tapis, Paquet * paquet){

    //printf("je suis dans deposer\n");
    while(tapis->cpt == CAPACITE_TAPIS){
        printf("pas de place sur le tapis de cons j'attends peut_deposer\n");
        ft_thread_await(peut_deposer);
        printf("apres ft_thread_await(peut_deposer) dans deposer\n");
    }
    //printf("je suis en train de deposer\n");
    tapis->tapis[tapis->queue] = paquet;
    tapis->queue = (tapis->queue+1)%CAPACITE_TAPIS;
    tapis->cpt++;

    //printf("deposer en train de generate peut_defiler\n");
    ft_thread_generate(peut_defiler);
    

}

void producteur(void* args){

    argProd* arguments = (argProd*)args;
    Tapis* tapis = arguments->tapis;
    char* produit = arguments->produit;
    int cible = arguments->cible;
    char* journal = arguments->journal;
    
    for (int i= 1; i<= cible; i++){
        char numStr[12];
        sprintf(numStr, "%d", i);
        char* paquet_str = malloc(strlen(produit) + strlen(numStr) + 2);
        sprintf(paquet_str, "%s %s\n", produit, numStr);
        Paquet* paquet = malloc(sizeof(Paquet));
        paquet->contenu = paquet_str;
        enfiler(tapis, paquet);
    
        //ft_thread_await(ecriture_journal_prod);
        
        int ecriture_journal = ecrire_fichier(journal, paquet_str);

        //ft_thread_generate(ecriture_journal_prod);

        ft_thread_cooperate();
    }
}

void consommateur(void* args){

    argCons* arguments = (argCons*)args;
    Tapis* tapis = arguments->tapis;
    int ident = arguments->ident;
    char* journal = arguments->journal;
    
    while((tapis->compt > 0)){
        //sleep(5);
        printf("dans while de consommateur\n");
        //ft_thread_await(compteur_event);
        if(tapis->cpt==0 ){
            printf("cpt tapis cons = %d\n donc j'attends la generation de peut_defiler\n",tapis->cpt);
            sleep(5);
            ft_thread_await(peut_defiler);
            printf("apres ft_thread_await(peut_defiler) dans defiler\n");
     }
        Paquet* paquet = defiler(tapis);
        
        printf("C%d a consommé %s\n", ident, paquet->contenu);
        int ecriture_journal = ecrire_fichier(journal, paquet->contenu);

        tapis->compt--;
        //ft_thread_generate(compteur_event);
        ft_thread_cooperate();

    }
}


void messager(void* args){

    argMess* arguments = (argMess*)args;
    Tapis* tapis_cons = arguments->tapis_cons;
    Tapis* tapis_prod = arguments->tapis_prod;
    int ident = arguments->ident;
    char* journal = arguments->journal;

    while(tapis_cons->compt != 0){

        //vérouiller l'accès au compteur
        //ft_mutex_lock(&mutex_compt);
        ft_thread_unlink();
        //

        //ft_thread_generate(compteur_event);

        ft_thread_link(scheduler_prod);

        Paquet* paquet = transporter(tapis_prod);
        

        //ft_thread_await(ecriture_journal_mess);
        //printf("M%d transporte %s\n", ident, paquet->contenu);
        ft_thread_unlink();
        ecrire_fichier(journal, paquet->contenu);
        //ft_thread_generate(ecriture_journal_mess);


        ft_thread_link(scheduler_cons);
        //ft_thread_await(compteur_event);
        deposer(tapis_cons, paquet);
       // printf("M%d dépose %s\n", ident, paquet->contenu);
        //ft_thread_generate(compteur_event);
        ft_thread_unlink();       
    }
    
}




int main(){

    int i;
    void* status;
    char *fruits[] = {"mangue", "fraise", "framboise", "kiwi", "pomme", "banane", "lichi", "orange", "mandarine", "prune", "mure", "cassis"};
    char *journal_cons = "consommateur.txt";
    char *journal_prod = "producteur.txt";
    char *journal_mess = "messager.txt";

    effacer_fichier(journal_cons);
    effacer_fichier(journal_prod);
    effacer_fichier(journal_mess);

    ft_scheduler_t scheduler_cons = ft_scheduler_create(); 
    ft_scheduler_t scheduler_prod = ft_scheduler_create(); 

    ft_thread_t consommateurs[NB_CONSOMMATEURS];
    ft_thread_t producteurs[NB_PRODUCTEURS];
    ft_thread_t messagers[NB_MESSAGERS];

    ecriture_journal_cons = ft_event_create (scheduler_cons);
    ecriture_journal_prod = ft_event_create (scheduler_prod);
    ecriture_journal_mess = ft_event_create (scheduler_prod);
    peut_enfiler = ft_event_create (scheduler_prod);
    peut_defiler = ft_event_create (scheduler_cons);
    peut_deposer = ft_event_create (scheduler_cons);
    peut_transporter= ft_event_create (scheduler_prod);
    compteur_event = ft_event_create (scheduler_cons);

    ft_thread_generate(ecriture_journal_cons);
    ft_thread_generate(ecriture_journal_prod);
    ft_thread_generate(ecriture_journal_mess);

    Tapis * tapis_cons = malloc(sizeof(Tapis));
    tapis_cons->tete = 0;
    tapis_cons->queue = 0;
    tapis_cons->cpt = 0;
    tapis_cons->compt = CIBLE*NB_PRODUCTEURS;

    Tapis * tapis_prod = malloc(sizeof(Tapis));
    tapis_prod->tete = 0;
    tapis_prod->queue = 0;
    tapis_prod->cpt = 0;
    tapis_prod->compt = CIBLE*NB_PRODUCTEURS;


    for (int i=0; i<NB_PRODUCTEURS; i++){
        argProd * args=malloc(sizeof(argProd)); 
        args->tapis = tapis_prod;
        args->produit = fruits[i];
        args->cible = CIBLE ;
        args->journal = journal_prod ;
        producteurs[i] = ft_thread_create(scheduler_prod, producteur, NULL, args);
    }

    sleep(1);
    for (int i=0; i<NB_CONSOMMATEURS; i++){
        argCons * args = malloc(sizeof(argCons)); 
        args->tapis = tapis_cons;
        args-> ident = i;
        args->journal = journal_cons ;
        consommateurs[i] = ft_thread_create(scheduler_cons, consommateur, NULL, args);
    }

    for (int i=0; i<NB_MESSAGERS; i++){
        argMess * args = malloc(sizeof(argMess)); 
        args->tapis_cons = tapis_cons;
        args->tapis_prod = tapis_prod;
        args-> ident = i;
        args->journal = journal_mess ;
        //on lie messager au scheduler_prod par défaut, il sera retiré en début
        messagers[i] = ft_thread_create(scheduler_prod, messager, NULL, args);
    }

    ft_scheduler_start(scheduler_cons);
    ft_scheduler_start(scheduler_prod);

    for (int i=0; i<NB_PRODUCTEURS; i++){
        ft_thread_join(producteurs[i]);
    }
    for (int i=0; i<NB_CONSOMMATEURS; i++){
        ft_thread_join(consommateurs[i]);
    }
    for (int i=0; i<NB_MESSAGERS; i++){
        ft_thread_join(messagers[i]);
    }

    ft_exit ();
}