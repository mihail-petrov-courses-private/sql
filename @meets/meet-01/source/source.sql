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

-- ако тази таблица не трябва да я има 
-- можем да я премахнем
DROP TABLE td_students;


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