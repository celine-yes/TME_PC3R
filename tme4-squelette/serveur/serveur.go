package main

import (
	"fmt"
	"math/rand"
	"net"
	"os"
	"strconv"
	"strings"

	tr "serveur/travaux"

	st "serveur/structures"
)

var ADRESSE = "localhost"

var pers_vide = st.Personne{Nom: "", Prenom: "", Age: 0, Sexe: "M"}

// type d'un paquet de personne stocke sur le serveur, n'implemente pas forcement personne_int (qui n'exis
type personne_serv struct {
	id       int
	personne st.Personne
	afaire   []func(*st.Personne)
	statut   string
}

// type d'une requête pour gérer les requêtes envoyées par le client
type requete struct {
	id       int
	methode  string
	response chan string
}

// map de type (int, personne_serv)
var personnes = make(map[int]*personne_serv)

// cree une nouvelle personne_serv, est appelé depuis le client, par le proxy, au moment ou un producteur distant
// produit une personne_dist
func creer(id int) *personne_serv {
	p := &personne_serv{
		id:       id,
		personne: pers_vide,
		afaire : make([]func(*st.Personne), 0),
		statut:   "V",
	}
	personnes[id] = p
	return p
}

// Méthodes sur les personne_serv, on peut recopier des méthodes des personne_emp du client
// l'initialisation peut être fait de maniere plus simple que sur le client
// (par exemple en initialisant toujours à la meme personne plutôt qu'en lisant un fichier)
func (p *personne_serv) initialise() {
	p.personne = st.Personne{Nom: "Dupont", Prenom: "Jean", Age: 35, Sexe: "M"}

	// Initialisation des tâches
	nbTaches := rand.Intn(5) + 1
	p.afaire = make([]func(*st.Personne), nbTaches)
	for i := 0; i < nbTaches; i++ {
		tache := tr.UnTravail()
		p.afaire[i] = func(p *st.Personne) {
			*p = tache(*p)
		}
	}
	p.statut = "R"
}

// on peut recopier des méthodes des personne_emp du client
func (p *personne_serv) travaille() {
	if len(p.afaire) > 0 {
		tache := p.afaire[0]
		tache(&p.personne)
		p.afaire = p.afaire[1:] // supprime la tâche réalisée
	}
	if len(p.afaire) == 0 {
		p.statut = "C" // statut passé à "Fini"
	}
}

func (p *personne_serv) vers_string() string {
	return fmt.Sprintf("%s %s, %d, %s", p.personne.Prenom, p.personne.Nom, p.personne.Age, p.personne.Sexe)
}

func (p *personne_serv) donne_statut() string {
	return p.statut
}

// Goroutine qui maintient une table d'association entre identifiant et personne_serv
// il est contacté par les goroutine de gestion avec un nom de methode et un identifiant
// et il appelle la méthode correspondante de la personne_serv correspondante
func mainteneur(cRequetes chan requete) {
	for req := range cRequetes {
		switch req.methode {
		case "creer":
			p := creer(req.id)
			fmt.Println("Personne créée avec succès. ID: ", p.id)
			req.response <- fmt.Sprintf("Personne créée avec succès. ID: %d", p.id)
		case "initialise":
			if personne, ok := personnes[req.id]; ok {
				personne.initialise()
				fmt.Println("Initialisé")
				req.response <- "Initialisé"
			} else {
				req.response <- fmt.Sprintf("Personne avec ID %d non trouvée", req.id)
			}
		case "travaille":
			if personne, ok := personnes[req.id]; ok {
				personne.travaille()
				fmt.Println("Travail terminé")
				req.response <- "Travail terminé"
			} else {
				req.response <- fmt.Sprintf("Personne avec ID %d non trouvée", req.id)
			}
		case "vers_string":
			if personne, ok := personnes[req.id]; ok {
				req.response <- personne.vers_string()
			} else {
				req.response <- fmt.Sprintf("Personne avec ID %d non trouvée", req.id)
			}
		case "donne_statut":
			if personne, ok := personnes[req.id]; ok {
				req.response <- personne.donne_statut()
			} else {
				req.response <- fmt.Sprintf("Personne avec ID %d non trouvée", req.id)
			}
		default:
			req.response <- "Méthode inconnue"
		}
		close(req.response)
	}
}

// Goroutine de gestion des connections
// elle attend sur la socketi un message content un nom de methode et un identifiant et
// appelle le mainteneur avec ces arguments
// elle recupere le resultat du mainteneur et l'envoie sur la socket, puis ferme la socket
func gere_connection(conn net.Conn, cRequetes chan requete) {
	defer conn.Close()

	for{
		// buffer pour lire la requête entrante
		buffer := make([]byte, 1024)
		n, err := conn.Read(buffer)
		if err != nil {
			return
		}

		//convertir le buffer en string et extraire les informations
		reqDetails := strings.TrimSpace(string(buffer[:n]))
		parts := strings.Split(reqDetails, " ")
		if len(parts) != 2 {
			fmt.Println("Format de requête invalide:", reqDetails)
			return
		}

		methode := parts[0]
		id, err := strconv.Atoi(parts[1])
		if err != nil {
			fmt.Println("ID invalide:", parts[1])
			return
		}

		//préparer et envoyer l'action au mainteneur
		cReponse := make(chan string)
		act := requete{
			id:       id,
			methode:  methode,
			response: cReponse,
		}
		cRequetes <- act

		//attendre et récupérer la réponse du mainteneur
		response := <-cReponse

		//envoyer la réponse au client
		_, err = conn.Write([]byte(response + "\n"))
		if err != nil {
			fmt.Println("Erreur lors de l'envoi de la réponse:", err)
		}
	}	
}

func main() {

	//pour verifier si port à utiliser est fourni en tant qu'argument
	if len(os.Args) < 2 {
		fmt.Println("Format: client <port>")
		return
	}
	port, _ := strconv.Atoi(os.Args[1])
	//addr := ADRESSE + ":" + fmt.Sprint(port)

	//canal pour recevoir les requêtes
	cRequetes := make(chan requete)
	go mainteneur(cRequetes)

	//créer un serveur TCP écoutant sur le port spécifié
	listener, err := net.Listen("tcp", ":"+strconv.Itoa(port))
	if err != nil {
		fmt.Errorf("failed to start server: %v", err)
	}
	defer listener.Close()

	fmt.Println("Serveur démarré. En attente de connexions...")

	//boucle infinie pour accepter les connexions entrantes
	for {
		//accepter une nouvelle connexion
		conn, err := listener.Accept()
		if err != nil {
			fmt.Printf("Erreur lors de l'acceptation d'une connexion: %v\n", err)
			continue
		}
		go gere_connection(conn, cRequetes) 
	}

}
