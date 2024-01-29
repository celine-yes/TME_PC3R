#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <pthread.h>



#define CAPACITE_TAPIS 5
int NB_PRODUCTEURS = 10;
int NB_CONSOMMATEURS = 10;

pthread_mutex_t mutc;
pthread_cond_t peut_produire;
pthread_cond_t peut_consommer;


typedef struct tapis{
    char* tapis[CAPACITE_TAPIS];
    int tete;
    int queue;
    int cpt;
    int finProduction; 
}Tapis;


typedef struct argprod{
    Tapis* tapis;
    char * produit;
    int cible;
}argProd;


typedef struct argcons{
    Tapis* tapis;
    int ident;
    int compt;
}argCons;


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


char* defiler(Tapis* tapis){
    pthread_mutex_lock(&mutc);

    while(tapis->cpt==0 && !tapis->finProduction){
        pthread_cond_wait(&peut_consommer, &mutc);
    }
    if(tapis->finProduction){
        return NULL;
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
        enfiler(tapis, produit);
        printf("producteur a enfilé %s\n", paquet);
    }
}

void* consommateur(void* args){

    argCons* arguments = (argCons*)args;
    Tapis* tapis = arguments->tapis;
    int ident = arguments->ident;
    int compt = arguments->compt;
    
    while(compt > 0){
        char* paquet = defiler(tapis);
        compt--;
        if (compt == 0){
            tapis->finProduction = 1;
        }
        if (paquet == NULL){
            break;
        }
        printf("C%d mange %s", ident, paquet);
        
    }
}

void free_Tapis(Tapis * tapis){

}

int main(){

    int i;
    pthread_t producteurs[NB_PRODUCTEURS];
    pthread_t consommateurs[NB_CONSOMMATEURS];
    void* status;
    char *fruits[] = {"Pomme", "Banane", "Orange", "Fraise", "Raisin"};
    int cible = 3;

    pthread_mutex_init(&mutc, NULL);
    pthread_cond_init(&peut_produire, NULL);
    pthread_cond_init(&peut_consommer, NULL);

    Tapis * tapis = malloc(sizeof(Tapis));
    tapis->tete = 0;
    tapis->queue = 0;
    //tapis->capacite = CAPACITE_TAPIS;
    tapis->cpt = 0;

    printf("ici\n");

    for (int i=0; i<NB_PRODUCTEURS; i++){
        argProd * args=malloc(sizeof(argProd)); 
        args->tapis = tapis;
        args->produit = fruits[i];
        args->cible = cible ;
        pthread_create(&producteurs[i], NULL, producteur, args );
        printf("producteur %d crée\n", i);
    }

    printf("la\n");

    for (int i=0; i<NB_CONSOMMATEURS; i++){
        argCons * args = malloc(sizeof(argCons)); 
        args->tapis = tapis;
        args-> ident = i;
        args->compt = cible*NB_PRODUCTEURS ;
        pthread_create(&consommateurs[i], NULL, consommateur, args);
    }

    printf("wow\n");

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