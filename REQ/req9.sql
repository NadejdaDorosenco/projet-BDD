\! echo "Une requête impliquant le calcul de deux agrégats"
\! echo "La somme par continent du nombre de voyages qui terminent dans le continent"

SELECT SUM(nb),port.localisation
FROM(SELECT COUNT(*) as nb,destination
    FROM voyage
    WHERE destination IS NOT NULL
    GROUP BY(destination)) as nb_dest JOIN port ON (nb_dest.destination=port.nom)
GROUP BY(port.localisation)
;

