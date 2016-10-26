SET SERVEROUTPUT ON

create or replace procedure sauvegarder_traitement(nom_med varchar,dure number,medicament1 varchar,medicament2 varchar,medicament3 varchar,recommendation1 varchar, recommendation2 varchar,nom_maladie varchar)
IS
id_trait number;
id_recom number;
id_medica number;
id_maladie number;

begin

select max(id_trait) into id_trait from traitement;
 
id_trait:=id_trait+1;
insert into traitement values(id_trait,dure);

select id_mede into id_medecin from medecin where nom_mede=nom_med;
insert into medecin_traitement values (id_trait,id_medecin);

if (SQL%NOTFOUND) then

	DBMS_OUTPUT.PUT_LINE('Le traitement n''a pas été sauvegardé');
	
else
	select max(id_medicament) into id_medica from medicament;
	id_medica:=id_medica+1;
	insert into medicament values(id_medica,medicament1);
	insert into trait_medica values(id_trait,id_medica);

	id_medica:=id_medica+1;
	insert into medicament values(id_medica,medicament2);
	insert into trait_medica values(id_trait,id_medica);

	id_medica:=id_medica+1;
	insert into medicament values(id_medica,medicament3);
	insert into trait_medica values(id_trait,id_medica);

	select max(id_recom) into id_recom from recommendation;
	id_recom:=id_recom+1;
	insert into recommendation values(id_recom,recomendation1);
	insert into trait_recom values(id_recom,id_trait);
	id_recom:=id_recom+1;
	insert into recommendation values(id_recom,recomendation2);
	insert into trait_recom values(id_recom,id_trait);

	select max(id_maladie) into id_maladie from maladie;
	insert into maladie values(id_maladie,nom_maladie);
	insert into maladie_traitement values(id_trait,id_maladie);
	
end if;
end;
/