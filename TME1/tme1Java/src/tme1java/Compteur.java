package tme1java;

class Compteur {
    private int val;

    public Compteur(int val) {
        this.val = val;
    }

    public synchronized void decrementer() {
        if (val > 0) {
            val--;
        }
    }

    public synchronized int getValeur() {
        return val;
    }
}


