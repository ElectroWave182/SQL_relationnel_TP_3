DROP VIEW IF EXISTS ChefEquipe;


CREATE VIEW ChefEquipe
(sansChef)
AS
SELECT idEquipe
FROM Equipe
EXCEPT (SELECT estChefDe
	FROM Etudiant)
;

