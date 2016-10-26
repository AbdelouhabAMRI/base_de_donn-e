CREATE TABLE CONTRE_INDICATION
(
  ID_C_INDICATION NUMBER NOT NULL 
, POID_MIN NUMBER
, AGE_MIN NUMBER 
, ENCEINTE NUMBER   
, CONSTRAINT INDICATION_PK PRIMARY KEY(ID_C_INDICATION) 
, ALCHOLIQUE NUMBER
); 
INSERT INTO CONTRE_INDICATION values (1,30,10,0,0);
INSERT INTO CONTRE_INDICATION values (2,20,12,0,0);
INSERT INTO CONTRE_INDICATION values (3,40,15,0,0);
INSERT INTO CONTRE_INDICATION values (4,80,16,0,0);

CREATE TABLE EFFET_INDESERABLE 
(
  ID_EFFET NUMBER PRIMARY KEY NOT NULL 
, NOM_EFFET VARCHAR(50) 
); 
INSERT INTO EFFET_INDESERABLE VALUES (1,'INFLAMATION VISAGE');
INSERT INTO EFFET_INDESERABLE VALUES (2,'TACHE SUR LE VENTRE');
INSERT INTO EFFET_INDESERABLE VALUES (3,'INFLAMATION A LA MAIN');
INSERT INTO EFFET_INDESERABLE VALUES (4,'BOUTON SUR LE VISAGE');

CREATE TABLE INDICATION
(
  ID_INDICATION NUMBER PRIMARY KEY NOT NULL 
, NOM_INDICATION VARCHAR(50) 
); 
insert into INDICATION values(1,'TOUX');
insert into INDICATION values(2,'MAUX DE GORGE');
insert into INDICATION values(3,'FIEVRE');
insert into INDICATION values(4,'MAL AU VENTRE');
insert into INDICATION values(5,'MAL A LA TETE');
insert into INDICATION values(6,'MAL AU DOS');


CREATE TABLE LABORATOIRE 
(
  ID_LABO NUMBER PRIMARY KEY NOT NULL 
, NOM_LABO VARCHAR(50) 
); 
insert into LABORATOIRE values(1,'LABO_FLEUR');
insert into LABORATOIRE values(2,'LABO_CAPITAL');
insert into LABORATOIRE values(3,'LABO_CAD');
insert into LABORATOIRE values(4,'LABO_AMIDA');
insert into LABORATOIRE values(5,'LABO_VERT');


CREATE TABLE MALADIE 
(
  ID_MALADIE NUMBER PRIMARY KEY  
, NOM_MALADIE VARCHAR(50) 
, TYPE_MALADIE VARCHAR(50)
); 
insert into MALADIE values (1,'infections bact�riennes et mycoses','');
insert into MALADIE values (2,'infections bact�riennes','');
insert into MALADIE values (3,'bact�ri�mie','');
insert into MALADIE values (4,'abc�s c�r�bral','');
insert into MALADIE values (5,'empy�me subdural','');
insert into MALADIE values (6,'m�ningite bact�rienne','');
insert into MALADIE values (7,'diabete','chronique');
insert into MALADIE values (8,'rhume','');


CREATE TABLE MEDECIN 
(
  ID_MEDE NUMBER PRIMARY KEY NOT NULL 
, NOM_MEDE VARCHAR(50) 
, PRENOM_MEDE VARCHAR(50) 
, SPECIALITE_MEDE VARCHAR(50) 
, TEL_MEDE NUMBER 
); 
INSERT INTO MEDECIN VALUES(1,'AMRI','ABDELOUHAB','CARDIOLOGUE','0646717086');
INSERT INTO MEDECIN VALUES(2,'HENRY','MATISSE','DERMATOLOGUE','0123454567');
INSERT INTO MEDECIN VALUES(3,'ABDELKAMEL','ALITOUCHE','GENECOLGUE','0675654653');

