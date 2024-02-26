package main

import (
	"bufio"
	st "client/structures" // contient la structure Personne
	tr "client/travaux"    // contient les fonctions de travail sur les Personnes
	"fmt"
	"log"
	"math/rand"
	"net"
	"os"
	"regexp"
	"strconv"
	"strings"
	"time"
)

var ADRESSE string = "localhost"                           // adresse de base pour la Partie 2
var FICHIER_SOURCE string = "./conseillers-municipaux.txt" // fichier dans lequel piocher des personnes
var TAILLE_SOURCE int = 450000                             // inferieure au nombre de lignes du fichier, pour prendre une ligne au hasard
var TAILLE_G int = 5                                       // taille du tampon des gestionnaires
var NB_G int = 2                                           // nombre de gestionnaires
var NB_P int = 2                                           // nombre de producteurs
var NB_O int = 4                                           // nombre d'ouvriers
var NB_PD int = 2                                          // nombre de producteurs distants pour la Partie 2

var pers_vide = st.Personne{Nom: "", Prenom: "", Age: 0, Sexe: "M"} // une personne vide

// paquet de personne, sur lequel on peut travailler, implemente l'interface personne_int
type personne_emp struct {
	personne st.Personne
	ligne    int
	afaire   []func(*st.Personne)
	statut   string //"V" à l'initialisation?, "R" ou "C"
}

// paquet de personne distante, pour la Partie 2, implemente l'interface personne_int
type personne_dist struct {
	id int //identifiant dans personne_serv
	cProxy chan requete //pour envoyer les requetes
}

// type d'une requête pour gérer les requêtes envoyées par le client
type requete struct {
	id       int
	methode  string
	response chan string
}

// interface des personnes manipulees par les ouvriers, les
type personne_int interface {
	initialise()          // appelle sur une personne vide de statut V, remplit les champs de la personne et passe son statut à R
	travaille()           // appelle sur une personne de statut R, travaille une fois sur la personne et passe son statut à C s'il n'y a plus de travail a faire
	vers_string() string  // convertit la personne en string
	donne_statut() string // renvoie V, R ou C
}

// fabrique une personne à partir d'une ligne du fichier des conseillers municipaux
// à changer si un autre fichier est utilisé
func personne_de_ligne(l string) st.Personne {
	separateur := regexp.MustCompile(",") // oui, les donnees sont separees par des tabulations ... merci la Republique Francaise
	separation := separateur.Split(l, -1)
	naiss, _ := time.Parse("2/1/2006", separation[7])
	a1, _, _ := time.Now().Date()
	a2, _, _ := naiss.Date()
	agec := a1 - a2
	return st.Personne{Nom: separation[4], Prenom: separation[5], Sexe: separation[6], Age: agec}
}

// *** METHODES DE L'INTERFACE personne_int POUR LES PAQUETS DE PERSONNES ***

func (p *personne_emp) initialise() {
	//création d'un canal pour chaque initialise pour avoir la bonne ligne
	cLigne := make(chan string)
	go lecteur(p.ligne, cLigne) //goroutine lectrice
	ligne := <-cLigne

	p.personne = personne_de_ligne(ligne)

	// Initialisation des tâches
	nbTaches := rand.Intn(5) + 1
	p.afaire = make([]func(*st.Personne), nbTaches)
	for i := 0; i < nbTaches; i++ {
		//fonction de travail
		tache := tr.UnTravail()
		p.afaire[i] = func(p *st.Personne) {
			*p = tache(*p)
		}
	}
	p.statut = "R"
}

func (p *personne_emp) travaille() {
	if len(p.afaire) > 0 {
		tache := p.afaire[0]
		//applique à la personne la fonction de travail
		tache(&p.personne)
		p.afaire = p.afaire[1:] // Supprime la tâche réalisée
	}
	if len(p.afaire) == 0 {
		p.statut = "C" // Statut passé à "Fini"
	}
}

