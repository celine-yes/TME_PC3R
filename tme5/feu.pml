mtype {ROUGE, ORANGE, VERT, INDETERMINE}

proctype feu(chan observe){
    bool clignotant = false;
    mtype couleur = INDETERMINE;

    initial:
        atomic{
            couleur = ORANGE;
            clignotant = true;
            observe! couleur, clignotant
        }
        
        if
        ::true -> clignotant = false; goto gored;
        ::true -> goto initial;
        fi
    
    gored:
        atomic{
            couleur = ROUGE;
            observe! couleur, clignotant
        }

        if
        ::true ->goto gogreen;
        ::true ->goto gored;
        ::true ->goto fault;
        fi

    gogreen:
        atomic{
            couleur = VERT;
            observe! couleur, clignotant
        }

        if
        ::true ->goto goorange;
        ::true ->goto gogreen;
        ::true ->goto fault;
        fi

    goorange:
        atomic{
            couleur = ORANGE;
            observe! couleur, clignotant
        }

        if
        ::true ->goto gored;
        ::true ->goto goorange;
        ::true ->goto fault;
        fi
    
    fault:
        atomic{
            couleur = ORANGE;
            clignotant = true;
            observe! couleur, clignotant
        }

        if
        ::true -> goto fault;
        fi
}

proctype observateur(chan observe){
    mtype precedent = INDETERMINE;
    mtype couleur = INDETERMINE;
    bool clignote = false;

    do 
    :: observe?couleur, clignote ->
        if 
        :: atomic{ couleur == ORANGE ->
                        assert(clignote == true || precedent != ROUGE );
                        precedent = ORANGE
        };
        :: atomic{ couleur == VERT ->
                        assert(precedent != ORANGE );
                        precedent = VERT
        };
        :: atomic{ couleur == ROUGE ->
                        assert(precedent != VERT );
                        precedent = ROUGE
        };
        :: atomic{ clignote == true ->
                        assert(couleur == ORANGE );
        };
        fi
    od
    printf("Observateur: couleur = %d \n", precedent);
}
//version naive
/*
proctype observateur(chan observe){
    mtype precedent = INDETERMINE;
    mtype couleur = INDETERMINE;
    bool clignote = false;

    do 
    :: observe?couleur, clignote ->
        if 
        :: couleur == ORANGE ->
                    assert(clignote == true || precedent != ROUGE );
                    precedent = ORANGE
    
        :: couleur == VERT ->
                    assert(precedent != ORANGE );
                    precedent = VERT
    
        :: couleur == ROUGE ->
                assert(precedent != VERT );
                precedent = ROUGE

        :: clignote == true ->
                assert(couleur == ORANGE );
        fi
    od
    printf("Observateur: couleur = %d \n", precedent);
}
*/

init{
    chan observe = [0] of {mtype, bool};
    run feu(observe);
    run observateur(observe);
}