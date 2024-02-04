
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
    FILE *fichier = fopen(nom_fichier, "w");

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
    //ft_mutex_lock(&mutex_prod);

    while(tapis->cpt == CAPACITE_TAPIS){
        ft_thread_cooperate();
    }

    tapis->tapis[tapis->queue] = paquet;
    tapis->queue = (tapis->queue+1)%CAPACITE_TAPIS;
    tapis->cpt++;


    // ft_thread_generate_condition(&peut_transporter);
    //ft_mutex_unlock(&mutex_prod);

}


// fonction appelé par consommateur
Paquet* defiler(Tapis* tapis){

    //ft_mutex_lock(&mutex_cons);

    while(tapis->cpt==0 ){
        ft_thread_cooperate();
    }

    Paquet* paquet = tapis->tapis[tapis->tete];
    tapis->tete = (tapis->tete+1)%CAPACITE_TAPIS;
    tapis->cpt--;

    //ft_mutex_unlock(&mutex_cons);
    return paquet;
    

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
        sprintf(paquet_str, "%s %s", produit, numStr);
        Paquet* paquet = malloc(sizeof(Paquet));
        paquet->contenu = paquet_str;
        enfiler(tapis, paquet);

        //ft_mutex_lock(&mutex_journal_prod);
        int ecriture_journal = ecrire_fichier(journal, paquet_str);
        //ft_mutex_unlock(&mutex_journal_prod);

        ft_thread_cooperate();
    }
}

void consommateur(void* args){

    argCons* arguments = (argCons*)args;
    Tapis* tapis = arguments->tapis;
    int ident = arguments->ident;
    char* journal = arguments->journal;
    
    while(1){

        //vérouiller l'accès au compteur
        //ft_mutex_lock(&mutex_compt);
        if (tapis->compt <= 0){
            //ft_mutex_unlock(&mutex_compt);
            break;
        }
        
        Paquet* paquet = defiler(tapis);
        //ft_mutex_lock(&mutex_journal_cons);
        int ecriture_journal = ecrire_fichier(journal, paquet->contenu);
        //ft_mutex_unlock(&mutex_journal_cons);
        tapis->compt--;
        //ft_mutex_unlock(&mutex_compt);
        ft_thread_cooperate();
         
    }
}


void messager(void* args){

    argMess* arguments = (argMess*)args;
    Tapis* tapis_cons = arguments->tapis_cons;
    Tapis* tapis_prod = arguments->tapis_prod;
    int ident = arguments->ident;
    char* journal = arguments->journal;

    while(1){

        //vérouiller l'accès au compteur
        //ft_mutex_lock(&mutex_compt);
        if (tapis_cons->compt == 0){
            //ft_mutex_unlock(&mutex_compt);
            break;
        }
        ft_thread_link(scheduler_prod);
        Paquet* paquet = defiler(tapis_prod);
        ft_thread_unlink();

        ecrire_fichier(journal, paquet->contenu);

        ft_thread_link(scheduler_cons);
        enfiler(tapis_cons, paquet);
        ft_thread_unlink();       
    }
    
}




int main(){

    int i;
    void* status;
    char *fruits[] = {"mangue", "fraise", "framboise", "kiwi", "pomme", "banane", "lichi", "orange", "mandarine", "prune", "mure", "cassis"};


    // pthread_mutex_init(&mutc, NULL);
    // pthread_cond_init(&peut_produire, NULL);
    // pthread_cond_init(&peut_consommer, NULL);
    // pthread_mutex_init(&mutc_compteur, NULL);

    ft_scheduler_t scheduler_cons = ft_scheduler_create(); 
    ft_scheduler_t scheduler_prod = ft_scheduler_create(); 


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
        ft_thread_create(scheduler_prod, producteur, NULL, args);
        printf("producteur %d crée\n", i);
    }


    for (int i=0; i<NB_CONSOMMATEURS; i++){
        argCons * args = malloc(sizeof(argCons)); 
        args->tapis = tapis_cons;
        args-> ident = i;
        ft_thread_create(scheduler_cons, consommateur, NULL, args);
    }

    for (int i=0; i<NB_MESSAGERS; i++){
        argMess * args = malloc(sizeof(argMess)); 
        args->tapis_cons = tapis_cons;
        args->tapis_prod = tapis_prod;
        args-> ident = i;
        ft_thread_create(NULL, messager, NULL, args);
    }

    ft_scheduler_start(scheduler_cons);
    ft_scheduler_start(scheduler_prod);

    // for (int i=0; i<NB_PRODUCTEURS; i++){
    //     ft_thread_join(producteurs[i]);
    // }
    // for (int i=0; i<NB_CONSOMMATEURS; i++){
    //     ft_thread_join(consommateurs[i]);
    // }

}