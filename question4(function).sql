create or replace type medic_fab_type as object (nom_medicament varchar(50)); 

/


create or replace function medicam_fab_medecin(num_trait number)
return medic_fab_type as
medic_fab_record medic_fab_type:=medic_fab_type('') ;

begin

SELECT m.NOM_MEDICAMENT into medic_fab_record.nom_medicament from TRAITEMENT t,MEDICAMENT m,TRAIT_MEDICA tm,medecin md,medecin_medica mm 
where t.ID_TRAIT=num_trait AND t.ID_TRAIT=tm.ID_TRAIT AND m.ID_MEDICAMENT=tm.ID_MEDICAMENT
AND md.ID_MEDE=mm.ID_MEDE AND mm.ID_MEDICAMENT=m.ID_MEDICAMENT;

return (medic_fab_record) ;

end;
/
