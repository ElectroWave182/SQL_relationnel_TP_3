DROP FUNCTION IF EXISTS participants;


CREATE FUNCTION participants (clef VARCHAR (42))

RETURNS VOID AS $$
DECLARE
	team Equipe % ROWTYPE;

BEGIN
	SELECT INTO team *
	FROM Equipe, Site
	WHERE clef = leDefi
	AND Equipe.leSite = nomSite;
	RAISE NOTICE 'Voici la liste des équipes particpant à % :', clef;
	RAISE NOTICE '%', team;
END;

$$ LANGUAGE 'plpgsql';

