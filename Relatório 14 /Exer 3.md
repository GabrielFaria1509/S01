irmaos_germanos(X, Y) :-
    progenitor(Pai, X),      % 1. Existe um Pai que é pai de X
    progenitor(Pai, Y),      % 2. Esse mesmo Pai também é pai de Y
    progenitor(Mae, X),      % 3. Existe uma Mãe que é mãe de X
    progenitor(Mae, Y),      % 4. Essa mesma Mãe também é mãe de Y
    Pai \= Mae,              % 5. O Pai e a Mãe são pessoas diferentes (evita redundância)
    X \= Y.                  % 6. X e Y não são a mesma pessoa


Y = poseidon
Y = hades
