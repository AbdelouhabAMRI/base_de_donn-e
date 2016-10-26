create or replace type pharm_fab_type as object (nom_medicament varchar(50)); 

/


create or replace function medicam_fab_pharm(num_trait number)
return pharm_fab_type as
pharm_fab_record pharm_fab_type:=pharm_fab_type('') ;

begin

SELECT NOM_MEDICAMENT into pharm_fab_record.nom_medicament from TRAITEMENT t,MEDICAMENT md,TRAIT_MEDICA tm,LABORATOIRE l,LABO_MEDICA lm,MEDECIN m,MEDECIN_MEDICA mm 
where t.ID_TRAIT=tm.ID_TRAIT AND md.ID_MEDICAMENT=tm.ID_MEDICAMENT
AND lm.ID_LABO=l.ID_LABO AND lm.ID_MEDICAMENT=md.ID_MEDICAMENT
AND m.ID_MEDE=mm.ID_MEDE AND mm.ID_MEDICAMENT= md.ID_MEDICAMENT;

return(pharm_fab_record);

end;
/