\! echo "Une requete avec une jointure externe"
\! echo "Toutes les personnes qui n'ont pas voyagés"

SELECT nom,prenom
FROM (personne NATURAL LEFT JOIN passagers)T
WHERE T.id_voyage IS NULL;