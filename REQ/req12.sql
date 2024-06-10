\! echo "Une requête exprimant une condition de totalité (sous-requete corrélée)"
\! echo "Les cargaisons qui transportent tous les produits différents"

SELECT DISTINCT id_voyage
FROM quantite Q
WHERE NOT EXISTS(SELECT P.nom
                FROM produit P
                WHERE P.nom NOT IN(
                    SELECT Q2.nom 
                    FROM (produit NATURAL JOIN quantite)Q2
                    WHERE Q2.id_voyage=Q.id_voyage
                )

);


