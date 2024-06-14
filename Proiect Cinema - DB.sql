-- --------------------------------------------------------------------------------------------------------------------------------------
												/*		1. CREATE BAZA DE DATE:		*/
-- --------------------------------------------------------------------------------------------------------------------------------------
CREATE DATABASE cinema;
USE cinema;
DROP DATABASE cinema;
-- ---------------------------------------------------------------------------------------------------------------------------------------
												/*		2. CREATE TABLE:		*/
-- --------------------------------------------------------------------------------------------------------------------------------------
-- /* TABLE 1: users*/---------------------------------
CREATE TABLE users (
user_id INT PRIMARY KEY AUTO_INCREMENT,
user_name VARCHAR(20) NOT NULL,
user_password VARCHAR(20) NOT NULL,
user_email VARCHAR(20) NOT NULL,
user_age INT NOT NULL
);

-- /* TABLE 2: movies*/---------------------------------
CREATE TABLE movies (
movie_id INT PRIMARY KEY NOT NULL,
movie_title VARCHAR(20) NOT NULL,
movie_gen VARCHAR(20) NOT NULL,
movie_description VARCHAR(100) NOT NULL,
user_id INT NOT NULL
);
ALTER TABLE movies ADD FOREIGN KEY(user_id) REFERENCES users(user_id);

-- /* TABLE 3: reserved:*/---------------------------------
CREATE TABLE reserved (
reserved_id INT PRIMARY KEY NOT NULL,
reserved_ticket BOOLEAN,
ticket_price DECIMAL (8, 4),
user_id INT NOT NULL,
movie_id INT NOT NULL
); 
ALTER TABLE reserved ADD FOREIGN KEY(user_id) REFERENCES users(user_id);
ALTER TABLE reserved ADD FOREIGN KEY(movie_id) REFERENCES movies(movie_id);

-- ---------------------------------------------------------------------------------------------------------------------------------------------------
												/*		3. INSERT INFORMATION:		*/
-- ---------------------------------------------------------------------------------------------------------------------------------------------------
-- /* INSERT TABLE 1::*/---------------------------------
INSERT INTO users(user_name, user_password, user_email, user_age) 
	VALUES 	('Andrei','andrei123','andrei@yahoo.com',19),
			('Maria','maria_9223','maria_93@gmail.com',30),
            ('Tudor','tudor.m2023','tudor_maus@yahoo.com',22),
			('Ana','ana.maria@1121','ana_maria@yahoo.com',45),
			('Paul','paul.ol1121','paul_olt@yahoo.com',18),
            ('Bogdan','b0gaadsgg343','bogel56@yahoo.com',32),
            ('Cornelia','coas345hs!','corne2000@yahoo.com',55);
SELECT * FROM users;

-- /* INSERT TABLE 2::*/---------------------------------
INSERT INTO movies (movie_id, movie_title, movie_gen, movie_description, user_id) 
	VALUES 	(10, 'The Beekeeper','Actiune', 'O misiunea brutală de răzbunare a unui bărbat', 1),
			(11, 'Madame Web','Comedie', 'Scriitoare introvertita de spionaj', 2),
			(12, 'Aquaman','SF', 'Black Manta deține forța legendarului Trident Negru', 3),
			(13, 'Spiderma','SF', 'Spiderman este cautam de poliei', 1),
            (14, 'Kiss of the','Thriler', 'Sarutul dragonului...', 5),
			(15, 'Baltagul','Istoric', 'Viata tumultuasa a celui mai mare..', 2),
			(16, 'Kabul','Documentar', 'Vremea, istoria, conflicelete din cel mai aspru loc ', 5);
SELECT * FROM movies;

-- /* INSERT TABLE 3::*/---------------------------------
INSERT INTO reserved(reserved_id, reserved_ticket, ticket_price, user_id, movie_id) 
	VALUES 	(100, true, '18.50', 1, 10), 
			(101, false, '39', 2, 11),
            (102, true, '12.65', 3, 12),
            (103, true, '80.99', 1, 13),
            (104, false, '45.1', 5, 14),
            (105, true, '45', 2, 15),
            (106, true, '10.120', 5, 16);
SELECT * FROM reserved;
DROP DATABASE cinema;
-- ---------------------------------------------------------------------------------------------------------------------------------------------------
											/*		4. PERFORMING DIFFERENT TYPES OF QUERIES:		*/
-- ---------------------------------------------------------------------------------------------------------------------------------------------------
			/*DDL	- DATA DEFINITION LANGUAGE*/
SHOW DATABASES;
CREATE DATABASE Exercitii;
USE Exercitii;
DROP DATABASE Exercitii;

CREATE TABLE clienti(
id_client INT PRIMARY KEY AUTO_INCREMENT,
nume_client VARCHAR(20) NOT NULL,
email VARCHAR(30) NOT NULL,
telefon VARCHAR(20) NOT NULL
);

INSERT INTO clienti(nume_client, email, telefon) VALUES 	('Andrei', 'andrei92@yahoo.com', '0749375925'), 
															('Oana', 'oanami2@gmail.com', '0742583704'),
															('Mihai', 'mihai777@gmail.com', '0773903184'),
															('Laura', 'laura_45@yahoo.com', '0728045028'),
															('Tudor', 'tudor_m2000@yahoo.com', '0750397394'),
															('Mircea', 'mircea346.com', '07189448032');
SELECT * FROM clienti;

