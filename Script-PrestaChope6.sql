#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------

DROP DATABASE IF EXISTS prestachope_bdd6;
CREATE DATABASE prestachope_bdd6;
USE prestachope_bdd6;



#------------------------------------------------------------
# Table: Categories
#------------------------------------------------------------

CREATE TABLE categories(
        Id          Int  Auto_increment  NOT NULL ,
        nom         Varchar (50) NOT NULL ,
        description Varchar (100) NOT NULL
	,CONSTRAINT categories_PK PRIMARY KEY (Id)
)ENGINE=InnoDB;

INSERT INTO `categories` (`Id`, `nom`, `description`) VALUES
(1, 'NONE', 'Cat�gorie de base'),
(2, 'Bi�res', 'boisson alcoolis�e obtenue par fermentation alcoolique d un mo�t de produits v�g�taux amylac�s tels que l orge, le ma�s, le riz, la banane, le manioc...'),
(3, 'Vins', 'boisson alcoolis�e obtenue par la fermentation du raisin, fruit de la vigne viticole.'),
(4, 'Ap�ro', 'Tout ce qui � l ap�ro.'),
(5, 'Accessoires', 'Tout ce qui touche le domaine de la brasserie.');


#------------------------------------------------------------
# Table: SousCategories
#------------------------------------------------------------

CREATE TABLE souscategories(
        Id            Int  Auto_increment  NOT NULL ,
        nom           Varchar (50) NOT NULL ,
        Id_Categories Int NOT NULL
	,CONSTRAINT souscategories_PK PRIMARY KEY (Id)
	,CONSTRAINT souscategories_categories_FK FOREIGN KEY (Id_Categories) REFERENCES categories(Id)
)ENGINE=InnoDB;

INSERT INTO `souscategories` (`Id`, `nom`, `Id_Categories`) VALUES
(1, 'NONE', 1),
(2, 'Blonde', 2),
(3, 'Brune', 2),
(4, 'Ambr�e', 2),
(5, 'F�ts', 2),
(6, 'Rouge', 3),
(7, 'Ros�', 3),
(8, 'Blanc', 3),
(9,'Kits',5),
(10,'Verres',5),
(11,'Charcuterie',5);




#------------------------------------------------------------
# Table: Produits
#------------------------------------------------------------

CREATE TABLE produits(
        Id                Int  Auto_increment  NOT NULL ,
        nom               Varchar (50) NOT NULL ,
        description       Varchar (50) NOT NULL ,
        prix              Float NOT NULL ,
        stock             Int NOT NULL,
    	image			  Varchar (50) NOT NULL,
        Id_Categories     Int NOT NULL,
        Id_SousCategories INT NOT NULL
	,CONSTRAINT produits_PK PRIMARY KEY (Id)
        ,CONSTRAINT produits_categories_FK FOREIGN KEY (Id_Categories) REFERENCES categories(Id)
        ,CONSTRAINT produits_souscategories_FK FOREIGN KEY (Id_SousCategories) REFERENCES souscategories(Id)
)ENGINE=InnoDB;

INSERT INTO `produits` (`Id`, `nom`, `description`, `prix`, `stock`, `image`, `Id_Categories`, `Id_SousCategories`) VALUES
(1, 'Heineken', 'bouteille de 33cl', 1.5, 500, 'assets/images/heineken.png', 2, 2),
(2, 'Desperados', '330ml 5.9%', 2.5, 200, 'assets/images/desperados.png', 2, 3),
(3, 'Kronembourg', 'Canette 330ml 4.2%', 1.75, 150, 'assets/images/kro.png', 2, 2),
(4, 'F�t heineken', 'F�t 5L heineken ', 19.99, 125, 'assets/images/fut-heineken.png', 2, 5),
(5, 'F�t desperados', 'F�t 5L desperados', 21.99, 20, 'assets/images/fut-desperados.png', 2, 5),
(6, 'F�t affligem', 'F�t 5L affligem ', 19.99, 20, 'assets/images/fut-affli.png', 2, 5),
(7, 'Ros� schiste', 'bouteille 1L de Schiste', 12, 100, 'assets/images/rose.png', 3, 7),
(8, 'Kit de brassage ', 'Kit pour brasser sa propre bi�re ', 70, 20, 'assets/images/kit.png', 5, 9),
(9, 'Kit de brassage 2 ', 'Kit pour brasser sa propre bi�re 2 ', 75, 15, 'assets/images/kit2.png', 5, 9),
(10, 'Montazac', 'bouteille 1L de Monbazillac ', 25.5, 50, 'assets/images/blanc.png', 3, 8),
(11, 'Chope bi�re', 'Une chope pour remplir sa bi�re ', 3.6, 150, 'assets/images/chope.png', 5, 10),
(12, 'Grimbergen', '330ml grimbergen ', 2.25, 300, 'assets/images/grim.png', 2, 4);




#------------------------------------------------------------
# Table: Users
#------------------------------------------------------------

