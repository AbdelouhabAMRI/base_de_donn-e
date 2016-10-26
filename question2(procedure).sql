
create or replace type liste_medicament_type as object (nom_medicament varchar(100)); 

/


create or replace type listeMedicamentable as table of liste_medicament_type;
/
create or replace procedure prescript(nom_mal in maladie.nom_maladie%type)

as 
begin

	for i in (select nom_medicament as nom_medicament from maladie_traitement mt,maladie m,traitement t,trait_medica tm,medicament md where mt.id_maladie=m.id_maladie
	  	AND t.id_trait=mt.id_trait AND m.nom_maladie=nom_mal AND tm.id_medicament=md.id_medicament AND t.id_trait=tm.id_trait)loop
		
		DBMS_OUTPUT.PUT_LINE ('nom medicament ' || i.nom_medicament);
	  	
	end loop;
	
end;
/