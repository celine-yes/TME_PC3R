
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <pthread.h>
#include <fthread.h>


//Initialisation
//NB MAX de producteurs est égal à la taille du tableau fruits
//dans le main
#define CAPACITE_TAPIS 5
#define NB_PRODUCTEURS 10
#define NB_CONSOMMATEURS 10
#define NB_MESSAGERS 10
#define CIBLE 3


//Mutex, conditions, ordonnanceur
ft_scheduler_t scheduler_prod;
ft_scheduler_t scheduler_cons;
// ft_thread_t producteurs[NB_PRODUCTEURS];
// ft_thread_t consommateurs[NB_CONSOMMATEURS];
// ft_thread_t messagers[NB_MESSAGERS];
ft_cond_t peut_consommer, peut_produire, peut_transporter;
ft_mutex_t mutex_cons, mutex_prod, mutex_journal_cons, mutex_journal_prod, mutex_journal_mess, mutex_compt;

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
}argCons;



int ecrire_fichier(char* fichier, char* texte){
    FILE *fichier = fopen(fichier, "w");

    if (fichier == NULL) {
        printf("Le fichier n'a pas pu s'ouvrir correctement\n");
        return 1; 
    }

    fprintf(fichier, "%s", texte);

    fclose(fichier);
    return 0;
}


// fonction appelé par producteur
void enfiler(Tapis* tapis, Paquet * paquet){
    ft_mutex_lock(&mutex_prod);

    while(tapis->cpt == CAPACITE_TAPIS){
        ft_thread_await_condition(&peut_produire);
    }

    tapis->tapis[tapis->queue] = paquet;
    tapis->queue = (tapis->queue+1)%CAPACITE_TAPIS;
    tapis->cpt++;


    ft_thread_generate_condition(&peut_transporter);
    ft_mutex_unlock(&mutex_prod);

}


// fonction appelé par consommateur
char* defiler(Tapis* tapis){

    ft_mutex_lock(&mutex_cons);

    while(tapis->cpt==0 ){
        ft_thread_await_condition(&peut_consommer);
    }

    char* paquet = tapis->tapis[tapis->tete];
    tapis->tete = (tapis->tete+1)%CAPACITE_TAPIS;
    tapis->cpt--;
    ft_mutex_unlock(&mutex_cons);
    return paquet;
    

}

void* producteur(void* args){

    argProd* arguments = (argProd*)args;
    Tapis* tapis = arguments->tapis;
    char* produit = arguments->produit;
    int cible = arguments->cible;
    char* journal = arguments->journal;
    
    for (int i= 1; i<= cible; i++){
        char numStr[12];
        sprintf(numStr, "%d", i);
        char* paquet = malloc(strlen(produit) + strlen(numStr) + 2);
        sprintf(paquet, "%s %s", produit, numStr);
        enfiler(tapis, paquet);

        ft_mutex_lock(&mutex_journal_prod);
        int ecriture_journal = ecrire_fichier(journal, paquet);
        ft_mutex_unlock(&mutex_journal_prod);

        ft_thread_cooperate();
    }
}

void* consommateur(void* args){

    argCons* arguments = (argCons*)args;
    Tapis* tapis = arguments->tapis;
    int ident = arguments->ident;
    char* journal = arguments->journal;
    
    while(1){

        //vérouiller l'accès au compteur
        ft_mutex_lock(&mutc_compteur);
        if (tapis->compt <= 0){
            ft_mutex_unlock(&mutc_compteur);
            break;
        }
        
        char* paquet = defiler(tapis);
        ft_mutex_lock(&mutex_journal_cons);
        int ecriture_journal = ecrire_fichier(journal, paquet);
        ft_mutex_unlock(&mutex_journal_cons);
        tapis->compt--;
        ft_mutex_unlock(&mutc_compteur);
        ft_thread_cooperate();
         
    }
}


void * messager(void* args){

    argCons* arguments = (argCons*)args;
    Tapis* tapis_cons = arguments->tapis_cons;
    Tapis* tapis_prod = arguments->tapis_prod;
    int ident = arguments->ident;
    char* journal = arguments->journal;

    while(1){

        //vérouiller l'accès au compteur
        ft_mutex_lock(&mutc_compteur);
        if (tapis->compt == 0){
            ft_mutex_unlock(&mutc_compteur);
            break;
        }
        ft_thread_link(scheduler_prod);
        Paquet* paquet = defiler(tapis_prod);
        ft_thread_unlink(scheduler_prod);

        ecrire_fichier(journal, paquet);

        ft_thread_link(scheduler_cons);
        enfiler(tapis_cons, paquet);
        ft_thread_unlink(scheduler_cons);       
    }
    
}




int main(){

    int i;
    void* status;
    char *fruits[] = {"mangue", "fraise", "framboise", "kiwi", "pomme", "banane", "lichi", "orange", "mandarine", "prune", "mure", "cassis"};


    pthread_mutex_init(&mutc, NULL);
    pthread_cond_init(&peut_produire, NULL);
    pthread_cond_init(&peut_consommer, NULL);
    pthread_mutex_init(&mutc_compteur, NULL);

    ft_scheduler_t scheduler_cons = ft_scheduler_create(); 
    ft_scheduler_t scheduler_prod = ft_scheduler_create(); 


    Tapis * tapis = malloc(sizeof(Tapis));
    tapis->tete = 0;
    tapis->queue = 0;
    tapis->cpt = 0;
    tapis->compt = CIBLE*NB_PRODUCTEURS;


    for (int i=0; i<NB_PRODUCTEURS; i++){
        argProd * args=malloc(sizeof(argProd)); 
        args->tapis = tapis;
        args->produit = fruits[i];
        args->cible = CIBLE ;
        ft_thread_create(scheduler_prod, producteur, NULL, args );
        printf("producteur %d crée\n", i);
    }


    for (int i=0; i<NB_CONSOMMATEURS; i++){
        argCons * args = malloc(sizeof(argCons)); 
        args->tapis = tapis;
        args-> ident = i;
        ft_thread_create(scheduler_cons, consommateur, NULL, args);
    }

    ft_scheduler_start(scheduler_cons);
    ft_scheduler_start(scheduler_prod);

    for (int i=0; i<NB_PRODUCTEURS; i++){
        ft_thread_join(producteurs[i]);
    }
    for (int i=0; i<NB_CONSOMMATEURS; i++){
        ft_thread_join(consommateurs[i]);
    }

}