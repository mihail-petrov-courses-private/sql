CREATE DATABASE school_db;

USE school_db;

DROP TABLE td_students;

CREATE TABLE IF NOT EXISTS td_students(
	id INT PRIMARY KEY AUTO_INCREMENT,
    class_id INT NOT NULL,
    
    first_name  VARCHAR(64) NOT NULL,
    last_name VARCHAR(64) NOT NULL,
    pin CHAR(10) NOT NULL unique
);

CREATE TABLE IF NOT EXISTS td_classes(
	id INT PRIMARY KEY AUTO_INCREMENT,
    class_letter CHAR(1) NOT NULL,
    class_number TINYINT NOT NULL,
    min_kids TINYINT NOT NULL DEFAULT 13,
    max_kids TINYINT NOT NULL DEFAULT 26,
    
    CHECK (min_kids >= 6 AND max_kids <= 32)
);

CREATE TABLE IF NOT EXISTS tm_specialities(
	id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(128) NOT NULL
);

CREATE TABLE IF NOT EXISTS tc_classes__specialities(
	class_id INT NOT NULL,
    specialty_id INT NOT NULL,
    
    CONSTRAINT PK_composition PRIMARY KEY(class_id, specialty_id)
);

SELECT * 
FROM tc_classes__specialities;

INSERT INTO tc_classes__specialities(class_id, specialty_id)
VALUES(1,1),(1,4), (2,4), (3, 4)

-- INSERT INTO tm_specialities(title) 
-- VALUES('Math'), ('Enlish'), ('Marketing'), ('Art');



SELECT * FROM td_classes;


-- Селектирай всички ученици + техните класове в училището
SELECT 
	concat(s.first_name, ' ', s.last_name) AS full_name,
	UPPER(s.first_name) AS first_name, 
    s.last_name, 
    s.pin, 
    c.class_number,
    c.class_letter
FROM td_students AS s
INNER JOIN td_classes AS c
ON s.class_id = c.id;

-- Селектирай всички ученици от 1A клас
SELECT s.*, c.class_number, c.class_letter
FROM td_students AS s
JOIN td_classes AS c
ON s.class_id = c.id
WHERE c.class_letter = 'A' AND c.class_number = 1

-- Селектирайте всички класове заедно с техните специалности
SELECT c.class_letter, c.class_number, s.title
FROM td_classes c
	JOIN tc_classes__specialities cs
    ON c.id = cs.class_id
    JOIN tm_specialities s    
    ON s.id = cs.specialty_id