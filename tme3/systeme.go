import (
    "bufio"
    "fmt"
    "io"
    "strconv"
    "os"
	"flag"
	"time"
)

type Paquet struct{
	depart string
	arrivee string 
	arret int
}

func lecteur(nom_fichier string, c_trav chan string){
	//https://stackoverflow.com/questions/8757389/reading-a-file-line-by-line-in-go
	
	donnee, err := os.Open(nom_fichier)
	if err != nil {
        log.Fatal(err)
    }
    defer file.Close()

    scanner := bufio.NewScanner(file)

	for scanner.Scan() {
        c_trav <- scanner.Text()
    }

	if err := scanner.Err(); err != nil {
        log.Fatal(err)
    }


}

func travailleur(c_trav chan string, c_serveur chan chan interface {}, c_reduc chan Paquet){
	for true{
		line := <- c_trav
		splitline := strings.Split(line, ",")

		departureTime := splitline[2]
		arrivalTime := splitline[1]

		//c_s est le canal unique entre serveur et travailleur
		c_s := make(chan interface {})
		c_serveur <- c_s
		//envoi du paquet au serveur de calcul
		c_s <- Paquet(depart : departureTime, arrivee : arrivalTime, arret:0)
		//attend et recupère le paquet envoyé par le serveur
		paquet := <- c_s

		//envoi du paquet au reducteur
		c_reduc <- paquet
	}

}

func serveur(c_serveur chan chan Paquet) {
    for {
        c_s := <-c_serveur
        paquet := <-c_s

        // Création d'une nouvelle goroutine pour calculer la durée de manière concurrente
        go func(p Paquet) {
            p.arret = calculerDuree(p.Arrivee, p.Depart)
            c_s <- p
        }(paquet)
    }
}

func calculerDuree(arrive string, depart string) int{
	int_arrive, err1 := strconv.Atoi(arrive)
	int_depart, err2 := strconv.Atoi(depart)
    if err1 != nil || err2 != nil{
        fmt.Println("Erreur lors de la conversion:", err)
        return
    }

	return int_depart - int_arrive

}

func reducteur(c_reduc chan Paquet, c_fin chan int){
	var compt int
	compt := 0
	var duree int
	duree := 0

	for {
        select {
        case paquet := <-c_reduc:
            compt++
            duree += paquet.arret
        case <-c_fin:
            // Signal de fin de temps reçu, envoi de la valeur calculée au processus principal
            resultat := 0
            if compt > 0 {
                resultat = duree / compt
            }
            c_fin <- resultat
            return
        }
    }

}

func main(){
	c_serveur := make (chan chan interface{})
	c_fin := make (chan int)
	c_reduc := make (chan Paquet)
	c_trav := make (chan string)

	var tempsAttente time.Duration
    flag.DurationVar(&tempsAttente, "temps", 5*time.Second, "Temps d'attente avant la fin du temps")

    // Parsing des drapeaux (flags) de la ligne de commande
    flag.Parse()


}