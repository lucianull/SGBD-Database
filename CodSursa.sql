-- 4
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


-- 5
CREATE SEQUENCE SEQ_CATEGORII
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 1000
NOCYCLE;

INSERT INTO categorii VALUES (SEQ_CATEGORII.NEXTVAL, 'Aperitiv');
INSERT INTO categorii VALUES (SEQ_CATEGORII.NEXTVAL, 'Pizza');
INSERT INTO categorii VALUES (SEQ_CATEGORII.NEXTVAL, 'Paste');
INSERT INTO categorii VALUES (SEQ_CATEGORII.NEXTVAL, 'Fel Principal');
INSERT INTO categorii VALUES (SEQ_CATEGORII.NEXTVAL, 'Burgers and Crispy');
INSERT INTO categorii VALUES (SEQ_CATEGORII.NEXTVAL, 'Desert');
INSERT INTO categorii VALUES (SEQ_CATEGORII.NEXTVAL, 'Bauturi');

select * from categorii;

CREATE SEQUENCE SEQ_CLIENTI
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 100000
NOCYCLE;

INSERT INTO clienti VALUES (SEQ_CLIENTI.NEXTVAL, 'Maru', 'Andrei', '0752249963');
INSERT INTO clienti VALUES (SEQ_CLIENTI.NEXTVAL, 'Popescu', 'Anamaria', '0752873158');
INSERT INTO clienti VALUES (SEQ_CLIENTI.NEXTVAL, 'Marinescu', 'Mihai', '0764089969');
INSERT INTO clienti VALUES (SEQ_CLIENTI.NEXTVAL, 'Stan', 'Denisa', '0775684303');
INSERT INTO clienti VALUES (SEQ_CLIENTI.NEXTVAL, 'Stanescu', 'Rares', '0787463018');
INSERT INTO clienti VALUES (SEQ_CLIENTI.NEXTVAL, 'Stanescu', 'Rares', '0789347563');

select * from clienti;

CREATE SEQUENCE SEQ_PRODUSE
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 10000
NOCYCLE;

INSERT INTO produse VALUES(SEQ_PRODUSE.NEXTVAL, 1,'Bruschete cu ton', 150, 23, 'Focaccia facuta de noi si cu cel mai bun ton');
INSERT INTO produse VALUES(SEQ_PRODUSE.NEXTVAL, 2,'Pizza Capriciosa', 450, 33, 'Blat, sos pizza, mozzarella, sunca, pepperoni, ciuperci, masline');
INSERT INTO produse VALUES(SEQ_PRODUSE.NEXTVAL, 3,'Paste Carbonara', 500, 40, 'Tagliatele, guanciale, ou, smantana, parmezan');
INSERT INTO produse VALUES(SEQ_PRODUSE.NEXTVAL, 4,'Rib-Eye Steak', 500, 75, 'Antricot de vita argentina');
INSERT INTO produse VALUES(SEQ_PRODUSE.NEXTVAL, 5,'Crispy Strips', 400, 25, 'Pui tavalit prin pesmet, parmezan si fulgi de porumb');
INSERT INTO produse VALUES(SEQ_PRODUSE.NEXTVAL, 6,'Cheesecake', 150, 20, null);
INSERT INTO produse VALUES(SEQ_PRODUSE.NEXTVAL, 7,'Fresh Portocale', 150, 14.5, 'Fresh din portocale proaspete');

select * from produse;

CREATE SEQUENCE SEQ_INGREDIENTE
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 10000
NOCYCLE;

