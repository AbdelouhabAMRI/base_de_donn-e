
CREATE or replace TYPE surevillance_type as object
    (N1      NUMBER, 
     N2    NUMBER,
     raport NUMBER)
/
create or replace function analyse_prescription()
return surveillance_type as 
surveillance_record surveillance_type:=surveillance_type('','','');

begin
declare nb_prescri number;

select count(t.id_trait) into nb_prescri from medecin m,medecin_traitement mt, traitement t
where m.id_mede=mt.id_mede AND t.id_trait=mt.id_trait;

select count(m.id_medicament) INTO surveilance_record.N1
from medicament m , trait_medica tm,traitement t,medecin_traitement mt,medecin md,medecin_medica mm  
where m.id_medicament=mt.id_medicmanet AND mt.id_trait=t.id_trait
AND t.id_trait=tm.id_trait AND tm.id_medicament=m.id_medicament
AND m.id_medicament=mm.id_medicmanet AND mm.id_mede=m.id_mede;


select count(m.id_medicament) INTO surveilance_record.N2
from medicament m , trait_medica tm,traitement t,medecin_traitement mt,medecin md,labo_medica lm,laboratoire l,medecin_labo ml
where m.id_medicament=mt.id_medicmanet AND mt.id_trait=t.id_trait
AND t.id_trait=tm.id_trait AND tm.id_medicament=m.id_medicament
AND m.id_medicament=lm.id_medicmanet AND lm.id_labo=l.id_labo 
AND l.id_labo=)ml.id_labo AND ml.id_mede=m.id_mede;

surveillance_record.raport:=nb_prescrit/(N1+N2);
return(sureveillance_record);

end;
/