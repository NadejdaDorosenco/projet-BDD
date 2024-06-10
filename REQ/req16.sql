\! echo "Un requête récursive"
\! echo "Tous les ports par lesquels MARFR01 est passé"

WITH RECURSIVE Suivant(port_depart,port_arrivee,n,id) AS
(
    SELECT provenance,nom,numero_etape,id_voyage
    FROM (voyage NATURAL JOIN etape_transitoire)
    WHERE id_navire='MARFR01'
    AND numero_etape=1

    UNION

    SELECT Suivant.port_arrivee,T.nom,n+1,id_voyage
    FROM (voyage NATURAL JOIN etape_transitoire)T,Suivant
    WHERE T.id_navire='MARFR01'
    AND T.numero_etape=(n+1)
),

Trajet AS
(
    (SELECT port_depart,port_arrivee,n as num_etape,id
    FROM Suivant

    UNION

    SELECT Suivant.port_arrivee,voyage.destination,Suivant.n+1 as num_etape,id
    FROM Suivant JOIN voyage ON (Suivant.id=voyage.id_voyage)
    WHERE Suivant.n=(SELECT MAX(n)
                    FROM Suivant
                    )
    )ORDER BY(num_etape)
)

SELECT port_depart,port_arrivee,num_etape FROM Trajet;