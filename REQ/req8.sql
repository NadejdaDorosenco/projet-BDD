\! echo "Requête d'agrégats nécessitant un group by et un having"
\! echo "Tous les ports d'Afrique dont les pays sont en guerre avec aucun autre pays"

SELECT port.nom
FROM port
WHERE port.localisation='Afrique'
GROUP BY(port.nom)
HAVING port.nationalite IN (SELECT DISTINCT nation1
                            FROM relation_diplomatique R1
                            WHERE NOT EXISTS(
                                SELECT *
                                FROM relation_diplomatique R2
                                WHERE R1.nation1=R2.nation1
                                    AND R2.nation1<>R2.nation2
                                    AND R2.type_de_relation='En guerre'
                            )
);