INSERT INTO ingrediente VALUES(SEQ_INGREDIENTE.NEXTVAL, 'Oua', 20, 30);
INSERT INTO ingrediente VALUES(SEQ_INGREDIENTE.NEXTVAL, 'Antricot vita', 4.5, 2.5);
INSERT INTO ingrediente VALUES(SEQ_INGREDIENTE.NEXTVAL, 'Piept pui', 15, 10);
INSERT INTO ingrediente VALUES(SEQ_INGREDIENTE.NEXTVAL, 'Sunca', 4.5, 3.5);
INSERT INTO ingrediente VALUES(SEQ_INGREDIENTE.NEXTVAL, 'Mozzarella', 5, 8.5);
INSERT INTO ingrediente VALUES(SEQ_INGREDIENTE.NEXTVAL, 'Paste Tagliatelle', 5, 8.5);
INSERT INTO ingrediente VALUES(SEQ_INGREDIENTE.NEXTVAL, 'Portocale', 10, 10);
INSERT INTO ingrediente VALUES (SEQ_INGREDIENTE.NEXTVAL, 'Conserva ton', 10, 12);

select * from ingrediente;

INSERT INTO contine VALUES(4, 2, 0.1);
INSERT INTO contine VALUES(5, 2, 0.1);
INSERT INTO contine VALUES(1, 3, 1);
INSERT INTO contine VALUES(5, 3, 0.1);
INSERT INTO contine VALUES(6, 3, 0.3);
INSERT INTO contine VALUES(2, 4, 0.5);
INSERT INTO contine VALUES(1, 5, 1);
INSERT INTO contine VALUES(3, 5, 0.3);
INSERT INTO contine VALUES(7, 7, 0.5);
INSERT INTO contine VALUES(8, 1, 1);



select * from contine;

CREATE SEQUENCE SEQ_FURNIZORI
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 1000
NOCYCLE;

INSERT INTO furnizori VALUES(SEQ_FURNIZORI.NEXTVAL, 'Metro', '033045564787', 'Str. 1 Decembrie 1918, Nr. 3');
INSERT INTO furnizori VALUES(SEQ_FURNIZORI.NEXTVAL, 'Selgros', '0789645034', 'Str. Energeticianului, Nr. 13');
INSERT INTO furnizori VALUES(SEQ_FURNIZORI.NEXTVAL, 'Lidl', '0798531450', 'Str. Traian Vuia, Nr. 4');
INSERT INTO furnizori VALUES(SEQ_FURNIZORI.NEXTVAL, 'Killer', '0744568901', 'Str. Marasesti, Nr. 10');
INSERT INTO furnizori VALUES(SEQ_FURNIZORI.NEXTVAL, 'Auchan', '0793457201', 'Str. Marasesti, Nr. 42');

select * from furnizori;

CREATE SEQUENCE SEQ_RECEPTII
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 1000000
NOCYCLE;

INSERT INTO receptii VALUES(SEQ_RECEPTII.NEXTVAL, 1, TO_TIMESTAMP('2022-02-09 07:00:00', 'YYYY-MM-DD HH24:MI:SS'), 895.84);
INSERT INTO receptii VALUES(SEQ_RECEPTII.NEXTVAL, 2, TO_TIMESTAMP('2022-02-15 08:10:00', 'YYYY-MM-DD HH24:MI:SS'), 1034.5);
INSERT INTO receptii VALUES(SEQ_RECEPTII.NEXTVAL, 3, TO_TIMESTAMP('2022-05-29 09:54:12', 'YYYY-MM-DD HH24:MI:SS'), 450.99);
INSERT INTO receptii VALUES(SEQ_RECEPTII.NEXTVAL, 4, TO_TIMESTAMP('2022-03-31 14:32:52', 'YYYY-MM-DD HH24:MI:SS'), 156.4);
INSERT INTO receptii VALUES(SEQ_RECEPTII.NEXTVAL, 3, TO_TIMESTAMP('2022-04-14 11:10:40', 'YYYY-MM-DD HH24:MI:SS'), 568.7);

select * from receptii;

INSERT INTO produse_receptie VALUES(1, 1, 240);
INSERT INTO produse_receptie VALUES(2, 1, 3.5);
INSERT INTO produse_receptie VALUES(5, 3, 4.5);
INSERT INTO produse_receptie VALUES(3, 2, 3.5);
INSERT INTO produse_receptie VALUES(4, 4, 5.5);
INSERT INTO produse_receptie VALUES(2, 2, 1.5);
INSERT INTO produse_receptie VALUES(1, 3, 120);
INSERT INTO produse_receptie VALUES(3, 3, 5.5);

