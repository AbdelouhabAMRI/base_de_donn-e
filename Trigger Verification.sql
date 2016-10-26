CREATE OR REPLACE TRIGGER VERIF_MEDICAMENT_MEDEC
BEFORE INSERT 
ON trait_medica 
FOR EACH ROW 
DECLARE 
numeromedecin varchar(12);
BEGIN
	select id_mede into numeromedecin from medecin_medica where id_medicament=:New.id_medicament;
	IF (numeromedecin!=' ') THEN
		RAISE_APPLICATION_ERROR (-20501,'le medecin ne peut pas prescrire les medicament qu''il a fabriqué');		
	END IF;
END;
/
