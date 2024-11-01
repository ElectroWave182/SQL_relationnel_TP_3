DROP FUNCTION IF EXISTS adf;


CREATE FUNCTION adf ()

RETURNS VOID AS $$

DECLARE
	att Etudiant % ROWTYPE;

BEGIN
	RAISE NOTICE 'Etudiants faisant partie d un site';
	FOR att IN SELECT *
		FROM Etudiant
		WHERE etudiant_site (email) IS NOT NULL
	LOOP
		RAISE NOTICE '%', att;
	END LOOP;
END;

$$ LANGUAGE 'plpgsql';