select * from produse_receptie;

CREATE SEQUENCE SEQ_CARD
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 100000
NOCYCLE;

INSERT INTO card VALUES(SEQ_CARD.NEXTVAL, 1, '4124895463178245', '10/23', 'Maru', 'Andrei');
INSERT INTO card VALUES(SEQ_CARD.NEXTVAL, 2, '4124898761178245', '10/27', 'Marinescu', 'Ana');
INSERT INTO card VALUES(SEQ_CARD.NEXTVAL, null, '6789895463178245', '08/24', null, null);
INSERT INTO card VALUES(SEQ_CARD.NEXTVAL, null, '1234895463178245', '04/23', null, null);
INSERT INTO card VALUES(SEQ_CARD.NEXTVAL, null, '5678895463178245', '06/25', null, null);

select * from card;

INSERT INTO masini_livrare VALUES('VWGZ56874120158M9', 'B-201-PPN', TO_DATE('2023-05-16', 'YYYY-MM-DD'));
INSERT INTO masini_livrare VALUES('USGZ56876820158M9', 'B-202-PPN', TO_DATE('2023-05-16', 'YYYY-MM-DD'));
INSERT INTO masini_livrare VALUES('BMWZ5687412017826', 'B-203-PPN', TO_DATE('2023-05-16', 'YYYY-MM-DD'));
INSERT INTO masini_livrare VALUES('VWGZ56874187968M9', 'B-204-PPN', TO_DATE('2022-12-31', 'YYYY-MM-DD'));
INSERT INTO masini_livrare VALUES('VWGZ56565485158M9', 'B-205-PPN', TO_DATE('2023-02-05', 'YYYY-MM-DD'));

select * from masini_livrare;

CREATE SEQUENCE SEQ_ANGAJATI
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 1000
NOCYCLE;

INSERT INTO angajati VALUES(SEQ_ANGAJATI.NEXTVAL, null, 'Bran', 'Andrei', '1235847456321', 'Manager', '0755496321', TO_DATE('2020-12-10', 'YYYY-MM-DD'));
INSERT INTO angajati VALUES(SEQ_ANGAJATI.NEXTVAL, null, 'Iepure', 'Andrei', '5485645521563', 'Pizzer', '0755496321', TO_DATE('2021-02-13', 'YYYY-MM-DD'));
INSERT INTO angajati VALUES(SEQ_ANGAJATI.NEXTVAL, null, 'Antoneac', 'Letty', '5154562355648', 'Bucatar-Sef', '0755496321', TO_DATE('2020-10-10', 'YYYY-MM-DD'));
INSERT INTO angajati VALUES(SEQ_ANGAJATI.NEXTVAL, null, 'Iepure', 'Mihai', '7454239665842', 'Bucatar', '0755496321', TO_DATE('2022-08-22', 'YYYY-MM-DD'));
INSERT INTO angajati VALUES(SEQ_ANGAJATI.NEXTVAL, null, 'Paduraru', 'Cosmin', '4262456265746', 'Barman', '0755496321', TO_DATE('2022-04-10', 'YYYY-MM-DD'));
INSERT INTO angajati VALUES(SEQ_ANGAJATI.NEXTVAL, 'VWGZ56874120158M9', 'Mitrea', 'Radu', '4897465546525', 'Sofer', '0755496321', TO_DATE('2021-06-10', 'YYYY-MM-DD'));
INSERT INTO angajati VALUES(SEQ_ANGAJATI.NEXTVAL, null, 'Dochitei', 'Denisa', '4897465546525', 'Ospatar', '0758632147', TO_DATE('2021-06-10', 'YYYY-MM-DD'));

select * from angajati;

CREATE SEQUENCE SEQ_COMENZI
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 1000000
NOCYCLE;

