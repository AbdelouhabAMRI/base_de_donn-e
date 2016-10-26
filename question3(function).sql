create or replace type liste_effet_type as object (nom_effet varchar(100)); 
/

create or replace function effets_indeserables(medicam varchar)
return liste_effet_type as
liste_effet_record liste_effet_type:=liste_effet_type('') ;

begin

select ei.NOM_EFFET into liste_effet_record.nom_effet from MEDICAMENT m,EFFET_MEDICA em,EFFET_INDESERABLE ei
where m.NOM_MEDICAMENT=medicam AND m.ID_MEDICAMENT=em.ID_MEDICAMENT AND ei.ID_EFFET=em.ID_EFFET; 


return (liste_effet_record);
end;
/

select effets_indeserables('ZADYTHIN') from dual;