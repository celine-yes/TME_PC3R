package tme1java;


public class Tapis {
    private Paquet[] array;
    private int capacite;
    private int taille; 
    private int tete; 
    private int queue;

    public Tapis(int capacite) {
        this.capacite = capacite;
        this.array = new Paquet[capacite];
        this.taille = 0;
        this.tete = 0;
        this.queue = 0;
    }
    
    private boolean finProduction = false;
    
    public synchronized void signalerFinProduction() {
        finProduction = true;
        notifyAll(); // Notifie consommateurs
    }

    public boolean estFinProduction() {
        return finProduction;
    }
    

    public synchronized void enfiler(Paquet paquet) throws InterruptedException {
        while (taille == capacite) { //attend si tapis est plein
            wait(); 
        }
        array[queue] = paquet;
        queue = (queue + 1) % capacite;
        taille++;
        notifyAll(); // Notifie consommateurs
    }

    public synchronized Paquet defiler() throws InterruptedException {
        while (taille == 0 && !finProduction) {
            wait();
        }
        if(finProduction) {
        	return null;
        }

        Paquet paquet = array[tete];
        tete = (tete + 1) % capacite;
        taille--;
        notifyAll(); // Notifie producteurs
        
        return paquet;
    }
    
    
    
}
