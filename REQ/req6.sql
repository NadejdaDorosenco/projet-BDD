\! echo "une sous-requête dans le WHERE"
\! echo "Trouver les états qui ne sont pas ennemis de la France et qui possèdent plus de 2 ports"

SELECT DISTINCT nation1
FROM relation_diplomatique
WHERE nation1<>'France' 
	AND nation2='France' 
	AND relation_diplomatique.type_de_relation<>'En guerre'
	AND (SELECT count(*) as nb
		FROM port
		WHERE port.nationalite=nation1
		)>2;

