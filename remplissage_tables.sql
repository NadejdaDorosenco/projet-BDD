\copy nation FROM CSV/Nation.csv DELIMITER ';' CSV HEADER;
\copy relation_diplomatique(nation1,nation2,type_de_relation) from CSV/Relation_diplomatique.csv DELIMITER ';' CSV HEADER;
\copy port from CSV/Port.csv DELIMITER ';' CSV HEADER;
\copy navire from CSV/Navire.csv DELIMITER ';' CSV HEADER;
\copy voyage(id_navire,date_debut,date_fin,provenance,destination,distance,classe,localisation_continental) from CSV/Voyage.csv DELIMITER ';' CSV HEADER;
\copy etape_transitoire from CSV/Etape_transitoire.csv DELIMITER ';' CSV HEADER;
\copy personne(nom,prenom) from CSV/Personne.csv DELIMITER ';' CSV HEADER;
\copy passagers(id_personne,id_voyage,lieu_embarquement,lieu_debarquement) from CSV/Passagers.csv DELIMITER ';' CSV HEADER;
\copy produit(nom,perissable,conservation,prix_revente_kilo,lieu_achat,lieu_vente) from CSV/Produit.csv DELIMITER ';' CSV HEADER;
\copy quantite(id_produit,id_voyage,quantite_prod) from CSV/Quantite.csv DELIMITER ';' CSV HEADER;