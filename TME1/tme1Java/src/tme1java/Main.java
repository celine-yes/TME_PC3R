package tme1java;


public class Main {
    public static void main(String[] args) {
        //Initialisation
        //NB MAX de producteurs est égal à la taille du tableau fruits
        //dans le main
    	int capacite = 7; 
        int nbProd = 6;
        int nbCons = 6; 
        int cibleProd = 3;
        String[] fruits = {"mangue", "fraise", "framboise", "kiwi", "pomme", "banane", "lichi", "orange", "mandarine", "prune", "mure", "cassis"};
        

        Tapis tapis = new Tapis(capacite);

        Compteur compteur = new Compteur(nbProd * cibleProd);

        Producteur[] producteurs = new Producteur[nbProd];
        for (int i = 0; i < nbProd; i++) {
            producteurs[i] = new Producteur(tapis, fruits[i], cibleProd);
            producteurs[i].start();
        }

        Consommateur[] consommateurs = new Consommateur[nbCons];
        for (int i = 0; i < nbCons; i++) {
            consommateurs[i] = new Consommateur(tapis, i, compteur);
            consommateurs[i].start();
        }

        for (Producteur producteur : producteurs) {
            try {
                producteur.join();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        
        System.out.println("Tous les paquets ont été produits");


        for (Consommateur consommateur : consommateurs) {
            try {
                consommateur.join();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }

        System.out.println("Tous les paquets ont été produits et consommés.");
    }
}

