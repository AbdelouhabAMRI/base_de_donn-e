
create or replace type trait_prescri_type as object (nom_medicament varchar(50)); 

/
create or replace function proposer_medicaments(desc1 varchar (50),desc2 varchar(50))
return trait_prescri_type as
trait_prescri_record trait_prescri_type:=trait_prescri_type('') ;

begin


declare maladie_nom varchar(50);
declare age NUMBER;

select m.NOM_MALADIE into maladie_nom from MALADIE m,MALADIE_OBSERVATION mo, OBSERVATION o
where mo.ID_OBS=o.ID_OBS AND mo.ID_MALADIE= m.ID_MALADIE 
AND (o.OBSERVATION_DESC=obsv1 OR o.OBSERVATION_DESC=obsv2);

select md.nom_medicament into trait_prescri_record.nom_medicament from maladie m, indication_maladie im, indication i,medicament_indication mi,medicament md,
where m.id_maladie=im.id_maladie AND i.id_indication=im.id_indication AND m.nom_maladie=maladie_nom AND i.nom_indication=maladie_nom
AND i.id_indication=mi.id_indication AND mi.id_medicament=md.id_medicament;

return(trait_prescri_record);

end;
/