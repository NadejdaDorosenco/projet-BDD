\! echo "une sous-requête corrélée"
\! echo "le nom des navires qui n'ont pas pris la mer"
SELECT nom
FROM navire
WHERE NOT EXISTS(SELECT *
                FROM voyage
                where voyage.id_navire=navire.id_navire);
