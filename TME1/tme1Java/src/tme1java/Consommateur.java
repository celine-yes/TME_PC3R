package tme1java;

class Consommateur extends Thread {
    private Tapis tapis;
    private int idCons;
    private Compteur compteur;

    public Consommateur(Tapis tapis, int idCons, Compteur compteur) {
        this.tapis = tapis;
        this.idCons = idCons;
        this.compteur = compteur;
    }

    @Override
    public void run() {
        while (compteur.getValeur() > 0) {
            try {
                Paquet paquet = tapis.defiler();
                compteur.decrementer();
                
                
                if(compteur.getValeur() == 0) {
                	tapis.signalerFinProduction();
                }
                if(paquet == null) {
                	break;
                }
                
                System.out.println("C" + idCons + " mange " + paquet.getContenu());
                
                
   
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
                break;
            }
        }
        //System.out.println("C" + idCons + "terminé");
    }
}
