#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <pthread.h>


//Initialisation
#define CAPACITE_TAPIS 5
#define NB_PRODUCTEURS 10
#define NB_CONSOMMATEURS 10
#define CIBLE 3


//Mutex et conditions
pthread_mutex_t mutc;
pthread_cond_t peut_produire;
pthread_cond_t peut_consommer;
pthread_mutex_t mutc_compteur;


//definitions des différentes structures
typedef struct tapis{
    char* tapis[CAPACITE_TAPIS];
    int tete;
    int queue;
    int cpt;
    int compt;
}Tapis;


typedef struct argprod{
    Tapis* tapis;
    char * produit;
    int cible;
}argProd;


typedef struct argcons{
    Tapis* tapis;
    int ident;

}argCons;


// fonction appelé par producteur
void enfiler(Tapis* tapis, char * paquet){
    pthread_mutex_lock(&mutc);

    while(tapis->cpt == CAPACITE_TAPIS){
        pthread_cond_wait(&peut_produire, &mutc);
    }

    tapis->tapis[tapis->queue] = paquet;
    tapis->queue = (tapis->queue+1)%CAPACITE_TAPIS;
    tapis->cpt++;
    pthread_cond_signal(&peut_consommer);
    pthread_mutex_unlock(&mutc);

}

// fonction appelé par consommateur
char* defiler(Tapis* tapis){
    pthread_mutex_lock(&mutc);

    while(tapis->cpt==0 ){
        pthread_cond_wait(&peut_consommer, &mutc);
    }

    char* paquet = tapis->tapis[tapis->tete];
    tapis->tete = (tapis->tete+1)%CAPACITE_TAPIS;
    tapis->cpt--;
    pthread_cond_signal(&peut_produire);
    pthread_mutex_unlock(&mutc);
    return paquet;
    

}

void* producteur(void* args){

    argProd* arguments = (argProd*)args;
    Tapis* tapis = arguments->tapis;
    char* produit = arguments->produit;
    int cible = arguments->cible;
    
    for (int i= 1; i<= cible; i++){
        char numStr[12];
        sprintf(numStr, "%d", i);
        char* paquet = malloc(strlen(produit) + strlen(numStr) + 2);
        sprintf(paquet, "%s %s", produit, numStr);
        enfiler(tapis, paquet);
        printf("producteur a enfilé %s\n", paquet);
    }
}

void* consommateur(void* args){

    argCons* arguments = (argCons*)args;
    Tapis* tapis = arguments->tapis;
    int ident = arguments->ident;
    
    while(1){
        pthread_mutex_lock(&mutc_compteur);
        if (tapis->compt <= 0){
            pthread_mutex_unlock(&mutc_compteur);
            break;
        }
        
        char* paquet = defiler(tapis);
        tapis->compt--;
        printf("C%d mange %s\n", ident, paquet);

        pthread_mutex_unlock(&mutc_compteur);
         
    }
}

void free_Tapis(Tapis * tapis){

}

int main(){

    int i;
    pthread_t producteurs[NB_PRODUCTEURS];
    pthread_t consommateurs[NB_CONSOMMATEURS];
    void* status;
    char *fruits[] = {"mangue", "fraise", "framboise", "kiwi", "pomme", "banane", "lichi", "orange", "mandarine", "prune", "mure", "cassis"};


    pthread_mutex_init(&mutc, NULL);
    pthread_cond_init(&peut_produire, NULL);
    pthread_cond_init(&peut_consommer, NULL);
    pthread_mutex_init(&mutc_compteur, NULL);


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
        pthread_create(&producteurs[i], NULL, producteur, args );
        printf("producteur %d crée\n", i);
    }


    for (int i=0; i<NB_CONSOMMATEURS; i++){
        argCons * args = malloc(sizeof(argCons)); 
        args->tapis = tapis;
        args-> ident = i;
        pthread_create(&consommateurs[i], NULL, consommateur, args);
    }


    for (int i=0; i<NB_PRODUCTEURS; i++){
        pthread_join(producteurs[i],&status);
    }
    for (int i=0; i<NB_CONSOMMATEURS; i++){
        pthread_join(consommateurs[i],&status);
    }

    pthread_mutex_destroy(&mutc);
    pthread_cond_destroy(&peut_produire);
    pthread_cond_destroy(&peut_consommer);
}