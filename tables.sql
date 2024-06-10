drop table if exists nation cascade;
drop table if exists relation_diplomatique cascade;
drop table if exists port cascade;
drop table if exists navire cascade;
drop table if exists voyage cascade;
drop table if exists etape_transitoire cascade;
drop table if exists personne cascade;
drop table if exists passagers cascade;
drop table if exists produit cascade;
drop table if exists quantite cascade;

CREATE TABLE nation(
    nom varchar(32) PRIMARY KEY
);

CREATE TABLE relation_diplomatique(
    id_relation serial PRIMARY KEY,
    nation1 varchar(32),
    nation2 varchar(32),
    type_de_relation varchar(32) not NULL,
    FOREIGN KEY(nation1) REFERENCES nation(nom),
    FOREIGN KEY(nation2) REFERENCES nation(nom)
);

CREATE TABLE port(
    nom varchar(32) PRIMARY KEY,
    localisation varchar(32) not NULL,
    nationalite varchar(32),
    categorie integer not NULL,
    FOREIGN KEY(nationalite) REFERENCES nation(nom),
    CHECK(categorie>0 and categorie<6)
);

CREATE TABLE navire(
    id_navire varchar(8) PRIMARY KEY,
    nom varchar(32),
    type varchar(32) not NULL,
    categorie integer not NULL,
    nationalite varchar(32),
    volume_marchandise integer not NULL,
    capacite_passager integer not NULL,
    FOREIGN KEY(nationalite) REFERENCES nation(nom),
    CHECK(categorie>0 and categorie<6)
);

CREATE TABLE voyage(
    id_voyage serial PRIMARY KEY,
    id_navire varchar(8),
    date_debut date not NULL,
    date_fin date,
    provenance varchar(32) not NULL,
    destination varchar(32),
    distance integer not NULL,
    classe varchar(32) not NULL,
    localisation_continental varchar(32) not NULL,
    FOREIGN KEY(id_navire) REFERENCES navire(id_navire),
    FOREIGN KEY(provenance) REFERENCES port(nom),
    FOREIGN KEY(destination) REFERENCES port(nom)
);

CREATE TABLE etape_transitoire(
    nom varchar(32),
    id_voyage integer,
    numero_etape integer,
    PRIMARY KEY(nom,id_voyage),
    FOREIGN KEY(nom) REFERENCES port(nom),
    FOREIGN KEY(id_voyage) REFERENCES voyage(id_voyage)
);

CREATE TABLE personne(
    id_personne serial PRIMARY KEY,
    nom varchar(32) not NULL,
    prenom varchar(32) not NULL
);

CREATE TABLE passagers(
    id_passager serial PRIMARY KEY,
    id_personne integer,
    id_voyage integer,
    lieu_embarquement varchar(32) not NULL,
    lieu_debarquement varchar(32),
    FOREIGN KEY(id_personne) REFERENCES personne(id_personne),
    FOREIGN KEY(id_voyage) REFERENCES voyage(id_voyage),
    FOREIGN KEY(lieu_embarquement) REFERENCES port(nom),
    FOREIGN KEY(lieu_debarquement) REFERENCES port(nom)
);

CREATE TABLE produit(
    id_produit serial PRIMARY KEY,
    nom varchar(64),
    perissable boolean,
    conservation date,
    prix_revente_kilo decimal(10,2),
    lieu_achat varchar(32),
    lieu_vente varchar(32),
    FOREIGN KEY(lieu_achat) REFERENCES port(nom),
    FOREIGN KEY(lieu_vente) REFERENCES port(nom)
);

CREATE TABLE quantite(
    id_produit integer,
    id_voyage integer,
    quantite_prod integer not NULL,
    PRIMARY KEY(id_produit,id_voyage),
    FOREIGN KEY(id_voyage) REFERENCES voyage(id_voyage),
    FOREIGN KEY(id_produit) REFERENCES produit(id_produit)
);