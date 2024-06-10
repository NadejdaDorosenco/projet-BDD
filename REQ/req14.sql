\! echo "Une requete qui renvoie un résultat différent à cause d'un null"
\! echo "Les voyages qui ont la date de fin la plus récente"

SELECT id_voyage
FROM voyage V1
WHERE NOT EXISTS(
    SELECT *
    FROM voyage V2
    WHERE EXTRACT(YEARS from V2.date_fin)>EXTRACT(YEARS from V1.date_fin)
)
--AND V1.date_fin IS NOT NULL
;

\! echo "Il suffit d'ajouter un NOT NULL sur la date de fin et les requêtes sont identiques"