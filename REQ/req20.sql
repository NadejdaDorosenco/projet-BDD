\! echo "Le nombre de produits périssables et secs par voyage"

SELECT voyage.id_voyage, COUNT(CASE WHEN perissable THEN 1 END) AS perissable, COUNT(CASE WHEN NOT perissable THEN 1 END) AS sec
FROM produit, voyage, quantite
WHERE (produit.id_produit = quantite.id_produit AND quantite.id_voyage = voyage.id_voyage)
GROUP BY voyage.id_voyage
ORDER BY voyage.id_voyage;