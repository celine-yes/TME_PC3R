use std::sync::{Arc, Mutex};
use std::collections::VecDeque;
use std::thread;
use std::sync::mpsc;
use std::time::Duration;



struct Paquet {
    contenu: String,
}


struct Tapis {
    file: VecDeque<Paquet>,
}

impl Tapis {

    fn enfiler(&mut self, paquet: Paquet) {
        self.file.push_back(paquet);
    }

    fn defiler(&mut self) -> Option<Paquet> {
        self.file.pop_front()
    }
}

struct EtatProduction {
    production_terminee: bool,
}



fn main() {
    let tapis = Arc::new(Mutex::new(Tapis { file: VecDeque::new() }));
    let compteur = Arc::new(Mutex::new(0));
    let (tx, rx) = mpsc::channel();
    let nbProd = 5;
    let nbCons = 5;
    let cible = 3;
    let fruits = vec!["Mangue", "Fraise", "Framboise", "Pomme", "Raisin"];
    let etat_production = Arc::new(Mutex::new(EtatProduction { production_terminee: false }));

    // Création des threads producteurs
    for i in 0..nbProd {
		let tapis_clone = Arc::clone(&tapis);
    	let tx_clone = tx.clone();
    	let fruits_clone = fruits.clone();

    	thread::spawn(move || {
		    for j in 0..cible {
		        let paquet = Paquet { contenu: format!("{} {}", fruits_clone[i], j) };
		        println!("Produit: {}", paquet.contenu);
		        tapis_clone.lock().unwrap().enfiler(paquet);
		        tx_clone.send(()).unwrap();
		    }
    	});
    	
    }

    // Création des threads consommateurs
    for _ in 0..nbCons {
        let tapis_clone = Arc::clone(&tapis);
        let compteur_clone = Arc::clone(&compteur);
        let etat_prod_clone = Arc::clone(&etat_production);

        thread::spawn(move || {
            loop {
                let mut tapis = tapis_clone.lock().unwrap();
                if let Some(paquet) = tapis.defiler() {
                    println!("Consommé: {}", paquet.contenu);
                    *compteur_clone.lock().unwrap() += 1;
                } else {
                    // Vérifie si la production est terminée
                    if etat_prod_clone.lock().unwrap().production_terminee {
                        break;
                    }
                }
            }
        });
    }

    // Attente que tous les paquets soient produits
    for _ in 0..5 {
        rx.recv().unwrap();
    }
    println!("Tous les paquets ont été produits.");

    // Attente que tous les paquets soient consommés
    thread::sleep(Duration::from_secs(1));
    let compteur_final = compteur.lock().unwrap();
    println!("Nombre de paquets consommés: {}", *compteur_final);
}









