package tme1java;

class Producteur extends Thread {
    private Tapis tapis;
    private String nomProd;
    private int cible;
    private int nbProdCrees;

    public Producteur(Tapis tapis, String nomProd, int cible) {
        this.tapis = tapis;
        this.nomProd = nomProd;
        this.cible = cible;
        this.nbProdCrees = 0;
    }

    @Override
    public void run() {
        while (nbProdCrees < cible) {
            String contenu = nomProd + " " + nbProdCrees;
            Paquet paquet = new Paquet(contenu);
            try {
                tapis.enfiler(paquet);
                System.out.println("producteur a enfilé un paquet");
                nbProdCrees++;
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
                break;
            }
        }
    }
}