CREATE TABLE users(
        Id       Int  Auto_increment  NOT NULL ,
        nom      Varchar (50) NOT NULL ,
        prenom   Varchar (50) NOT NULL ,
        pseudo   Varchar (50) NOT NULL ,
        password Varchar (50) NOT NULL ,
        email    Varchar (50) NOT NULL ,
        age      Int NOT NULL ,
        cagnotte Float NOT NULL DEFAULT 325,
        isAdmin  Int NOT NULL DEFAULT 0
	,CONSTRAINT users_PK PRIMARY KEY (Id)
)ENGINE=InnoDB;

INSERT INTO `users` (`Id`, `nom`, `prenom`, `pseudo`, `password`, `email`, `age`, `cagnotte`, `isAdmin`) VALUES
(1, 'HOUDIER', 'Yanis', 'Sinsay', '5cee219187649d473cf8489852a6a8880bdc6744', 'yanis.houdier@gmail.com', 19, 152.3, 1),
(2, 'RICHARD', 'Nathim', 'Nath', '075fbaa6a593c1261a529d81540c10bbbc12d8b2', 'nath@gmail.com', 22, 35.5, 0);



#------------------------------------------------------------
# Table: Panier
#------------------------------------------------------------
CREATE TABLE panier(
        Id                Int  Auto_increment  NOT NULL ,
        quantite        Int NOT NULL,
        Id_Produits     Int NOT NULL,
        Id_Users        Int NOT NULL
	,CONSTRAINT panier_PK PRIMARY KEY (Id)
        ,CONSTRAINT panier_produits_FK FOREIGN KEY (Id_Produits) REFERENCES produits(Id)
        ,CONSTRAINT panier_users_FK FOREIGN KEY (Id_Users) REFERENCES users(Id)
)ENGINE=InnoDB;



#------------------------------------------------------------
# Table: Clients
#------------------------------------------------------------

CREATE TABLE clients(
        Id           Int  Auto_increment  NOT NULL ,
        adresse      Varchar (50) NOT NULL ,
        ville        Varchar (50) NOT NULL ,
        code_postal  Int (5) NOT NULL ,
        telephone    Varchar (50) NOT NULL ,
        Id_Users     Int NOT NULL
	,CONSTRAINT clients_PK PRIMARY KEY (Id)
	,CONSTRAINT clients_users_FK FOREIGN KEY (Id_Users) REFERENCES users(Id)
	,CONSTRAINT clients_users_AK UNIQUE (Id_Users)
)ENGINE=InnoDB;

INSERT INTO `clients` (`Id`, `adresse`,`ville`,`code_postal`, `telephone`, `Id_Users`) VALUES
(1, '5 all�e des jardins Aubi�re','Aubi�re' ,'63170', '0750253428', 1),
(2, '10 rue des pr� ','Vichy','03000', '0670303413', 2);



#------------------------------------------------------------
# Table: Commandes
#------------------------------------------------------------

CREATE TABLE contact(
        Id         Int Auto_increment NOT NULL , 
        contenu    longtext,
        date       DATETIME, 
        type_demande Varchar (30),
        is_viewed Int NOT NULL,
        Id_Clients Int NOT NULL
        ,CONSTRAINT contact_PK PRIMARY KEY(Id)
        ,CONSTRAINT contact_clients_FK FOREIGN KEY (Id_CLients) REFERENCES clients(Id)
)ENGINE=InnoDB;


CREATE TABLE commandes(
        Id          Int  Auto_increment  NOT NULL ,
        Id_Clients  Int NOT NULL
	,CONSTRAINT commandes_PK PRIMARY KEY (Id)
	,CONSTRAINT commandes_clients_FK FOREIGN KEY (Id_Clients) REFERENCES clients(Id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Factures
#------------------------------------------------------------

CREATE TABLE factures(
        Id            Int  Auto_increment  NOT NULL ,
        Id_Commandes  Int NOT NULL,
        montant       Double NOT NULL,
        date            DATETIME NOT NULL
	,CONSTRAINT factures_PK PRIMARY KEY (Id)
        ,CONSTRAINT factures_commandes_FK FOREIGN KEY (Id_Commandes) REFERENCES commandes(Id)
)ENGINE=InnoDB;



#------------------------------------------------------------
# Table: Quantites_Produits
#------------------------------------------------------------

CREATE TABLE produits_commandes(
        Id_Commandes Int NOT NULL,
        Id_Produits  Int NOT NULL ,
        quantites    INT NOT NULL
	,CONSTRAINT produits_PK PRIMARY KEY (Id_Produits,Id_Commandes)
        ,CONSTRAINT produits_commandes_produits_FK FOREIGN KEY (Id_Produits) REFERENCES produits(Id)
        ,CONSTRAINT produits_commandes_commandes_FK FOREIGN KEY (Id_Commandes) REFERENCES commandes(Id)
	
)ENGINE=InnoDB;