func (p *personne_emp) vers_string() string {
	return fmt.Sprintf("%s %s, %d, %s", p.personne.Prenom, p.personne.Nom, p.personne.Age, p.personne.Sexe)
}

func (p *personne_emp) donne_statut() string {
	return p.statut
}

// *** METHODES DE L'INTERFACE personne_int POUR LES PAQUETS DE PERSONNES DISTANTES (PARTIE 2) ***
// ces méthodes doivent appeler le proxy (aucun calcul direct)

func (p personne_dist) initialise() {
	// response, err := proxy("initialise", p.id)
	// if err != nil {
	// 	fmt.Println("Erreur lors de l'initialisation de la personne_dist:", err)
	// 	return
	// }

	serveurResponse := make(chan string)
	request := requete{
		id : p.id,
		methode : "initialise",
		response : serveurResponse,
	}
	p.cProxy <- request
	
	// Attendre la réponse du serveur
	res := <- serveurResponse
	fmt.Println("Réponse du serveur à l'initialisation:", res)

}

func (p personne_dist) travaille() {

	serveurResponse := make(chan string)
	request := requete{
		id : p.id,
		methode : "travaille",
		response : serveurResponse,
	}
	p.cProxy <- request

	// Attendre la réponse du serveur
	res := <- serveurResponse
	fmt.Println("Réponse du serveur au travail:", res)
}

func (p personne_dist) vers_string() string {

	serveurResponse := make(chan string)
	request := requete{
		id : p.id,
		methode : "vers_string",
		response : serveurResponse,
	}
	p.cProxy <- request
	return <- serveurResponse
}

func (p personne_dist) donne_statut() string {

	serveurResponse := make(chan string)
	request := requete{
		id : p.id,
		methode : "donne_statut",
		response : serveurResponse,
	}
	p.cProxy <- request
	return <- serveurResponse
}

// *** CODE DES GOROUTINES DU SYSTEME ***
// type d'une requête pour gérer les requêtes envoyées par le client

// Partie 2: contacté par les méthodes de personne_dist, le proxy appelle la méthode à travers le réseau et récupère le résultat
// il doit utiliser une connection TCP sur le port donné en ligne de commande
func proxy(cProxy chan requete, port string) error {

	// Établir une connexion TCP avec le serveur
	conn, err := net.Dial("tcp", ADRESSE+":"+ port)
	if err != nil {
		return fmt.Errorf("failed to connect to server: %v", err)
	}
	defer conn.Close()

	for{
		message, ok := <- cProxy
		if !ok {
			return nil // Le canal cProxy est fermé, terminer la fonction
		}

		// Envoyer la requête au serveur
		request := fmt.Sprintf("%s %d", message.methode, message.id)
		_, err = conn.Write([]byte(request + "\n"))
		if err != nil {
			return fmt.Errorf("failed to send request: %v", err)
		}

		// Lire la réponse du serveur
		reponse, err := bufio.NewReader(conn).ReadString('\n')
		if err != nil {
			return fmt.Errorf("failed to read response: %v", err)
		}
		message.response <- strings.TrimSpace(reponse)
	}
}

// Partie 1 : contacté par la méthode initialise() de personne_emp, récupère une ligne donnée dans le fichier source
func lecteur(n int, cLigne chan string) {

	file, err := os.Open(FICHIER_SOURCE)
	if err != nil {
		log.Fatalf("Erreur lors de l'ouverture du fichier : %v", err)
	}
	defer file.Close()

	scanner := bufio.NewScanner(file)
	currentLine := 0
	ligne := "null"

	for scanner.Scan() {
		if currentLine == n {
			ligne = scanner.Text()
		}
		currentLine++
	}
	cLigne <- ligne
}