CREATE TABLE carti (
id_carti INT PRIMARY KEY NOT NULL,
nume_carti VARCHAR(20) NOT NULL,
autor VARCHAR(20) DEFAULT '-XXXX-',
numarpagini INT,
pret DECIMAL(5, 2),
pestoc BOOLEAN,
id_client INT NOT NULL
);
ALTER TABLE carti ADD FOREIGN KEY(id_client) REFERENCES clienti(id_client);

DROP TABLE carti;
SELECT * FROM carti;
ALTER TABLE carti ADD COLUMN gen VARCHAR(10); 
ALTER TABLE clienti ADD COLUMN prenume_client VARCHAR(20) NOT NULL;
ALTER TABLE clienti MODIFY COLUMN prenume_client VARCHAR(10) DEFAULT '-xxxxx-';
ALTER TABLE carti DROP COLUMN gen;
ALTER TABLE carti MODIFY nume_carti CHAR(10) NOT NULL;
ALTER TABLE books MODIFY nume_carti VARCHAR(30) NOT NULL;
ALTER TABLE carti CHANGE gen limba VARCHAR(10);
ALTER TABLE carti RENAME TO books;
----------------------------------------------------------------------------------------------------------------
			/*DML	- DATA MANIPULATION LANGUAGE*/
INSERT INTO books(id_carti, nume_carti, autor, numarpagini, pret, pestoc, limba, id_client) 
VALUES (10, 'Maestrul si Margareta', 'Mihail bulgakov', 180, 45.99, true, 'Romana', 1), (11, 'Anul 1984', 'George Orwell', 450, 185.60, true, 'Romana', 2);
INSERT INTO books(id_carti, nume_carti, autor, pret, pestoc, limba, id_client) VALUES (12, 'Procesul', 'Franz Kafka', 70.25, true, 'Rusa', 3);
INSERT INTO books(id_carti, nume_carti, numarpagini, pret, pestoc, limba, id_client) VALUES (13, 'Strainul', 80, 25.80, true, 'Germana', 1);
INSERT INTO books(id_carti, nume_carti, autor, numarpagini, pret, pestoc, limba, id_client) VALUES (14, 'Dracula', 'Bram Stoker', 560, 132.25, false, 'Franceza', 4);
INSERT INTO books(id_carti, nume_carti, autor, numarpagini, pret, limba, id_client) VALUES (15, 'Simba', 'Thomas Brain', 180, 68.25, 'Turca', 5);
SELECT * FROM books;
ALTER TABLE books MODIFY COLUMN id_client INT NOT NULL FIRST;

UPDATE clienti SET prenume_client = 'Mihai' WHERE id_client =1;
UPDATE clienti SET prenume_client = 'Patricia' WHERE telefon ='0742583704';
SELECT * FROM clienti;
UPDATE books SET nume_carti = 'SCHIMBAT' WHERE id_client = 1;
UPDATE books SET autor = 'SCHIMBAT' WHERE autor = 'George Orwell';
ALTER TABLE books MODIFY COLUMN numarpagini VARCHAR(20);
UPDATE books SET numarpagini = 'SCHIMBAT' WHERE pret LIKE '70%'; 
UPDATE books SET pret = 999.99 WHERE pret BETWEEN 20 AND 30; 
UPDATE books SET pestoc = false WHERE pret = 185.60;
UPDATE books set limba = 'Rusa' WHERE id_client = 2 AND autor = 'SCHIMBAT'; 
----------------------------------------------------------------------------------------------------------------
						/*DQL	- DATA QUERY LANGUAGE*/
SELECT * FROM books;
SELECT * FROM clienti;
SELECT nume, pret FROM books;
SELECT nume, pret, limba FROM books;
SELECT * FROM books WHERE nume = 'Strainul';
SELECT * FROM books WHERE autor != 'Franz Kafka';
SELECT * FROM books WHERE numarpagini like '%8%';
SELECT * FROM books WHERE pret BETWEEN 100 AND 200;
SELECT * FROM books WHERE pestoc IS NULL;
---------------------------	AGGREGATE FUNCTION	-------------------------------------------------------------------------------------
SELECT SUM(pret) FROM books;
SELECT AVG(numarpagini) FROM books;
SELECT MIN(numarpagini) FROM books;
SELECT MAX(pret) FROM books;
SELECT COUNT(*) FROM books;
---------------------------	JOIN	-------------------------------------------------------------------------------------
SELECT * FROM clienti CROSS JOIN books;
SELECT * FROM clienti INNER JOIN books ON clienti.id_client=books.id_client;
SELECT * FROM clienti LEFT JOIN books ON clienti.id_client=books.id_client;
SELECT * FROM clienti RIGHT JOIN books ON clienti.id_client=books.id_client;
---------------------------	CLAUSES	-------------------------------------------------------------------------------------
SELECT * FROM books ORDER BY id_client DESC;
SELECT * FROM books ORDER BY nume_carti;
SELECT * FROM books ORDER BY numarpagini;

SELECT id_client, id_carti, pret FROM books GROUP BY id_client, id_carti, pret;
SELECT id_client, id_carti, MIN(pret), MAX(pret) FROM books GROUP BY id_client, id_carti;
SELECT id_client, id_carti, MIN(pret), MAX(pret) FROM books GROUP BY id_client, id_carti HAVING MAX(pret) != 999.99;

SELECT clienti.id_client, books.pret FROM clienti JOIN books ON clienti.id_client=books.id_client;
SELECT clienti.id_client, clienti.nume_client, books.id_carti, books.nume_carti, books.pret FROM clienti JOIN books ON clienti.id_client=books.id_client ORDER BY id_client ;

SELECT id_client, nume_client FROM clienti UNION SELECT id_carti, pret FROM books GROUP BY id_carti, pret;
DROP DATABASE exercitii;