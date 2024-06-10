\! echo "Requête d'agrégats nécessitant un groupby et un having"
\! echo "Les personnes ayant effectuées au moins 3 voyages"

SELECT nom,prenom
FROM personne P
GROUP BY(id_personne)
HAVING (SELECT count(*) as nb
        FROM (voyage NATURAL JOIN passagers) VP
        WHERE VP.id_personne=P.id_personne
)>2;