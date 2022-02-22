--création d'une base de données pour une librairie...
CREATE TABLE PERSONNE (
id_personne int IDENTITY PRIMARY KEY,
nom varchar(20),
prenom varchar(20),
date_naissance date,
mail varchar(30),
mdp varchar(30),
id_role int,
FOREIGN KEY (id_role) REFERENCES ROLE
);

CREATE TABLE ADRESSE(
id_Adresse int IDENTITY PRIMARY KEY,
lieu varchar(30),
rue varchar(30) NOT NULL,
cp int NOT NULL,
ville varchar(20) NOT NULL
);

CREATE TABLE LIBRAIRIE(
id_Librairie int IDENTITY PRIMARY KEY,
id_Adresse int NOT NULL,
FOREIGN KEY (id_adresse) REFERENCES ADRESSE
);

CREATE TABLE LIVRE(
id_livre int IDENTITY PRIMARY KEY, --livre physique
nom_livre varchar(30) NOT NULL,
id_personne int NOT NULL, --auteur
ISBN varchar(20) NOT NULL, --reference du livre
editeur varchar(20),
parution date,
nb_page int,
id_librairie int NOT NULL,
description varchar(100) NOT NULL,
categorie varchar(10) NOT NULL,
prix int Default(0),
FOREIGN KEY (id_personne) REFERENCES PERSONNE,
FOREIGN KEY (id_librairie) REFERENCES LIBRAIRIE
);

CREATE TABLE EMPRUNT (
id_emprunt int IDENTITY PRIMARY KEY,
id_personne int,
id_livre int,
date_emprunt date NOT NULL,
id_librairie int,
FOREIGN KEY (id_librairie) REFERENCES LIBRAIRIE,
FOREIGN KEY (id_livre) REFERENCES LIVRE,
FOREIGN KEY (id_personne) REFERENCES PERSONNE
);

CREATE TABLE ROLE (
id_role int IDENTITY PRIMARY KEY,
nom_role varchar(10),
description_du_role varchar(30)
);