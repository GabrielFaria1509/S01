divindade_olimpica(Deus) :-
    progenitor(cronos, Deus),           % O Deus tem de ser filho de Cronos E
    (
        dominio(Deus, ceu);             % O domínio é o céu OU
        dominio(Deus, mar);             % O domínio é o mar OU
        dominio(Deus, submundo)         % O domínio é o submundo
    ).

?- divindade_olimpica(X).

X = zeus ;
X = poseidon ;
X = hades.