CREATE TABLE MEDICAMENT 
(
  ID_MEDICAMENT NUMBER PRIMARY KEY NOT NULL 
, NOM_MEDICAMENT VARCHAR(100) 
, ID_LABO NUMBER
, CONSTRAINT fk_medecin_labo FOREIGN KEY (ID_LABO ) REFERENCES LABORATOIRE(ID_LABO )
); 
insert into MEDICAMENT VALUES(1,'POLYOSIDE(S) DE NEISSERIA MENINGITIDIS GROUPE A',1);
insert into MEDICAMENT VALUES(2,'ZINNAT 1,5 g, poudre pour solution pour perfusion',1);
insert into MEDICAMENT VALUES(3,'PARACETAMOL',2);
insert into MEDICAMENT VALUES(4,'ZADYTHIN',1);


CREATE TABLE OBSERVATION 
(
  ID_OBS NUMBER PRIMARY KEY NOT NULL 
, NOM_OBS VARCHAR(50 ) 
); 

insert into OBSERVATION values(1,'gorge rouge');
insert into OBSERVATION values(2,'gorge inflame');
insert into OBSERVATION values(3,'fivre 39 degre');
insert into OBSERVATION values(4,'rythme caridique elev�');


CREATE TABLE PATIENT 
(
  ID_PATIENT NUMBER PRIMARY KEY NOT NULL 
, NOM_P VARCHAR(50) 
, PRENOM_P VARCHAR(50) 
, SEXE_P VARCHAR(50)  
, AGE_P NUMBER 
, POID_P NUMBER
); 

insert into PATIENT values(1,'abdelmoumen','djabou','homme',28,69);
insert into PATIENT values(2,'amazighe','kateb','homme',30,50);
insert into PATIENT values(3,'djames','rodriquez','homme',25,67);
insert into PATIENT values(4,'djamila','kateb','femme',30,70);
insert into PATIENT values(5,'sofia','abassi','femme',30,50);
insert into PATIENT values(6,'sihem','aabdi','femme',30,50);

CREATE TABLE RECOMMENDATION 
(
  ID_RECOM NUMBER PRIMARY KEY NOT NULL 
, NOM_RECOM VARCHAR(50) 
); 
insert into RECOMMENDATION values(1,'pas fumer');
insert into RECOMMENDATION values(2,'pas d''alchol');
insert into RECOMMENDATION values(3,'pas d''activit� physique dure');

CREATE TABLE SUBSTANCE 
(
  ID_SUBSTANCE NUMBER PRIMARY KEY NOT NULL 
, NOM_SUBSTANCE VARCHAR2(50) 
); 
insert into SUBSTANCE values(1,'PARACETAMOLE');
insert into SUBSTANCE values(2,'METHANOL');
insert into SUBSTANCE values(3,'ETHANOL');
insert into SUBSTANCE values(4,'CHLORYDRATE');
insert into SUBSTANCE values(5,'ACYTRATE');

CREATE TABLE TRAITEMENT 
(
  ID_TRAIT NUMBER PRIMARY KEY NOT NULL 
, DUR_JOUR_TRAIT NUMBER
); 
insert into TRAITEMENT values(1,30);
insert into TRAITEMENT values(2,20);
insert into TRAITEMENT values(3,10);
insert into TRAITEMENT values(4,17);
insert into TRAITEMENT values(5,39);
insert into TRAITEMENT values(6,34);
insert into TRAITEMENT values(7,22);
insert into TRAITEMENT values(8,14);
insert into TRAITEMENT values(9,28);
insert into TRAITEMENT values(10,38);


CREATE TABLE MALADIE_INDICATION 
(
  ID_MALADIE NUMBER NOT NULL 
, ID_INDICATION NUMBER NOT NULL 
, PRIMARY KEY (ID_MALADIE ,ID_INDICATION )
, CONSTRAINT fk_maladie_indication1 FOREIGN KEY (ID_MALADIE) REFERENCES MALADIE(ID_MALADIE)
, CONSTRAINT fk_maladie_indication2 FOREIGN KEY (ID_INDICATION) REFERENCES INDICATION(ID_INDICATION)
); 
insert into MALADIE_INDICATION values(8,1);
insert into MALADIE_INDICATION values(8,2);
insert into MALADIE_INDICATION values(8,3);
insert into MALADIE_INDICATION values(8,5);


