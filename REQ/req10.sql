\! echo "Une requête impliquant le calcul de deux agrégats"
\! echo "La moyenne des pays neutres"

SELECT AVG(nb_neutre)
FROM(SELECT COUNT(DISTINCT nation1) as nb_neutre
    FROM relation_diplomatique
    WHERE type_de_relation='Neutre') as S
;