-- CRUD
-- CREATE -> INSERT
-- READ   -> SELECT
-- UPDATE -> UPDATE
-- DELETE -> DELETE


-- Да си създадем нова база данниa
-- ключовите думи  - не се интересуват от регистъра на буквите
-- обикновенно КЛЮЧОВИТЕ ДУМИ се пишат с главни букви
CREATE DATABASE school_db;
-- CTrl + Enter -- изпълнява селектирания израз

-- ако не ни кефи тази база можем да я унищожим
DROP DATABASE school_db;

-- за да ползвате базата данни използвайте командата USE
USE school_db;

-- Да си създадем таблици в които ще пазим информация
-- за процесите в едно училище
-- ученици
-- класове
-- специалност

-- предмети
-- оценки
-- учители които преподават





-- Да започнем с таблицата ученици
-- първо име
-- второ име
-- година на раждане
-- в кой клас е ученика
-- буква на класа
-- адрес 
-- град
CREATE TABLE td_students(
	
    -- ще направя специална колона, която ще има за цел 
    -- да добавя уникалност към всеки запис в таблицата
    -- ПЪРВИЧЕН КЛЮЧ - СУРОГАТЕН
    id INT PRIMARY KEY AUTO_INCREMENT,

	first_name   VARCHAR(30),
    last_name    VARCHAR(30),
    birth_year 	 SMALLINT,
    class_number TINYINT,
    class_letter CHAR(1),
    address 	 VARCHAR(128),
    city 		 VARCHAR(128)
);

-- ако тази таблица не трябва да я има  можем да я премахнем
DROP TABLE td_students;

-- Нека да напълним нашата таблица с малко информация
INSERT INTO td_students(
	first_name		, 
    last_name		, 
    birth_year		, 
    class_number	, 
    class_letter	,
    address			,
    city
)
VALUES(
	'Mihail',
    'Petrov',
    1992,
    12,
    'A',
    'Bialo more',
    'Plovdiv'
);

-- Ако искаме да бухаме - повече от един ред
INSERT INTO td_students(
	first_name		, 
    last_name		, 
    birth_year		, 
    class_number	, 
    class_letter	,
    address			,
    city
)
VALUES
	  ( 'Teodora', 'Koparanova', 2000, 12, 'A', 'Ivan Vazov', 'Plovdiv' ),
	  ( 'Galin', 'Ivanov', 1990, 11, 'B', 'Dimitar Talev', 'Chirpan' );
      
-- Може ли да имам записи, които са частични.alter
INSERT INTO td_students(
	first_name
)
VALUES( 
	'Dragan'
);

-- Можем ли да бъркаме типоведе на данните
-- В колона VARCHAR да сложим число --> ДА
INSERT INTO td_students(first_name)
VALUES(  11 );

-- Можем ли да бъркаме типоведе на данните
-- В колона INT да сложим ТЕКСТ --> ГОРЕ ДОЛО
INSERT INTO td_students(class_number)
VALUES(  'A' );

INSERT INTO td_students(class_number)
VALUES(  'JHGJH' );


-- Нека да прочетем всички записани ученици в нашето училище.
-- * -> всички колони от таблицата
SELECT *
FROM td_students
WHERE (class_letter = 'B' OR class_letter = 'A') AND 
	  class_number = 12;

-- You are using safe update mode and you tried to update a table without a WHERE 
-- that uses a KEY column To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.


-- Нека да актуализираме всички ученици които са от 12 клас 
-- те автоматично ще бъдат преместени в class с буква B
UPDATE td_students
SET class_letter = 'B'
-- WHERE id = 3
WHERE class_letter = 'A' AND class_number = 12;


-- Нека да изтрием всички записи от нашата таблица 
-- с ученици
DELETE FROM td_students
WHERE (id = 6 OR id = 7 OR id = 8 OR id = 5)

-- Изтриване на всички данни от таблицата
TRUNCATE TABLE td_students;


-- Да си направим таблица за класовете
-- номер на класа
-- буква на класа
-- минимум деца
-- максимум деца
-- специалност
CREATE TABLE td_classes(
	
    id INT PRIMARY KEY AUTO_INCREMENT,

	class_number TINYINT,
    class_letter CHAR(1),
    min_size TINYINT,
    max_size TINYINT,
    class_profile VARCHAR(30)
);

DROP TABLE td_classes;


-- Направете 5 записа в таблица td_classes
-- от 1 до 5 
-- всеки един от записите трябва да има буква
-- актуализирайте нечетните класове, така че да са от клас B
-- изтриите всички четни класове
-- изтриите цялата таблица с TRUNCATE

