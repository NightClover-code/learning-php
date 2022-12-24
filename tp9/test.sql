CREATE TABLE etudiant (
  num_apogee INT(11) PRIMARY KEY AUTO_INCREMENT, 
  nom VARCHAR(45),
  prenom VARCHAR(45),
  image VARCHAR(45)
); 

CREATE TABLE livre (
  isbn INT(11) PRIMARY KEY AUTO_INCREMENT,
  titre_livre VARCHAR(100),
  auteur VARCHAR(40),
  image_livre VARCHAR(45)
);

CREATE TABLE gestionaire (
  id_gestionaire INT(11) PRIMARY KEY AUTO_INCREMENT,
  login VARCHAR(40),
  pass VARCHAR(40),
  nom VARCHAR(40),
  prenom VARCHAR(40)
);

CREATE TABLE emprunt (
  id_emprunt INT(11) PRIMARY KEY AUTO_INCREMENT,
  dt_debut DATE,
  dt_retour DATE,
  id_etudiant INT(11) REFERENCES etudiant(num_apogee),
  id_livre INT(11) REFERENCES livre(isbn),
  id_gestionaire INT(11) REFERENCES gestionaire(id_gestionaire)
);

SELECT * FROM etudiant WHERE num_apogee = 4001418;

SELECT * FROM etudiant
JOIN emprunt ON emprunt.id_etudiant = etudiant.num_apogee;

SELECT * FROM emprunt WHERE dt_debut >= '2020-12-01' AND dt_retour <= '2020-12-06';

SELECT * FROM emprunt e 
WHERE e.id_gestionnaire 
IN (SELECT id_gestionnaire FROM gestionnaire WHERE login = 'marso');

UPDATE etudiant
SET prenom = 'Laila'
WHERE num_apogee = 14001418;

DELETE FROM etudiant WHERE num_apogee = 14000198;