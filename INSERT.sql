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