CREATE TABLE EFFET_MEDICA 
(
  ID_EFFET NUMBER NOT NULL 
, ID_MEDICAMENT NUMBER NOT NULL 
, PRIMARY KEY (ID_EFFET ,ID_MEDICAMENT )
, CONSTRAINT fk_effet_medicament1 FOREIGN KEY (ID_EFFET) REFERENCES EFFET_INDESERABLE(ID_EFFET ) 
, CONSTRAINT fk_effet_medicament2 FOREIGN KEY (ID_MEDICAMENT) REFERENCES MEDICAMENT(ID_MEDICAMENT) 
); 
insert into EFFET_MEDICA values(1,2);
insert into EFFET_MEDICA values(3,2);
insert into EFFET_MEDICA values(1,4);

CREATE TABLE INDICATION_MEDICAMENT 
(
  ID_INDICATION NUMBER NOT NULL 
, ID_MEDICAMENT NUMBER NOT NULL 
, PRIMARY KEY (ID_INDICATION ,ID_MEDICAMENT )
, CONSTRAINT fk_indication_medicament1 FOREIGN KEY (ID_INDICATION ) REFERENCES INDICATION(ID_INDICATION )
, CONSTRAINT fk_indication_medicament2 FOREIGN KEY (ID_MEDICAMENT ) REFERENCES MEDICAMENT(ID_MEDICAMENT )
); 
insert into INDICATION_MEDICAMENT values(1,3);
insert into INDICATION_MEDICAMENT values(2,3);
insert into INDICATION_MEDICAMENT values(3,3);
insert into INDICATION_MEDICAMENT values(5,3);

CREATE TABLE MEDICAMENT_CONTRE_INDICATION 
(
  ID_C_INDICATION NUMBER NOT NULL 
, ID_MEDICAMENT NUMBER NOT NULL 
, PRIMARY KEY (ID_C_INDICATION ,ID_MEDICAMENT)
, CONSTRAINT fk_medica_indication1 FOREIGN KEY (ID_C_INDICATION) REFERENCES CONTRE_INDICATION(ID_C_INDICATION)  
, CONSTRAINT fk_medica_indication2 FOREIGN KEY (ID_MEDICAMENT) REFERENCES MEDICAMENT(ID_MEDICAMENT) 
); 

insert into MEDICAMENT_CONTRE_INDICATION values(3,1);
insert into MEDICAMENT_CONTRE_INDICATION values(4,2);
insert into MEDICAMENT_CONTRE_INDICATION values(1,3);
insert into MEDICAMENT_CONTRE_INDICATION values(2,4);


CREATE TABLE LABO_MEDICA 
(
  ID_LABO NUMBER NOT NULL 
, ID_MEDICAMENT NUMBER NOT NULL 
, PRIMARY KEY (ID_LABO ,ID_MEDICAMENT )
, CONSTRAINT fk_labo_medica1 FOREIGN KEY (ID_LABO) REFERENCES LABORATOIRE(ID_LABO) 
, CONSTRAINT fk_labo_medica2 FOREIGN KEY (ID_MEDICAMENT) REFERENCES MEDICAMENT(ID_MEDICAMENT)
); 
insert into LABO_MEDICA values(1,1);
insert into LABO_MEDICA values(1,2);
insert into LABO_MEDICA values(2,3);
insert into LABO_MEDICA values(1,4);

CREATE TABLE MEDECIN_MEDICA 
(
  ID_MEDE NUMBER NOT NULL 
, ID_MEDICAMENT NUMBER NOT NULL 
, PRIMARY KEY (ID_MEDE ,ID_MEDICAMENT )
, CONSTRAINT fk_medecin_medica1 FOREIGN KEY (ID_MEDE) REFERENCES MEDECIN(ID_MEDE)
, CONSTRAINT fk_medecin_medica2 FOREIGN KEY (ID_MEDICAMENT) REFERENCES MEDICAMENT(ID_MEDICAMENT) 
); 

