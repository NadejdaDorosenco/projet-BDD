\! echo "Statistique sur une année"
\! echo "Le pourcentage de passagers provenant d'Europe par année par ordre décroissant d'année"


CREATE VIEW Year AS
SELECT CAST((EXTRACT(YEAR FROM date_debut)) AS INTEGER) AS year, passagers, date_debut AS annee, localisation
FROM voyage, passagers, port
WHERE (passagers.id_voyage = voyage.id_voyage AND voyage.provenance = port.nom);


SELECT Tous.year, (EU.No*100)/Tous.No AS pourcentage
FROM (SELECT year, COUNT (passagers) AS No FROM Year WHERE localisation='Europe' GROUP BY year) AS EU,
     (SELECT year, COUNT(passagers) AS No FROM Year GROUP BY year) AS Tous
WHERE Tous.year = EU.year
UNION
SELECT year,0
FROM((SELECT year FROM Year) 
    EXCEPT (SELECT year FROM Year WHERE localisation = 'Europe')) AS f
ORDER BY year DESC;;
