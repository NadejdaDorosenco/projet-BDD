\! echo "une ’auto jointure’ (jointure de deux copies d’une même table)"
\! echo "Les voyages dont le navire a la même provenance et la même classe"

SELECT distinct V1.id_voyage
FROM voyage V1, voyage V2
WHERE V2.provenance = 'Le Havre'
	AND V1.provenance=V2.provenance
	AND V1.classe = V2.classe
	AND V1.id_navire <> V2.id_navire;
