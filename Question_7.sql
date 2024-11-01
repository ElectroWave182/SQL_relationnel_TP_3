DROP FUNCTION IF EXISTS sans_chef;


CREATE FUNCTION sans_chef ()

RETURNS VOID AS $$
DECLARE
	res Equipe.idEquipe % TYPE;

BEGIN
	SELECT INTO res idEquipe
	FROM Equipe
	EXCEPT SELECT DISTINCT estChefDe
		FROM Etudiant;
	RAISE NOTICE 'Equipes sans chef\n%', res;
END;

$$ LANGUAGE 'plpgsql';

