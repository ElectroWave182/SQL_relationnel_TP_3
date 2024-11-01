DROP FUNCTION IF EXISTS somme_prix;


CREATE FUNCTION somme_prix (clef VARCHAR (42))

RETURNS INTEGER AS $$
DECLARE
	total INT;

BEGIN
	SELECT INTO total SUM (prix)
	FROM Defi
	WHERE clef = lOrganisation;
	RETURN total;
END;

$$ LANGUAGE 'plpgsql';
