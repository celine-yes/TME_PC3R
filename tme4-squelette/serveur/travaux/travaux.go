package travaux

import (
	"math/rand"

	st "serveur/structures"
)

// *** LISTES DE FONCTION DE TRAVAIL DE Personne DANS Personne DU SERVEUR ***
// Essayer de trouver des fonctions *différentes* de celles du client

//Change le prenom
func f1(p st.Personne) st.Personne {
	np := p
	if np.Sexe == "M" {
		np.Prenom = "Serv_" + p.Prenom
	} else {
		np.Prenom = "Serv_" + p.Prenom
	}
	return np
}

//Incrémente l'âge de 5
func f2(p st.Personne) st.Personne {
	np := p
	np.Age = np.Age + 5
	return np
}

// Change le nom
func f3(p st.Personne) st.Personne {
	np := p
	nom := p.Nom + "_serv" 
	np.Nom = nom
	return np
	
}

//Change le code sexe
func f4(p st.Personne) st.Personne {
	np := p
	if p.Sexe == "M" {
		np.Sexe = "F_serv"
	} else {
		np.Sexe = "M_serv"
	}
	return np
}

func UnTravail() func(st.Personne) st.Personne {
	tableau := make([]func(st.Personne) st.Personne, 0)
	tableau = append(tableau, func(p st.Personne) st.Personne { return f1(p) })
	tableau = append(tableau, func(p st.Personne) st.Personne { return f2(p) })
	tableau = append(tableau, func(p st.Personne) st.Personne { return f3(p) })
	tableau = append(tableau, func(p st.Personne) st.Personne { return f4(p) })
	i := rand.Intn(len(tableau))
	return tableau[i]
}
