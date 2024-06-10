\! echo "Moyenne du prix de revente au kilo par produit en Afrique"

SELECT produit.nom, CAST(AVG(prix_revente_kilo) AS DECIMAL(10,2)) AS "prix moyen"
FROM produit, port
WHERE(produit.lieu_vente = port.nom AND port.localisation = 'Afrique')
GROUP BY produit.nom;