#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <pthread.h>



int CAPACITE_TAPIS = 5;
int NB_PRODUCTEURS = 10;
int NB_CONSOMMATEURS = 10;

pthread_mutex_t mutc;
pthread_mutex_t muta;
pthread_mutex_t mutdef;
pthread_mutex_t mutaenf;

typedef struct element{
    struct element* suivant;
    struct element* precedent;
    char * paquet;
}Element;

typedef struct tapis{
    Element* tete;
    Element* queue;
    int capacite;
    int cpt;
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

Element* creer_Element(char* paquet){
    Element* newpaquet = malloc(sizeof(Element));
    newpaquet->paquet = strdup(paquet);
    newpaquet->suivant = NULL;
    newpaquet->precedent = NULL;
    return newpaquet;
}

void enfiler(Tapis* tapis, char * paquet){
    while(1){
        if (tapis->cpt < tapis->capacite){

            Element* newpaquet = creer_Element(paquet);
            pthread_mutex_lock(&mutc);
            Element* oldqueue = tapis->queue;
            tapis->queue->suivant = newpaquet;
            tapis->queue = tapis->queue->suivant;
            newpaquet->precedent=oldqueue;
            tapis->cpt++;
            printf("Paquet: %s enfilé dans le tapis", paquet);
            pthread_mutex_unlock(&mutc);
            pthread_mutex_unlock(&mutaenf);
            break;
        }
        else{
            pthread_mutex_lock(&muta);
        }
    }
    
}

char* defiler(Tapis* tapis){
    while(1){
        if(tapis->tete != NULL){
            pthread_mutex_lock(&mutdef);
            Element* newtete = tapis->tete->suivant; 
            Element* oldtete = tapis->tete;
            tapis->tete = NULL;
            tapis->tete = newtete;
            newtete->precedent = NULL;
            tapis->cpt--;
            printf("Paquet: %s défilé du tapis", oldtete->paquet);
            pthread_mutex_unlock(&muta);
            return oldtete->paquet;
        }
        else{
            pthread_mutex_lock(&mutaenf);
        }
    }
}

void* producteur(void* args){

    argProd* arguments = (argProd*)args;
    Tapis* tapis = arguments->tapis;
    char* produit = arguments->produit;
    int cible = arguments->cible;
    
    for (int i= 1; i<= cible; i++){
        char numStr[12]; // Assumant que i ne soit pas très grand
        sprintf(numStr, "%d", i);
        strcat(produit, numStr);
        enfiler(tapis, produit);
        printf("producteur a enfilé son %d e paquet", i);
    }
}

void* consommateur(void* args){

    argCons* arguments = (argCons*)args;
    Tapis* tapis = arguments->tapis;
    int ident = arguments->ident;
    int compt = arguments->compt;
    
    while(compt > 0){
        char* paquet = defiler(tapis);
        printf("C%d mange %s", ident, paquet);
        compt--;
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
    pthread_mutex_init(&muta, NULL);
    pthread_mutex_init(&mutdef, NULL);
    pthread_mutex_init(&mutaenf, NULL);

    Tapis * tapis = malloc(sizeof(Tapis));
    tapis->tete = NULL;
    tapis->queue = NULL;
    tapis->capacite = CAPACITE_TAPIS;
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
        args->compt = cible ;
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
    pthread_mutex_destroy(&muta);
    pthread_mutex_destroy(&mutdef);
    pthread_mutex_destroy(&mutaenf);
}