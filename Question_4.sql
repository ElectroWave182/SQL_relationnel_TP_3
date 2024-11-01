DROP FUNCTION IF EXISTS etudiant_site;


CREATE FUNCTION etudiant_site (clef VARCHAR (42))

RETURNS VARCHAR (42) AS $$
DECLARE
	res Site.nomSite % TYPE;

BEGIN
	SELECT INTO res nomSite
	FROM Etudiant, Equipe, Site
	WHERE clef = email
	AND lEquipe = idEquipe
	AND leSite = nomSite;
	RETURN res;
END;

$$ LANGUAGE 'plpgsql';
