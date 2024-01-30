use std::sync::{Arc, Mutex};
use std::collections::VecDeque;
use std::thread;
use std::time::Duration;

struct Paquet {
    contenu: String,
}

struct Tapis {
    file: VecDeque<Paquet>,
}

impl Tapis {
    fn new(capacity: usize) -> Self {
        Tapis {
            file: VecDeque::with_capacity(capacity),
        }
    }

    fn enfiler(&mut self, paquet: Paquet) {
        self.file.push_back(paquet);
    }

    fn defiler(&mut self) -> Option<Paquet> {
        self.file.pop_front()
    }
}

struct EtatPaquet {
    plus_de_paquet: bool,
}

fn main() {
    // Initialisation
    // NB MAX de producteurs est égal à la taille du tableau fruits
    let tapis = Arc::new(Mutex::new(Tapis::new(5)));
    let nb_prod = 5;
    let nb_cons = 5;
    let cible = 3;
    let fruits = vec!["mangue", "fraise", "framboise", "kiwi", "pomme", "banane", "lichi", "orange", "mandarine", "prune", "mure", "cassis"];
    let etat_production = Arc::new(Mutex::new(EtatPaquet { plus_de_paquet: false }));
    let compteur = Arc::new(Mutex::new(cible * nb_prod));

    // producteurs
    for i in 0..nb_prod {
        let tapis_clone = Arc::clone(&tapis);
        let fruits_clone = fruits.clone();

        thread::spawn(move || {
            for j in 0..cible {
                let paquet = Paquet { contenu: format!("{} {}", fruits_clone[i], j) };
                println!("Produit: {}", paquet.contenu);
                tapis_clone.lock().unwrap().enfiler(paquet);
            }
        });
    }

    // consommateurs
    for _ in 0..nb_cons {
        let tapis_clone = Arc::clone(&tapis);
        let compteur_clone = Arc::clone(&compteur);
        let etat_prod_clone = Arc::clone(&etat_production);

        thread::spawn(move || {
            loop {
                let mut tapis = tapis_clone.lock().unwrap();
                if let Some(paquet) = tapis.defiler() {
                    println!("Consommé: {}", paquet.contenu);
                    *compteur_clone.lock().unwrap() -= 1;

                    // si tous les paquets sont consommés
                    if *compteur_clone.lock().unwrap() == 0 {
                        // alors consommateur peut s'arrêter
                        *etat_prod_clone.lock().unwrap() = EtatPaquet { plus_de_paquet: true };
                        break;
                    }
                } else {
                    // vérifie si production terminée
                    if etat_prod_clone.lock().unwrap().plus_de_paquet{
                        break;
                    }
                }
            }
        });
    }

    println!("Tous les paquets ont été produits.");

    // Attends que tous les paquets soient consommés
    while *compteur.lock().unwrap() > 0 {
        thread::sleep(Duration::from_secs(1));
    }

    println!("Tous les paquets ont été consommés.");
}
