create or replace type medic_fab_type as object (nom_medicament varchar(50)); 

/


create or replace procedure medica_fab_medecin(num_trait number)
AS
begin

for i in (SELECT NOM_MEDICAMENT from TRAITEMENT t,MEDICAMENT m,TRAIT_MEDICA tm,medecin md,medecin_medica mm 
where t.ID_TRAIT=num_trait AND t.ID_TRAIT=tm.ID_TRAIT AND m.ID_MEDICAMENT=tm.ID_MEDICAMENT
AND md.ID_MEDE=mm.ID_MEDE AND mm.ID_MEDICAMENT=m.ID_MEDICAMENT)loop

DBMS_OUTPUT.PUT_LINE ('nom medicament prescrit par medecin qui les fabrique ' || i.nom_medicament);

end loop;


end;
/

execute medica_fab_medecin(8);