// Partie 1: récupèrent des personne_int depuis les gestionnaires, font une opération dépendant de donne_statut()
// Si le statut est V, ils initialise le paquet de personne puis le repasse aux gestionnaires
// Si le statut est R, ils travaille une fois sur le paquet puis le repasse aux gestionnaires
// Si le statut est C, ils passent le paquet au collecteur
func ouvrier(cGestionOuvrier chan personne_int, cOuvrierGestion chan personne_int, cCollecteur chan personne_int) {
	fmt.Println("Ouvrier a démarré \n")
	for {
		select {
		case paquet := <-cGestionOuvrier:
			statut := paquet.donne_statut()
			switch statut {
			case "V": //paquet vide
				paquet.initialise()
				fmt.Println("Ouvrier: Paquet initialisé")
				cOuvrierGestion <- paquet
				fmt.Println("Ouvrier: Paquet envoyé à Gestionnaire")
			case "R": //paquet en cours de modification
				paquet.travaille()
				fmt.Println("Ouvrier: travaille")
				// //vérifier si plus de taches
				// if paquet.donne_statut() == "C" {
				// 	cCollecteur <- paquet
				// 	fmt.Println("Ouvrier: Paquet envoyé à Collecteur")
				// } else {
				cGestionOuvrier <- paquet
				fmt.Println("Ouvrier: Paquet envoyé à Gestionnaire")
				// }
			case "C":
				cCollecteur <- paquet
				fmt.Println("Ouvrier: Paquet envoyé à Collecteur")
			}
		}
	}
}

// Partie 1: les producteurs cree des personne_int implementees par des personne_emp initialement vides,
// de statut V mais contenant un numéro de ligne (pour etre initialisee depuis le fichier texte)
// la personne est passée aux gestionnaires
func producteur(cGestionnaire chan personne_int) {
	fmt.Println("Producteur a démarré \n")
	for {
		nouvellePersonne := personne_emp{
			personne: st.Personne{Nom: "", Prenom: "", Age: 0, Sexe: "M"}, // Utiliser pers_vide si vous préférez
			ligne:    rand.Intn(TAILLE_SOURCE) + 1,                        // Générer un numéro de ligne aléatoire
			afaire:   nil,                                                 // Pas de tâches assignées initialement
			statut:   "V",                                                 // Statut initial à "V"
		}

		// Envoyer la nouvelle personne au gestionnaire
		//fmt.Println("Producteur: paquet vide envoyé \n")
		cGestionnaire <- &nouvellePersonne
	}
}

// Partie 2: les producteurs distants cree des personne_int implementees par des personne_dist qui contiennent un identifiant unique
// utilisé pour retrouver l'object sur le serveur
// la creation sur le client d'une personne_dist doit declencher la creation sur le serveur d'une "vraie" personne, initialement vide, de statut V
func producteur_distant(cProxy chan requete, cGestionnaire chan personne_int) {

	for{
		// Générer un ID unique pour la démonstration; dans une application réelle, cela pourrait être plus complexe
		uniqueID := rand.Int() // Supposer l'importation de "math/rand"
		nouvellePersonneDist := personne_dist{
			id : uniqueID,
			cProxy : cProxy,
		}

		serveurResponse := make(chan string)
		request := requete{
			id : uniqueID,
			methode : "creer",
			response : serveurResponse,
		}
		// envoyer message au proxy pour créer une nouvelle personne_dist sur le serveur
		cProxy <- request
		// Attendre la réponse du serveur
		res := <-serveurResponse
		fmt.Println("Réponse du serveur à la création:", res)
		cGestionnaire <- nouvellePersonneDist
	}
}

