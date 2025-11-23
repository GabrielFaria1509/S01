deus_maior(Deus) :-
    local_principal(Deus, olimpo),    % 1. Tem que morar no Olimpo
    dominio(Deus, Dom1),              % 2. Encontre um domínio (chamaremos de Dom1)
    dominio(Deus, Dom2),              % 3. Encontre um domínio (chamaremos de Dom2)
    Dom1 \= Dom2.                     % 4. IMPORTANTE: Dom1 tem que ser diferente de Dom2

Deus = zeus
Deus = apolo
Deus = atena
