\! echo "Quantite moyenne de chaque produit transporté par navire lors de ses voyages"

SELECT navire.nom, produit.nom, CAST(AVG(quantite_prod) AS INTEGER) AS moyenne
FROM quantite, produit, voyage, navire
WHERE (quantite.id_produit = produit.id_produit AND quantite.id_voyage = voyage.id_voyage AND voyage.id_navire = navire.id_navire)
GROUP BY navire.nom, produit.nom
ORDER BY navire.nom;