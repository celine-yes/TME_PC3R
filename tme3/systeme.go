package main

import (
    "bufio"
    "fmt"
    "log"
    "os"
    "strings"
    "time"
    "flag"
    "strconv"
)

type Paquet struct{
	Depart string
	Arrivee string 
	Arret int
}

func lecteur(nom_fichier string, c_trav chan string){
	//https://stackoverflow.com/questions/8757389/reading-a-file-line-by-line-in-go
	
	donnee, err := os.Open(nom_fichier)
	if err != nil {
        log.Fatal(err)
    }
    defer donnee.Close()

    scanner := bufio.NewScanner(donnee)

	for scanner.Scan() {
        c_trav <- scanner.Text()
        fmt.Println("lecteur a envoyé une ligne")
    }

    fmt.Println("lecteur a tout envoyé")

	if err := scanner.Err(); err != nil {
        log.Fatal(err)
    }


}

func travailleur(c_trav chan string, c_serveur chan chan Paquet, c_reduc chan Paquet){
	for line := range c_trav{
		splitline := strings.Split(line, ",")

		departureTime := splitline[2]
		arrivalTime := splitline[1]

		//c_s est le canal unique entre serveur et travailleur
		c_s := make(chan Paquet)
		c_serveur <- c_s
		//envoi du paquet au serveur de calcul
		c_s <- Paquet{Depart: departureTime, Arrivee: arrivalTime, Arret: 0}
        fmt.Println("travailleur envoie un paquet au serveur") 		
        //attend et recupère le paquet envoyé par le serveur
		paquet := <- c_s
        fmt.Println("travailleur récupère paquet traité") 		


		//envoi du paquet au reducteur
		c_reduc <- paquet
        fmt.Println("travailleur envoie paquet traité au réducteur") 		

	}
}

func serveur(c_serveur chan chan Paquet) {
    for c_s := range c_serveur{
        
        paquet := <-c_s
        fmt.Println("serveur recoit paquet") 		


        // Création d'une nouvelle goroutine pour calculer la durée de manière concurrente
        go func(p Paquet, c_s chan Paquet) {
            p.Arret = calculerDuree(p.Arrivee, p.Depart)
            c_s <- p
            fmt.Println("serveur envoie paquet traité au travailleur") 		

        }(paquet, c_s)
    }
}

//Pour éviter le probleme des heures dépassant 24h
func heureVersSecondes(heure string) (int, error) {
    //fmt.Println(heure)
    parties := strings.Split(heure, ":")
    if len(parties) != 3 {
        return 0, fmt.Errorf("format invalide")
    }
    heures, err := strconv.Atoi(parties[0])
    if err != nil {
        return 0, err
    }
    minutes, err := strconv.Atoi(parties[1])
    if err != nil {
        return 0, err
    }
    secondes, err := strconv.Atoi(parties[2])
    if err != nil {
        return 0, err
    }
    totalSecondes := heures*3600 + minutes*60 + secondes
    return totalSecondes, nil
}

func calculerDuree(arrivee, depart string) int {
    secondesArrivee, err1 := heureVersSecondes(arrivee)
    secondesDepart, err2 := heureVersSecondes(depart)

    if err1 != nil || err2 != nil {
        fmt.Println("Erreur lors de la conversion en secondes:", err1, err2)
        return 0
    }

    duree := secondesDepart - secondesArrivee
    return duree
}




func reducteur(c_reduc chan Paquet, c_fin chan int, fin chan bool){
	var compt int
	compt = 0
	var duree int
	duree = 0

	for {
        select {
        case paquet := <-c_reduc:
            fmt.Println("reducteur recoit paquet traité") 		
            compt++
            duree += paquet.Arret
        case <-fin:  //signal de fin
            resultat := 0
            if compt > 0 {
                resultat = duree / compt
            }
            c_fin <- resultat
            fmt.Println("reducteur envoie resultat")
            return
        }
    }

}

func main(){
	c_serveur := make (chan chan Paquet)
	c_fin := make (chan int)
    fin := make(chan bool)
	c_reduc := make (chan Paquet)
	c_trav := make (chan string)

	var tempsAttente time.Duration
    flag.DurationVar(&tempsAttente, "temps", 5*time.Second, "Temps d'attente avant la fin du temps")

    flag.Parse()

    nomFichier := "stop_times.txt"

    go lecteur(nomFichier, c_trav)
    go serveur(c_serveur)
    go reducteur(c_reduc, c_fin, fin)

    go travailleur(c_trav, c_serveur, c_reduc)
    go travailleur(c_trav, c_serveur, c_reduc)
    go travailleur(c_trav, c_serveur, c_reduc)
    
    time.Sleep(tempsAttente) // Attendre le temps spécifié

    fin <- true // Signaler la fin du traitement au réducteur
    resultat := <-c_fin // Récupérer le résultat du réducteur



    fmt.Printf("\n\nDurée d'arrêt moyenne: %d\n", resultat)


}