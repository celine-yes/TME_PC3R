package main

import (
	"fmt"
	"net"
	"os"
	"strconv"
	"strings"

	st "../client/structures"
)

var ADRESSE = "localhost"

var pers_vide = st.Personne{Nom: "", Prenom: "", Age: 0, Sexe: "M"}

// type d'un paquet de personne stocke sur le serveur, n'implemente pas forcement personne_int (qui n'existe pas ici)
type personne_serv struct {
	id       int
	personne st.Personne
	statut   string
}

// cree une nouvelle personne_serv, est appelé depuis le client, par le proxy, au moment ou un producteur distant
// produit une personne_dist
var dernierID int = 0
var personnes = make(map[int]*personne_serv)

func creer(id int) *personne_serv {
	dernierID++
	p := &personne_serv{
		id:       dernierID,
		personne: pers_vide,
		statut:   "V",
	}
	personnes[dernierID] = p
	return p
}

// Méthodes sur les personne_serv, on peut recopier des méthodes des personne_emp du client
// l'initialisation peut être fait de maniere plus simple que sur le client
// (par exemple en initialisant toujours à la meme personne plutôt qu'en lisant un fichier)
func (p *personne_serv) initialise() {
	//simplifié
	p.personne = st.Personne{Nom: "Dupont", Prenom: "Jean", Age: 35, Sexe: "M"}
	p.statut = "R"
}

func (p *personne_serv) travaille() {
	p.personne.Age++ // Exemple simple d'opération
	p.statut = "C"
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
type requete struct {
	id       int
	methode  string
	response chan string
}

func mainteneur(cRequetes chan requete) {
	for req := range cRequetes {
		if personne, ok := personnes[req.id]; ok {
			switch req.methode {
			case "initialise":
				personne.initialise()
				req.response <- "Initialisé"
			case "travaille":
				personne.travaille()
				req.response <- "Travail terminé"
			case "vers_string":
				resultat := personne.vers_string()
				req.response <- resultat
			case "donne_statut":
				statut := personne.donne_statut()
				req.response <- statut
			default:
				req.response <- "Méthode inconnue"
			}
		} else {
			req.response <- fmt.Sprintf("Personne avec ID %d non trouvée", act.id)
		}
		close(req.response)
	}
}

// Goroutine de gestion des connections
// elle attend sur la socketi un message content un nom de methode et un identifiant et appelle le mainteneur avec ces arguments
// elle recupere le resultat du mainteneur et l'envoie sur la socket, puis ferme la socket
func gere_connection(conn net.Conn, cRequetes chan requete) {
	defer conn.Close()

	// Créer un buffer pour lire la requête entrante
	buffer := make([]byte, 1024)
	n, err := conn.Read(buffer)
	if err != nil {
		fmt.Println("Erreur lors de la lecture de la requête:", err)
		return
	}

	// Convertir le buffer en string et extraire les informations
	// Supposons que la requête est formatée comme "methode id"
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

	// Préparer et envoyer l'action au mainteneur
	cReponse := make(chan string)
	act := requete{
		id:       id,
		methode:  methode,
		response: cReponse,
	}
	cRequetes <- act

	// Attendre et récupérer la réponse du mainteneur
	response := <-cReponse

	// Envoyer la réponse au client
	_, err = conn.Write([]byte(response + "\n"))
	if err != nil {
		fmt.Println("Erreur lors de l'envoi de la réponse:", err)
	}
}

func main() {
	if len(os.Args) < 2 {
		fmt.Println("Format: client <port>")
		return
	}
	port, _ := strconv.Atoi(os.Args[1]) // doit être le meme port que le client
	addr := ADRESSE + ":" + fmt.Sprint(port)
	// A FAIRE: creer les canaux necessaires, lancer un mainteneur

	cRequetes := make(chan requete)
	go mainteneur(cRequetes)

	ln, _ := net.Listen("tcp", addr) // ecoute sur l'internet electronique
	fmt.Println("Ecoute sur", addr)
	for {
		conn, _ := ln.Accept() // recoit une connection, cree une socket
		fmt.Println("Accepte une connection.")
		go gere_connection(conn, cRequetes) // passe la connection a une routine de gestion des connections
	}
}