// Partie 1: les gestionnaires recoivent des personne_int des producteurs et des ouvriers et maintiennent chacun une file de personne_int
// ils les passent aux ouvriers quand ils sont disponibles
// ATTENTION: la famine des ouvriers doit être évitée: si les producteurs inondent les gestionnaires de paquets, les ouvrier ne pourront
// plus rendre les paquets surlesquels ils travaillent pour en prendre des autres
func gestionnaire(cProdGestion chan personne_int, cGestionOuvrier chan personne_int, cOuvrierGestion chan personne_int) {
	var fileAttente []personne_int // File d'attente des paquets à traiter
	fmt.Println("Gestionnaire a démarré \n")
	for {
		// Essayer d'ajouter des paquets à la file d'attente si elle n'est pas pleine
		if len(fileAttente) < TAILLE_G/2 {
			select {
			case paquetProd := <-cProdGestion:
				// Nouveau paquet des producteurs
				fmt.Println("Gestionnaire: ajout paquet vide dans file")
				fileAttente = append(fileAttente, paquetProd)
			default:
				// Si aucun paquet n'est immédiatement disponible, passer à l'envoi des paquets aux ouvriers
			}
		} else {
			if len(fileAttente) < TAILLE_G {
				select {
				case paquetRetour := <-cOuvrierGestion:
					// Paquet retourné par un ouvrier
					fmt.Println("Gestionnaire: ajout paquet traité dans file")
					fileAttente = append(fileAttente, paquetRetour)
				default:
				}
			}
		}
		// S'assurer que la logique d'envoi des paquets aux ouvriers fonctionne même si la file est pleine
		if len(fileAttente) > 0 {
			select {
			case cGestionOuvrier <- fileAttente[0]:
				fmt.Println("Gestionnaire: paquet envoyé à un ouvrier")
				fileAttente = fileAttente[1:]
			default:
				// Si aucun ouvrier n'est disponible, introduire un court délai pour éviter une boucle serrée
				// et donner du temps aux ouvriers de devenir disponibles
				time.Sleep(1 * time.Millisecond)
			}
		} else {
			// Si la file d'attente est vide, introduire un court délai pour éviter une consommation CPU inutile
			// en attendant de nouveaux paquets
			time.Sleep(1 * time.Millisecond)
		}
	}
}

// Partie 1: le collecteur recoit des personne_int dont le statut est c, il les collecte dans un journal
// quand il recoit un signal de fin du temps, il imprime son journal.
func collecteur(cCollecteur chan personne_int, cFin chan int) {
	journal := "" // Initialiser le journal comme une chaîne vide
	fmt.Println("Collecteur a démarré \n")
	for {
		select {
		case paquet := <-cCollecteur:
			fmt.Println("Collecteur: paquet recu \n")
			journal += paquet.vers_string() + "\n"
		case <-cFin:
			// Lorsque le signal de fin est reçu, imprimer le journal et sortir de la boucle
			fmt.Println("Journal du collecteur :\n")
			fmt.Println(journal)
			fmt.Println("Collecteur a fini \n")
			cFin <- 0
			return // Sortir de la fonction après avoir imprimé le journal
		}
	}
}

func main() {
	rand.Seed(time.Now().UTC().UnixNano()) // graine pour l'aleatoire
	if len(os.Args) < 3 {
		fmt.Println("Format: client <port> <millisecondes d'attente>")
		return
	}
	port := os.Args[1]  // utile pour la partie 2
	millis, _ := strconv.Atoi(os.Args[2]) // duree du timeout
	fintemps := make(chan int)

	//les canaux
	cProdGestion := make(chan personne_int)
	cCollecteur := make(chan personne_int)
	cGestionOuvrier := make(chan personne_int)
	cOuvrierGestion := make(chan personne_int)
	cProxy := make(chan requete)

	// lancer les goroutines (parties 1 et 2): 1 lecteur, 1 collecteur, des producteurs, des gestionnaires, des ouvriers
	go collecteur(cCollecteur, fintemps)
	for i := 0; i < NB_G; i++ {
		go gestionnaire(cProdGestion, cGestionOuvrier, cOuvrierGestion)
	}
	for i := 0; i < NB_P; i++ {
		go producteur(cProdGestion)
	}
	for i := 0; i < NB_O; i++ {
		go ouvrier(cGestionOuvrier, cOuvrierGestion, cCollecteur)
	}

	// lancer les goroutines (partie 2): des producteurs distants, un proxy
	go proxy(cProxy, port)
	for i := 0; i < NB_PD; i++ {
		go producteur_distant(cProxy, cProdGestion )
	}

	time.Sleep(time.Duration(millis) * time.Millisecond)
	fintemps <- 0
	<-fintemps
}
