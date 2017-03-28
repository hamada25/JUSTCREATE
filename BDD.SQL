#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: THEME
#------------------------------------------------------------

CREATE TABLE THEME(
        ID_THEME    int (11) Auto_increment  NOT NULL ,
        LIBELLE     Varchar (200) ,
        ICONE_THEME Varchar (100) ,
        PRIMARY KEY (ID_THEME )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: USER
#------------------------------------------------------------

CREATE TABLE USER(
        ID_USER          int (11) Auto_increment  NOT NULL ,
        NOM              Varchar (50) ,
        PRENOM           Varchar (50) ,
        LOGIN            Varchar (25) ,
        MDP              Varchar (50) ,
        EMAIL            Varchar (50) ,
        DESCRIPTION_USER int (11) Auto_increment  ,
        PRIMARY KEY (ID_USER ) ,
        UNIQUE (LOGIN )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: CREATION
#------------------------------------------------------------

CREATE TABLE CREATION(
        ID_CREATION       int (11) Auto_increment  NOT NULL ,
        NOM_CREATION      Varchar (200) ,
        DESCRIPTION_CREA  Varchar (200) ,
        MATERIEL_CREATION Varchar (200) ,
        PUBLIQUE_CREA     Bool ,
        PRIX_CREA         Float ,
        NOMBRE_VU_CREA    Int ,
        FILE_IMG_CREATION Varchar (100) ,
        ID_THEME          Int ,
        ID_USER           Int ,
        PRIMARY KEY (ID_CREATION )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: TUTORIEL
#------------------------------------------------------------

CREATE TABLE TUTORIEL(
        ID_TUTO          int (11) Auto_increment  NOT NULL ,
        TITRE_TUTO       Varchar (200) ,
        DESCRIPTION_TUTO Varchar (200) ,
        MATERIEL_TUTO    Varchar (200) ,
        PUBLIQUE_TUTO    Bool ,
        NOMBRE_VU_TUTO   Int ,
        FILE_TUTO        Varchar (100) ,
        TAILLE_TUTO      Varchar (25) ,
        ID_THEME         Int ,
        ID_USER          Int ,
        PRIMARY KEY (ID_TUTO )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: COMMENTAIRE
#------------------------------------------------------------

CREATE TABLE COMMENTAIRE(
        ID_COM      int (11) Auto_increment  NOT NULL ,
        TITRE_COM   Varchar (50) ,
        CONTENU_COM Varchar (255) ,
        DATE_COM    Date ,
        ID_USER     Int ,
        ID_CREATION Int ,
        ID_TUTO     Int ,
        PRIMARY KEY (ID_COM )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: NIVEAU
#------------------------------------------------------------

CREATE TABLE NIVEAU(
        ID_NIVEAU int (11) Auto_increment  NOT NULL ,
        NIVEAU    Varchar (100) ,
        ID_THEME  Int ,
        PRIMARY KEY (ID_NIVEAU )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: ETAPE
#------------------------------------------------------------

CREATE TABLE ETAPE(
        ETAPE_ID          int (11) Auto_increment  NOT NULL ,
        NUMERO_ETAPE      Int ,
        NOM_ETAPE         Varchar (100) ,
        FILE_IMG_ETAPE    Varchar (100) ,
        DESCRIPTION_ETAPE Varchar (200) ,
        MATERIEL_ETAPE    Varchar (200) ,
        ID_TUTO           Int ,
        PRIMARY KEY (ETAPE_ID )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: NOTE
#------------------------------------------------------------

CREATE TABLE NOTE(
        ID_NOTE     int (11) Auto_increment  NOT NULL ,
        ID_CREATION Int ,
        ID_TUTO     Int ,
        ID_USER     Int ,
        PRIMARY KEY (ID_NOTE )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: S'ABONNER
#------------------------------------------------------------

CREATE TABLE S_ABONNER(
        ID_USER   Int NOT NULL ,
        ID_USER_1 Int NOT NULL ,
        PRIMARY KEY (ID_USER ,ID_USER_1 )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: ENVOYER_MESSAGE
#------------------------------------------------------------

CREATE TABLE ENVOYER_MESSAGE(
        MESSAGE        Varchar (255) ,
        DATE_ENVOI_MSG Date ,
        TITRE_MSG      Varchar (60) ,
        ID_USER        Int NOT NULL ,
        ID_USER_1      Int NOT NULL ,
        PRIMARY KEY (ID_USER ,ID_USER_1 )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: AJOUT_FAVORIS_CREATION
#------------------------------------------------------------

CREATE TABLE AJOUT_FAVORIS_CREATION(
        ID_CREATION Int NOT NULL ,
        ID_USER     Int NOT NULL ,
        PRIMARY KEY (ID_CREATION ,ID_USER )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: AJOUT_FAVORIS_TUTO
#------------------------------------------------------------

CREATE TABLE AJOUT_FAVORIS_TUTO(
        ID_TUTO Int NOT NULL ,
        ID_USER Int NOT NULL ,
        PRIMARY KEY (ID_TUTO ,ID_USER )
)ENGINE=InnoDB;

ALTER TABLE CREATION ADD CONSTRAINT FK_CREATION_ID_THEME FOREIGN KEY (ID_THEME) REFERENCES THEME(ID_THEME);
ALTER TABLE CREATION ADD CONSTRAINT FK_CREATION_ID_USER FOREIGN KEY (ID_USER) REFERENCES USER(ID_USER);
ALTER TABLE TUTORIEL ADD CONSTRAINT FK_TUTORIEL_ID_THEME FOREIGN KEY (ID_THEME) REFERENCES THEME(ID_THEME);
ALTER TABLE TUTORIEL ADD CONSTRAINT FK_TUTORIEL_ID_USER FOREIGN KEY (ID_USER) REFERENCES USER(ID_USER);
ALTER TABLE COMMENTAIRE ADD CONSTRAINT FK_COMMENTAIRE_ID_USER FOREIGN KEY (ID_USER) REFERENCES USER(ID_USER);
ALTER TABLE COMMENTAIRE ADD CONSTRAINT FK_COMMENTAIRE_ID_CREATION FOREIGN KEY (ID_CREATION) REFERENCES CREATION(ID_CREATION);
ALTER TABLE COMMENTAIRE ADD CONSTRAINT FK_COMMENTAIRE_ID_TUTO FOREIGN KEY (ID_TUTO) REFERENCES TUTORIEL(ID_TUTO);
ALTER TABLE NIVEAU ADD CONSTRAINT FK_NIVEAU_ID_THEME FOREIGN KEY (ID_THEME) REFERENCES THEME(ID_THEME);
ALTER TABLE ETAPE ADD CONSTRAINT FK_ETAPE_ID_TUTO FOREIGN KEY (ID_TUTO) REFERENCES TUTORIEL(ID_TUTO);
ALTER TABLE NOTE ADD CONSTRAINT FK_NOTE_ID_CREATION FOREIGN KEY (ID_CREATION) REFERENCES CREATION(ID_CREATION);
ALTER TABLE NOTE ADD CONSTRAINT FK_NOTE_ID_TUTO FOREIGN KEY (ID_TUTO) REFERENCES TUTORIEL(ID_TUTO);
ALTER TABLE NOTE ADD CONSTRAINT FK_NOTE_ID_USER FOREIGN KEY (ID_USER) REFERENCES USER(ID_USER);
ALTER TABLE S_ABONNER ADD CONSTRAINT FK_S_ABONNER_ID_USER FOREIGN KEY (ID_USER) REFERENCES USER(ID_USER);
ALTER TABLE S_ABONNER ADD CONSTRAINT FK_S_ABONNER_ID_USER_1 FOREIGN KEY (ID_USER_1) REFERENCES USER(ID_USER);
ALTER TABLE ENVOYER_MESSAGE ADD CONSTRAINT FK_ENVOYER_MESSAGE_ID_USER FOREIGN KEY (ID_USER) REFERENCES USER(ID_USER);
ALTER TABLE ENVOYER_MESSAGE ADD CONSTRAINT FK_ENVOYER_MESSAGE_ID_USER_1 FOREIGN KEY (ID_USER_1) REFERENCES USER(ID_USER);
ALTER TABLE AJOUT_FAVORIS_CREATION ADD CONSTRAINT FK_AJOUT_FAVORIS_CREATION_ID_CREATION FOREIGN KEY (ID_CREATION) REFERENCES CREATION(ID_CREATION);
ALTER TABLE AJOUT_FAVORIS_CREATION ADD CONSTRAINT FK_AJOUT_FAVORIS_CREATION_ID_USER FOREIGN KEY (ID_USER) REFERENCES USER(ID_USER);
ALTER TABLE AJOUT_FAVORIS_TUTO ADD CONSTRAINT FK_AJOUT_FAVORIS_TUTO_ID_TUTO FOREIGN KEY (ID_TUTO) REFERENCES TUTORIEL(ID_TUTO);
ALTER TABLE AJOUT_FAVORIS_TUTO ADD CONSTRAINT FK_AJOUT_FAVORIS_TUTO_ID_USER FOREIGN KEY (ID_USER) REFERENCES USER(ID_USER);