insert into MEDECIN_MEDICA values(1,4);
insert into MEDECIN_MEDICA values(2,2);
insert into MEDECIN_MEDICA values(2,3);
insert into MEDECIN_MEDICA values(3,4);

CREATE TABLE MALADIE_OBSERVATION 
(
  ID_OBS NUMBER NOT NULL 
, ID_MALADIE NUMBER NOT NULL 
, PRIMARY KEY (ID_OBS ,ID_MALADIE )
, CONSTRAINT fk_maladie_obser1 FOREIGN KEY (ID_OBS) REFERENCES OBSERVATION(ID_OBS)
, CONSTRAINT fk_maladie_obser2 FOREIGN KEY (ID_MALADIE) REFERENCES MALADIE(ID_MALADIE)
); 
insert into MALADIE_OBSERVATION values(1,8);
insert into MALADIE_OBSERVATION values(2,8);
insert into MALADIE_OBSERVATION values(3,8);

CREATE TABLE OBSERVATION_MEDECIN 
(
  ID_OBS NUMBER NOT NULL 
, ID_MEDE NUMBER NOT NULL 
, PRIMARY KEY (ID_OBS ,ID_MEDE )
, CONSTRAINT fk_observation_medecin1 FOREIGN KEY (ID_OBS) REFERENCES OBSERVATION(ID_OBS)
, CONSTRAINT fk_observation_medecin2 FOREIGN KEY (ID_MEDE) REFERENCES MEDECIN(ID_MEDE)
); 
insert into OBSERVATION_MEDECIN_ values(1,1);
insert into OBSERVATION_MEDECIN_ values(2,1);
insert into OBSERVATION_MEDECIN values(3,1);
insert into OBSERVATION_MEDECIN values(1,2);
insert into OBSERVATION_MEDECIN values(2,2);
insert into OBSERVATION_MEDECIN values(3,2);



CREATE TABLE CONSULTATION 
(
  DATE_CONS DATE NOT NULL 
, ID_MEDE NUMBER NOT NULL 
, ID_PATIENT NUMBER NOT NULL 
, PRIMARY KEY (DATE_CONS ,ID_MEDE ,ID_PATIENT )
, CONSTRAINT fk_table_consult1 FOREIGN KEY (ID_MEDE) REFERENCES MEDECIN(ID_MEDE)
, CONSTRAINT fk_table_consult2 FOREIGN KEY (ID_PATIENT) REFERENCES PATIENT(ID_PATIENT)
); 

insert into CONSULTATION values('18-08-2015',1,1);
insert into CONSULTATION values('12-08-2015',2,3);
insert into CONSULTATION values('01-04-2015',2,2);
insert into CONSULTATION values('20-05-2015',3,2);
insert into CONSULTATION values('14-08-2015',3,3);

CREATE TABLE PATIENT_MALADIE 
(
  ID_PATIENT NUMBER 
, ID_MALADIE NUMBER 
, PRIMARY KEY (ID_PATIENT ,ID_MALADIE ) 
, CONSTRAINT fk_patient_maladie1 FOREIGN KEY (ID_PATIENT) REFERENCES PATIENT(ID_PATIENT)
, CONSTRAINT fk_patient_maladie2 FOREIGN KEY (ID_MALADIE) REFERENCES MALADIE(ID_MALADIE)
); 

insert into PATIENT_MALADIE values(3,2);
insert into PATIENT_MALADIE values(4,3);