INSERT INTO comenzi VALUES(SEQ_COMENZI.NEXTVAL, 1, 6, 'Str. Tineretului, Nr.3, Bl.144, Sc.B, Ap.10', TO_TIMESTAMP('2022-02-09 07:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO comenzi VALUES(SEQ_COMENZI.NEXTVAL, 2, 6, 'Str. Aviatorului, Nr.4', TO_TIMESTAMP('2022-02-09 07:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO comenzi VALUES(SEQ_COMENZI.NEXTVAL, null, 7, null, TO_TIMESTAMP('2022-02-09 07:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO comenzi VALUES(SEQ_COMENZI.NEXTVAL, null, 7, null, TO_TIMESTAMP('2022-02-09 07:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO comenzi VALUES(SEQ_COMENZI.NEXTVAL, null, 7, null, TO_TIMESTAMP('2022-02-09 07:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO comenzi VALUES(SEQ_COMENZI.NEXTVAL, 5, 6, 'Str. Victoriei, Nr. 56', TO_TIMESTAMP('2022-02-09 07:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO comenzi VALUES(SEQ_COMENZI.NEXTVAL, 4, 6, 'Blvd. George Enescu, Nr. 11A', TO_TIMESTAMP('2022-02-09 07:00:00', 'YYYY-MM-DD HH24:MI:SS'));

select * from comenzi;

CREATE SEQUENCE SEQ_PLATA
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 1000000
NOCYCLE;

INSERT INTO mod_plata VALUES(SEQ_PLATA.NEXTVAL, 1, 1, 100, 0.1);
INSERT INTO mod_plata VALUES(SEQ_PLATA.NEXTVAL, 2, 2, 45, 0);
INSERT INTO mod_plata VALUES(SEQ_PLATA.NEXTVAL, 3, null, 49, 0);
INSERT INTO mod_plata VALUES(SEQ_PLATA.NEXTVAL, 4, null, 65.5, 0);
INSERT INTO mod_plata VALUES(SEQ_PLATA.NEXTVAL, 5, null, 72, 0);

select * from mod_plata;

INSERT INTO produse_comanda VALUES(2, 1, 2, 3);
INSERT INTO produse_comanda VALUES(1, 2, 2, 5);
INSERT INTO produse_comanda VALUES(3, 3, 3, 1);
INSERT INTO produse_comanda VALUES(4, 4, 4, 1);
INSERT INTO produse_comanda VALUES(5, 5, 3, 2);
INSERT INTO produse_comanda VALUES(6, 2, 5, 1);
INSERT INTO produse_comanda VALUES(1, 1, 2, 1);
INSERT INTO produse_comanda VALUES(3, 2, 2, 1);
INSERT INTO produse_comanda VALUES(6, 3, 3, 1);
INSERT INTO produse_comanda VALUES(5, 4, 4, 1);
INSERT INTO produse_comanda VALUES(7, 5, 3, 2);



select * from produse_comanda;


-- 6
CREATE OR REPLACE PROCEDURE ex_6
IS
    TYPE produs IS RECORD (id_produs produse.id_produs%TYPE, nume produse.nume%TYPE);
    TYPE vec_categorii IS TABLE OF categorii%ROWTYPE INDEX BY PLS_INTEGER;
    TYPE vec_produse IS TABLE OF produs;
    TYPE vec_contine IS VARRAY(20) OF (ingrediente.id_ingredient%TYPE);
    v_produse vec_produse := vec_produse();
    v_categorii vec_categorii;
    v_contine vec_contine := vec_contine();
    j INTEGER;
    v_nume ingrediente.nume%TYPE;
    a NUMBER(4);
BEGIN
    SELECT * BULK COLLECT INTO v_categorii FROM categorii;
    FOR i IN v_categorii.FIRST..v_categorii.LAST LOOP
        SELECT id_produs, nume BULK COLLECT INTO v_produse FROM produse WHERE id_categorie = v_categorii(i).id_categorie;
        DBMS_OUTPUT.PUT_LINE('Categoria ' || v_categorii(i).nume);
        j := v_produse.FIRST;
        WHILE j <= v_produse.LAST LOOP
            DBMS_OUTPUT.PUT(v_produse(j).nume || ' : ');
            SELECT COUNT(*) INTO a FROM contine WHERE id_produs = v_produse(j).id_produs;
            IF a > 0 THEN
                a := a - 1;
                SELECT id_ingredient BULK COLLECT INTO v_contine FROM contine WHERE v_produse(j).id_produs = id_produs;   
                FOR k in v_contine.FIRST..v_contine.LAST LOOP
                    SELECT nume INTO v_nume FROM ingrediente WHERE id_ingredient = v_contine(k);
                    DBMS_OUTPUT.PUT(v_nume);
                    IF a > 0 THEN
                        DBMS_OUTPUT.PUT(', ');
                        a := a - 1;
                    END IF;
                END LOOP;
            ELSE
                DBMS_OUTPUT.PUT('Nu exista inca ingrediente introduse pentru acest produs');
            END IF;
            j := v_produse.NEXT(j);
            DBMS_OUTPUT.NEW_LINE;
        END LOOP;
        DBMS_OUTPUT.NEW_LINE;
    END LOOP;
END ex_6;

/

BEGIN
    ex_6();
END;


-- 7
CREATE OR REPLACE PROCEDURE ex_7
    (p_nume clienti.nume%TYPE,
     p_prenume clienti.prenume%TYPE)
IS
    g_id_comanda comenzi.id_comanda%TYPE;
    g_data_primire comenzi.data_primire%TYPE;
    g_nume_produs produse.nume%TYPE;
    g_index NUMBER(4) := 1;
    g_comma BOOLEAN;
    CURSOR c_comenzi_client
    IS
        SELECT id_comanda, data_primire FROM comenzi WHERE id_client = (SELECT id_client
                                                                        FROM clienti
                                                                        WHERE nume = p_nume AND prenume = p_prenume);
    CURSOR c_produse_comanda (v_id_comanda comenzi.id_comanda%TYPE)
    IS
        SELECT id_produs FROM produse_comanda WHERE id_comanda = v_id_comanda;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Clientul cu numele ' || p_nume || ' ' || p_prenume || ' a dat comenzile:');
    --cursor clasic
    OPEN c_comenzi_client;
    LOOP
        FETCH c_comenzi_client INTO g_id_comanda, g_data_primire;
        EXIT WHEN c_comenzi_client%NOTFOUND;
        DBMS_OUTPUT.PUT(g_index || '. Comanda de la data de ' || TO_CHAR(g_data_primire, 'YYYY-MM-DD HH24:MI:SS') || ' contine: ');
        g_comma := true;
        --ciclu cursor cu parametru
        FOR i IN c_produse_comanda(g_id_comanda) LOOP
            SELECT nume INTO g_nume_produs FROM produse WHERE id_produs = i.id_produs;
            IF g_comma THEN
                DBMS_OUTPUT.PUT(g_nume_produs);
                g_comma := false;
            ELSE
                DBMS_OUTPUT.PUT(', ' || g_nume_produs);
            END IF;
        END LOOP;
        DBMS_OUTPUT.NEW_LINE;
        g_index := g_index + 1;
    END LOOP;
END ex_7;

/

DECLARE
    v_nume clienti.nume%TYPE := 'Maru';
    v_prenume clienti.prenume%TYPE :='Andrei';
BEGIN
    ex_7(v_nume, v_prenume);
END;



-- 8
CREATE OR REPLACE FUNCTION ex_8 (f_nume clienti.nume%TYPE,
                                 f_prenume clienti.prenume%TYPE,
                                 f_data comenzi.data_primire%TYPE)
                                 RETURN NUMBER
IS
    TYPE price_table_datatype IS TABLE OF NUMBER(8, 2) INDEX BY PLS_INTEGER;
    price_table price_table_datatype;
    pret_total NUMBER(8,2) := 0;
    nr NUMBER(4);
    v_id_client clienti.id_client%TYPE;
    zero_clients_exc EXCEPTION;
    multiple_clients_exc EXCEPTION;
    zero_orders_exc EXCEPTION;
BEGIN
    SELECT COUNT(*) INTO nr FROM clienti WHERE nume = f_nume AND prenume = f_prenume;
    IF nr = 0 THEN
        RAISE zero_clients_exc;
    ELSIF nr > 1 THEN
        RAISE multiple_clients_exc;
    END IF;
    SELECT id_client INTO v_id_client FROM clienti WHERE UPPER(nume) = UPPER(f_nume) AND UPPER(prenume) = UPPER(f_prenume);
    SELECT COUNT(*) INTO nr FROM comenzi WHERE id_client = v_id_client AND data_primire = f_data;
    IF nr = 0 THEN
        RAISE zero_orders_exc;
    END IF;
    SELECT pc.cantitate * p.pret BULK COLLECT INTO price_table FROM produse_comanda pc
    JOIN comenzi c
    ON c.id_comanda = pc.id_comanda
    JOIN produse p
    ON p.id_produs = pc.id_produs
    WHERE c.id_client = v_id_client AND c.data_primire = f_data;
    FOR i IN price_table.FIRST..price_table.LAST LOOP
        pret_total := pret_total + price_table(i);
    END LOOP;
    RETURN NVL(pret_total, 0);
    EXCEPTION
        WHEN zero_clients_exc THEN
            RAISE_APPLICATION_ERROR(-20001, 'Nu exista nici un client cu numele dat');
        WHEN multiple_clients_exc THEN
            RAISE_APPLICATION_ERROR(-20002, 'Exista mai multi clienti cu numele dat');
        WHEN zero_orders_exc THEN
            RAISE_APPLICATION_ERROR(-20003, 'Nu exista nici o comanda data de acest client la data respectiva');
        WHEN value_error THEN
            RAISE_APPLICATION_ERROR(-20004, 'Nu exista nici un produs in comanda data');
END ex_8;

/

DECLARE
    v_nume clienti.nume%TYPE := 'Maru';
    v_prenume clienti.prenume%TYPE := 'Andrei';
    v_data comenzi.data_primire%TYPE := '09-FEB-22 07.00.00.000000000 AM';
--     exemplu pentru eroarea -20001
--    v_nume clienti.nume%TYPE := 'Maru';
--    v_prenume clienti.prenume%TYPE := 'Marius';
--    v_data comenzi.data_primire%TYPE := '09-FEB-22 07.00.00.000000000 AM';
----    exemplu pentru eroarea -20002
--    v_nume clienti.nume%TYPE := 'Stanescu';
--    v_prenume clienti.prenume%TYPE := 'Rares';
--    v_data comenzi.data_primire%TYPE := '09-FEB-22 07.00.00.000000000 AM';
----    exemplu pentru eroarea -20003
--    v_nume clienti.nume%TYPE := 'Maru';
--    v_prenume clienti.prenume%TYPE := 'Andrei';
--    v_data comenzi.data_primire%TYPE := '09-FEB-22 08.20.00.000000000 AM';
----    exemplu pentru eroarea -20004
--    v_nume clienti.nume%TYPE := 'Stan';
--    v_prenume clienti.prenume%TYPE := 'Denisa';
--    v_data comenzi.data_primire%TYPE := '09-FEB-22 07.00.00.000000000 AM';
BEGIN
    DBMS_OUTPUT.PUT_LINE(ex_8(v_nume, v_prenume, v_data));
END;


-- 10
CREATE OR REPLACE TRIGGER ex_10
    BEFORE INSERT OR UPDATE OR DELETE ON comenzi
BEGIN
    IF          ((TO_CHAR(SYSDATE, 'DAY') = 'SATURDAY' OR TO_CHAR(SYSDATE, 'DAY') = 'SUNDAY') 
            AND 
                (TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) > 23 OR TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) < 9)) 
        OR 
                ((TO_CHAR(SYSDATE, 'DAY') != 'SATURDAY' AND TO_CHAR(SYSDATE, 'DAY') != 'SUNDAY') 
            AND 
                (TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) > 23 OR TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) < 8)) 
    THEN
        RAISE_APPLICATION_ERROR(-20020, 'Restaurantul este inchis');
    END IF;
END ex_10;

/

BEGIN
    DBMS_OUTPUT.PUT_LINE('Zi: ' || TO_CHAR(SYSDATE, 'DAY') || ', ora: ' || TO_CHAR(SYSDATE, 'HH24:MI'));
    INSERT INTO comenzi VALUES(SEQ_COMENZI.NEXTVAL, 4, 7, null, TO_TIMESTAMP('2022-02-09 08:00:00', 'YYYY-MM-DD HH24:MI:SS'));
END;



-- 11
CREATE OR REPLACE TRIGGER ex_11
    BEFORE INSERT OR UPDATE
    ON produse_comanda
    FOR EACH ROW
DECLARE
    v_nume_produs produse.nume%TYPE;
    CURSOR ingredients (id_prod produse.id_produs%TYPE)
    IS 
        SELECT * FROM contine c
        JOIN ingrediente i ON c.id_ingredient = i.id_ingredient
        WHERE id_produs = id_prod;
BEGIN
    SELECT nume INTO v_nume_produs FROM produse WHERE id_produs = :NEW.id_produs;
    FOR i IN ingredients(:NEW.id_produs) LOOP
        IF :NEW.cantitate * i.cantitate > i.stoc THEN
            RAISE_APPLICATION_ERROR(-20030, 'Nu exista suficient stoc de ' || i.nume || ' pentru a produce produsul ' || v_nume_produs);
        ELSIF i.stoc - :NEW.cantitate * i.cantitate < i.stoc_necesar THEN
            DBMS_OUTPUT.PUT_LINE('Nu mai este mentinut stocul necesar la ingredientul ' || i.nume);
        END IF;
    END LOOP;
END ex_11;

/

BEGIN
    -- inserare la care suntem avertizati despre ingredientul mozzarella ca nu are stoc necesar, insa sunca are stoc necesar
    INSERT INTO produse_comanda VALUES (2, 8, 2, 1);
    -- inserare la care suntem avertizati ca nu mai este mentinut stocul necesar nici la sunca nici la mozzarella
--    INSERT INTO produse_comanda VALUES (2, 8, 2, 12);
--    -- inserare care nu este permisa
--    INSERT INTO produse_comanda VALUES (2, 8, 2, 50);
END;


-- 12
CREATE OR REPLACE TRIGGER ex_12
    BEFORE CREATE OR DROP OR ALTER ON SCHEMA
BEGIN
    IF USER != 'ADMIN' THEN
        RAISE_APPLICATION_ERROR(-20040, 'Doar utilizatorul admin poate modifica schema bazei de date');
    ELSIF TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) < 23 THEN
        RAISE_APPLICATION_ERROR(-20041, 'Doar in afara programului de functionare a restaurantului puteti efectua modificari asupra schemei bazei de date');
    END IF;
    IF TO_CHAR(SYSDATE, 'DAY') = 'SUNDAY' OR TO_CHAR(SYSDATE, 'DAY') = 'SATURDAY' THEN
        IF TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) > 9 THEN
            RAISE_APPLICATION_ERROR(-20041, 'Doar in afara programului de functionare a restaurantului puteti efectua modificari asupra schemei bazei de date');
        END IF;
    ELSE
        IF TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) > 8 THEN
            RAISE_APPLICATION_ERROR(-20041, 'Doar in afara programului de functionare a restaurantului puteti efectua modificari asupra schemei bazei de date');
        END IF;
    END IF;
END ex_12;

/

CREATE TABLE example (ex NUMBER(2));


-- 13
