DELETE FROM Site;
DELETE FROM Organisation;
DELETE FROM Defi;
DELETE FROM Equipe;
DELETE FROM Etudiant;


INSERT INTO Site VALUES ('Albi', 'test@etud.univ-jfc.fr', 'Bezos', '09 81 02 42 66');

INSERT INTO Organisation VALUES ('Amazon', 'Entreprise');

INSERT INTO Defi VALUES ('Défi Colis', 54, 'Amazon');

INSERT INTO Equipe VALUES (NEXTVAL ('seq_equipe'), 'Team', 'Défi Colis', 'Albi');

INSERT INTO Etudiant VALUES ('enzo.causse@etud.univ-jfc.fr', 'Causse', 'Enzo', CURRVAL ('seq_equipe'), CURRVAL ('seq_equipe'), 'Albi');
INSERT INTO Etudiant VALUES ('enzo.pasquies@etud.univ-jfc.fr', 'Pasquies', 'Enzo', CURRVAL ('seq_equipe'), NULL, 'Albi');