SELECT *  FR
CREATE TABLE SUBSTANCE_MEDICAMENT 
(
  ID_MEDICAMENT NUMBER NOT NULL 
, ID_SUBSTANCE NUMBER NOT NULL 
, PRIMARY KEY (ID_MEDICAMENT ,ID_SUBSTANCE )
, CONSTRAINT fk_substance_medicament1 FOREIGN KEY (ID_MEDICAMENT) REFERENCES MEDICAMENT(ID_MEDICAMENT)
, CONSTRAINT fk_substance_medicament2 FOREIGN KEY (ID_SUBSTANCE) REFERENCES SUBSTANCE(ID_SUBSTANCE)
); 
insert into SUBSTANCE_MEDICAMENT values(1,3);
insert into SUBSTANCE_MEDICAMENT values(1,5);
insert into SUBSTANCE_MEDICAMENT values(2,1);
insert into SUBSTANCE_MEDICAMENT values(3,4);
insert into SUBSTANCE_MEDICAMENT values(4,3);
insert into SUBSTANCE_MEDICAMENT values(4,2);


CREATE TABLE MALADIE_TRAITEMENT 
(
  ID_TRAIT NUMBER NOT NULL 
, ID_MALADIE NUMBER NOT NULL 
, PRIMARY KEY (ID_TRAIT ,ID_MALADIE )
, CONSTRAINT fk_maladie_traitment1 FOREIGN KEY (ID_TRAIT) REFERENCES TRAITEMENT(ID_TRAIT)
, CONSTRAINT fk_maladie_traitment2 FOREIGN KEY (ID_MALADIE) REFERENCES MALADIE(ID_MALADIE)
); 
insert into MALADIE_TRAITEMENT values(8,8);

CREATE TABLE MEDECIN_TRAITEMENT 
(
  ID_MEDE NUMBER NOT NULL 
, ID_TRAIT NUMBER NOT NULL
, PRIMARY KEY (ID_MEDE ,ID_TRAIT ) 
, CONSTRAINT fk_medecin_traitment1 FOREIGN KEY (ID_MEDE) REFERENCES MEDECIN(ID_MEDE)
, CONSTRAINT fk_medecin_traitment2 FOREIGN KEY (ID_TRAIT) REFERENCES TRAITEMENT(ID_TRAIT)
); 
insert into MEDECIN_TRAITEMENT values(2,8);

CREATE TABLE PATIENT_TRAITEMENT 
(
  ID_TRAIT NUMBER NOT NULL 
, ID_PATIENT NUMBER NOT NULL
, PRIMARY KEY (ID_TRAIT ,ID_PATIENT ) 
, CONSTRAINT fk_patient_traitment1 FOREIGN KEY (ID_TRAIT) REFERENCES TRAITEMENT(ID_TRAIT)
, CONSTRAINT fk_patient_traitment2 FOREIGN KEY (ID_PATIENT) REFERENCES PATIENT(ID_PATIENT)
); 
insert into PATIENT_TRAITEMENT values(8,1);
insert into PATIENT_TRAITEMENT values(8,3);

CREATE TABLE TRAIT_MEDICA 
(
  ID_MEDICAMENT NUMBER NOT NULL 
, ID_TRAIT NUMBER NOT NULL 
, PRIMARY KEY (ID_MEDICAMENT ,ID_TRAIT )
, CONSTRAINT fk_trait_medica1 FOREIGN KEY (ID_TRAIT) REFERENCES TRAITEMENT(ID_TRAIT)
, CONSTRAINT fk_trait_medica2 FOREIGN KEY (ID_MEDICAMENT) REFERENCES MEDICAMENT(ID_MEDICAMENT)
); 
insert into TRAIT_MEDICA values(3,8);
insert into TRAIT_MEDICA values(4,8);


CREATE TABLE TRAIT_RECOM 
(
  ID_RECOM NUMBER NOT NULL 
, ID_TRAIT NUMBER NOT NULL
, PRIMARY KEY (ID_RECOM ,ID_TRAIT ) 
, CONSTRAINT fk_trait_recom1 FOREIGN KEY (ID_TRAIT) REFERENCES TRAITEMENT(ID_TRAIT)
, CONSTRAINT fk_trait_recom2 FOREIGN KEY (ID_RECOM) REFERENCES RECOMMENDATION(ID_RECOM)
); 
insert into TRAIT_RECOM values(1,8);








