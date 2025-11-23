divindade_olimpica(Deus) :-
    progenitor(cronos, Deus),           
    (
        dominio(Deus, ceu);             
        dominio(Deus, mar);             
        dominio(Deus, submundo)         
    ).

 divindade_olimpica(X).

X = zeus ;
X = poseidon ;
X = hades.
