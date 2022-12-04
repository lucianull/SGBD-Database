CREATE TABLE categorii 
    (id_categorie NUMBER(8),
    nume VARCHAR2(20),
    CONSTRAINT categorii_pk PRIMARY KEY (id_categorie));

CREATE TABLE clienti
    (id_client NUMBER(8),
    nume VARCHAR2(20),
    prenume VARCHAR2(20),
    nr_telefon VARCHAR2(13),
    CONSTRAINT clienti_pk PRIMARY KEY (id_client));

CREATE TABLE produse
    (id_produs NUMBER(8),
    id_categorie NUMBER(8),
    nume VARCHAR2(20),
    gramaj FLOAT,
    pret FLOAT,
    descriere VARCHAR2(200),
    CONSTRAINT produse_pk PRIMARY KEY (id_produs),
    CONSTRAINT produse_id_categorie_fk FOREIGN KEY (id_categorie) REFERENCES categorii(id_categorie));

CREATE TABLE ingrediente
    (id_ingredient NUMBER(8),
    nume VARCHAR2(20),
    stoc FLOAT,
    stoc_necesar FLOAT,
    CONSTRAINT ingrediente_pk PRIMARY KEY (id_ingredient));

CREATE TABLE contine
    (id_ingredient NUMBER(8),
    id_produs NUMBER(8),
    cantitate FLOAT,
    CONSTRAINT contine_id_ingredient_fk FOREIGN KEY (id_ingredient) REFERENCES ingrediente(id_ingredient),
    CONSTRAINT contine_id_produs_fk FOREIGN KEY (id_produs) REFERENCES produse(id_produs));
    
CREATE TABLE furnizori
    (id_furnizor NUMBER(8),
    nume VARCHAR2(20),
    nr_telefon VARCHAR2(13),
    adresa VARCHAR2(200),
    CONSTRAINT id_furnizor_pk PRIMARY KEY (id_furnizor));
    
CREATE TABLE receptii
    (id_receptie NUMBER(8),
    id_furnizor NUMBER(8),
    data_primire TIMESTAMP,
    valoare FLOAT,
    CONSTRAINT id_receptie_pk PRIMARY KEY(id_receptie),
    CONSTRAINT receptii_id_furnizor_fk FOREIGN KEY (id_furnizor) REFERENCES furnizori(id_furnizor));
    
CREATE TABLE produse_receptie
    (id_ingredient NUMBER(8),
    id_receptie NUMBER(8),
    cantitate FLOAT,
    CONSTRAINT produse_receptie_id_ingredient_fk FOREIGN KEY (id_ingredient) REFERENCES ingrediente(id_ingredient),
    CONSTRAINT produse_receptie_id_receptie_fk FOREIGN KEY (id_receptie) REFERENCES receptii(id_receptie));
    
CREATE table card
    (id_card NUMBER(8),
    id_client NUMBER(8),
    nr_card VARCHAR2(16),
    data_expirare VARCHAR2(7),
    nume VARCHAR2(20),
    prenume VARCHAR2(20),
    CONSTRAINT id_card_pk PRIMARY KEY (id_card),
    CONSTRAINT card_id_client_fk FOREIGN KEY (id_client) REFERENCES clienti(id_client));
    
CREATE TABLE masini_livrare
    (serie_sasiu VARCHAR2(17),
    nr_inmatriculare VARCHAR2(10),
    expirare_it DATE,
    CONSTRAINT serie_sasiu_pk PRIMARY KEY(serie_sasiu));
    
CREATE TABLE angajati
    (id_angajat NUMBER(8),
    serie_sasiu VARCHAR2(17),
    nume VARCHAR2(20),
    prenume VARCHAR2(20),
    cnp VARCHAR2(13),
    functie VARCHAR2(20),
    nr_telefon VARCHAR2(13),
    data_angajare DATE,
    CONSTRAINT id_angajat_pk PRIMARY KEY (id_angajat),
    CONSTRAINT angajati_serie_sasiu_fk FOREIGN KEY (serie_sasiu) REFERENCES masini_livrare(serie_sasiu));

CREATE TABLE comenzi
    (id_comanda NUMBER(8),
    id_client NUMBER(8),
    id_angajat NUMBER(8),
    adresa VARCHAR2(200),
    data_primire TIMESTAMP,
    CONSTRAINT id_comanda_pk PRIMARY KEY (id_comanda),
    CONSTRAINT comenzi_id_client_fk FOREIGN KEY (id_client) REFERENCES clienti(id_client),
    CONSTRAINT comenzi_id_angajat_fk FOREIGN KEY (id_angajat) REFERENCES angajati(id_angajat));
    
CREATE TABLE mod_plata
    (id_plata NUMBER(8),
    id_comanda NUMBER(8),
    id_card NUMBER(8),
    valoare FLOAT,
    discount FLOAT,
    CONSTRAINT id_plata_pk PRIMARY KEY (id_plata),
    CONSTRAINT mod_plata_id_comanda_fk FOREIGN KEY (id_comanda) REFERENCES comenzi(id_comanda),
    CONSTRAINT mod_plata_id_card_fk FOREIGN KEY (id_card) REFERENCES card(id_card));

CREATE TABLE produse_comanda
    (id_produs NUMBER(8),
    id_comanda NUMBER(8),
    id_angajat NUMBER(8),
    cantitate NUMBER(4),
    CONSTRAINT produse_comanda_id_produs_fk FOREIGN KEY (id_produs) REFERENCES produse(id_produs),
    CONSTRAINT produse_id_comanda_produs_fk FOREIGN KEY (id_comanda) REFERENCES comenzi(id_comanda),
    CONSTRAINT produse_id_angajat_produs_fk FOREIGN KEY (id_angajat) REFERENCES angajati(id_angajat));