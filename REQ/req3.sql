\! echo "une sous-requête corrélée"
\! echo "Trouver les voyages où Guy Dupuis est passager "

SELECT distinct voyage.id_voyage
FROM voyage
WHERE EXISTS (SELECT * 
					FROM personne NATURAL JOIN passagers
					WHERE voyage.id_voyage = passagers.id_voyage
					AND personne.nom='Dupuis'
					AND personne.prenom='Guy');
