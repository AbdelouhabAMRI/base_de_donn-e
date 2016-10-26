create or replace type liste_effet_type as object (nom_effet varchar(100)); 
/
create or replace procedure effets_indsrb(medicam medicament.nom_medicament%type)

as

begin

for i in (select NOM_EFFET from MEDICAMENT m,EFFET_MEDICA em,EFFET_INDESERABLE ei
where m.NOM_MEDICAMENT=medicam AND m.ID_MEDICAMENT=em.ID_MEDICAMENT AND ei.ID_EFFET=em.ID_EFFET)loop 

DBMS_OUTPUT.PUT_LINE ('liste d''effet indeserable ' || i.NOM_EFFET);

end loop;

end;
/

execute effets_indsrb('ZINNAT 1,5 g, poudre pour solution pour perfusion');