\! echo "Une requete qui renvoie un résultat différent à cause d'un null"
\! echo "Les voyages qui ont la date de fin la plus récente"

SELECT id_voyage
FROM voyage
WHERE EXTRACT(YEARS from date_fin)=(SELECT MAX(EXTRACT(YEARS from date_fin))
                                    FROM voyage)
;
