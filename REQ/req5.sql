\! echo "une sous-requête dans le FROM"
\! echo "Le maximum de passagers qui rejoignent un voyage depuis le port de provenance"

SELECT max(nb) AS max_passager
FROM(
	SELECT COUNT(*) AS nb
	FROM passagers NATURAL JOIN voyage
	WHERE passagers.lieu_embarquement=voyage.provenance
	GROUP BY(provenance)) AS S
;