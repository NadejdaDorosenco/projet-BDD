\! echo "Une requête exprimant une condition de totalité (aggrégat)"
\! echo "Les cargaisons qui transportent tous les produits différents"

SELECT id_voyage
FROM (quantite NATURAL JOIN produit)T
GROUP BY(id_voyage)
HAVING COUNT(DISTINCT T.nom)=(SELECT COUNT(DISTINCT nom) 
                              FROM produit)
;