package tme1java;


public class Main {
    public static void main(String[] args) {

    	int capacite = 7; 
        int nbProd = 6;
        int nbCons = 6; 
        int cibleProd = 3;
        String[] fruits = {"mangue", "fraise", "framboise", "kiwi", "pomme", "banane", "lichi", "orange", "mandarine", "prune", "mure", "cassis"};
        

        Tapis tapis = new Tapis(capacite);

        Compteur compteur = new Compteur(nbProd * cibleProd);

        // Création et démarrage des producteurs
        Producteur[] producteurs = new Producteur[nbProd];
        for (int i = 0; i < nbProd; i++) {
            producteurs[i] = new Producteur(tapis, fruits[i], cibleProd);
            producteurs[i].start();
        }

        // Création et démarrage des consommateurs
        Consommateur[] consommateurs = new Consommateur[nbCons];
        for (int i = 0; i < nbCons; i++) {
            consommateurs[i] = new Consommateur(tapis, i, compteur);
            consommateurs[i].start();
        }

        // Attente de la fin de la production
        for (Producteur producteur : producteurs) {
            try {
                producteur.join();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        
        System.out.println("Tous les paquets ont été produits");


        // Attente de la fin de la consommation
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

