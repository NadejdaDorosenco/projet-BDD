\! echo "une requête qui porte sur au moins trois tables"
\! echo "Donner les navires anglais ayant fait au moins un voyage de deux semaines"

SELECT DISTINCT navire.id_navire
FROM navire, nation, voyage
WHERE (navire.nationalite = nation.nom AND navire.id_navire = voyage.id_navire
	AND navire.nationalite = 'Royaume-Uni'
	AND TRUNC((voyage.date_fin - voyage.date_debut)/7)>=2)
;