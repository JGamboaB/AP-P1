
-- create the database
CREATE DATABASE CinepolisWeb
GO

-- switch to it
USE CinepolisWeb
GO

-- table of users
CREATE TABLE cw_users(
	userID bigint IDENTITY(1,1) NOT NULL PRIMARY KEY,
	email nvarchar(100) UNIQUE NOT NULL,
	password nvarchar(100) NOT NULL, -- AS SUBSTRING(CONVERT(nvarchar(40), NEWID()),0,9), 
	name nvarchar(100) NOT NULL,
	surname1 nvarchar(100) NOT NULL,
	surname2 nvarchar(100) NOT NULL,
	ID int UNIQUE NOT NULL,
	vaccines tinyint NOT NULL,
	birthdate datetime NOT NULL,
	age AS FLOOR((CAST (GetDate() AS INTEGER) - CAST(birthdate AS INTEGER)) / 365.25), -- calculated 
	type bit NOT NULL) -- client 0, admin 1
GO

-- / / / Movies

-- table of movies -- Poster and description can be added later on if needed
CREATE TABLE cw_movies(
	movieID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	title nvarchar(255) NOT NULL,
	director nvarchar(255) NOT NULL,
	actors nvarchar(255) NOT NULL,
	languages nvarchar(255) NOT NULL,
	genres nvarchar(255) NOT NULL,
	runtimeMin smallint NULL,
	year int NOT NULL,
	ageRequired int NULL,
	priceN money NULL,
	priceG money NULL,
	priceM money NULL,
	display bit NOT NULL)
GO

-- table of screenings
CREATE TABLE cw_screen_hour(
	shID bigint IDENTITY(1,1) NOT NULL PRIMARY KEY, 
	movieID int NOT NULL FOREIGN KEY REFERENCES cw_movies(movieID),
	screenid tinyint NOT NULL, -- numero de sala / tiene 3
	hour datetime NOT NULL
	)
GO

CREATE TABLE cw_seats(
	seatID bigint IDENTITY(1,1) NOT NULL PRIMARY KEY,
	shID bigint NOT NULL FOREIGN KEY REFERENCES cw_screen_hour(shID),
	number nvarchar(3) NOT NULL,
	used bit NOT NULL)
GO

CREATE TABLE cw_foodtypes(
	foodtypeID tinyint IDENTITY(1,1) NOT NULL PRIMARY KEY,
	name varchar(6) NOT NULL)
GO

CREATE TABLE cw_food(
	foodID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	name varchar(100) NOT NULL,
	stock int NOT NULL,
	type tinyint NOT NULL FOREIGN KEY REFERENCES cw_foodtypes(foodtypeid), -- 1 food, 2 drink, 3 combo
	price money NOT NULL)
GO

CREATE TABLE cw_cart(
	cartID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	userID bigint NOT NULL FOREIGN KEY REFERENCES cw_users(userID),
	seatID bigint NOT NULL FOREIGN KEY REFERENCES cw_seats(seatID),
	


	name varchar(100) NOT NULL,
	stock int NOT NULL,
	type tinyint NOT NULL FOREIGN KEY REFERENCES cw_foodtypes(foodtypeid), -- 1 food, 2 drink, 3 combo
	price money NOT NULL)
GO

-- Data

INSERT INTO cw_movies (title, director, languages, genres, runtimeMin, year, ageRequired, priceN, priceG, priceM, display, actors) VALUES 
(N'Jurassic Park', N'Colin Trevorrow', 'Español, Ingles', 'Action, Monster', 126, 1993, 10, 2400, 3200, 2500, 1, 'Jeff Goldblum, Sam Neil, Laura Dern'),
(N'Spider-Man', N'Sam Raimi', 'Español, Ingles', 'Action, Superheroes', 121, 2002, 1, 2400, 3200, 2400, 1, 'Tobey Maguire, James Franco, William Dafoe'),
(N'King Kong', N'Michael Titan', 'Español, Ingles', 'Action, Monster', 187, 2005, 5, 2500, 3300, 2400, 1, 'Peter Jackson, Jack Black, Naomi Watts'), 
(N'Superman Returns', 'Steven Rann', 'Español, Ingles', 'Action, Superheroes', 154, 2006, 5, 2450, 3250, 2300, 1, 'Brandon Routh, Kate Bosworth, Kevin Spacey'), 
(N'Titanic', 'Steven Spilberg', 'Ingles', 'Romance, Drama', 194, 1998, 12, 2400, 3100, 2400, 1, 'Kate Winslet, Leonardo DiCaprio'), 
(N'Evan Almighty', 'Evan Hansen', 'Español', 'Comedy', 96, 2007, 10, 2000, 3100, 2000, 1, 'Morgan Freeman, Laura Graham, John Goodman'), 
(N'Waterworld', 'William Afton', 'Español, Ingles', 'Adventure', 135, 1995, 13, 2000, 2900, 2100, 1, 'Kevin Costner, Tina Majorino'), 
(N'Pearl Harbor','Winston Erickson', 'Ingles, Japonés', 'Documentary, War', 183, 2001, 18, NULL, 3200, 2500, 1, 'Josh Harnett, Ben Affleck'), 
(N'Transformers', N'Michael Bay',  'Español, Ingles', 'Action', 144, 2007, 13, 2400, 2900, 2300, 1, 'Megan Fox, Shia LaBeouf');

-- Screen & Hours

INSERT INTO cw_screen_hour(movieID, screenID, hour) VALUES 
(1, 1, '2022-04-09 11:00:00'), (1, 2, '2022-04-09 15:30:00'), (1, 3, '2022-04-09 17:15:00'), 
(2, 1, '2022-04-09 14:10:00'), (2, 2, '2022-04-09 16:30:00'), (2, 3, '2022-04-09 19:10:00'), 
(3, 1, '2022-04-09 13:05:00'), (3, 2, '2022-04-09 15:50:00'), (3, 3, '2022-04-09 17:00:00'), 
(4, 1, '2022-04-09 15:00:00'), (4, 2, '2022-04-09 16:10:00'), (4, 3, '2022-04-09 20:35:00'), 
(5, 1, '2022-04-09 14:20:00'), (5, 2, '2022-04-09 16:35:00'), (5, 3, '2022-04-09 19:35:00'), 
(6, 1, '2022-04-09 13:00:00'), (6, 2, '2022-04-09 15:50:00'), (6, 3, '2022-04-09 17:50:00'), 
(7, 1, '2022-04-09 15:20:00'), (7, 2, '2022-04-09 15:50:00'), (7, 3, '2022-04-09 17:00:00'), 
(8, 1, '2022-04-09 12:50:00'), (8, 2, '2022-04-09 14:30:00'), (8, 3, '2022-04-09 18:15:00'), 
(9, 2, '2022-04-09 11:40:00'), (9, 3, '2022-04-09 15:15:00'), (9, 1, '2022-04-09 19:20:00');

-- Food

INSERT INTO cw_foodtypes VALUES ('Comida'), ('Bebida'), ('Combo')

INSERT INTO cw_food VALUES ('Refresco Pequeño', 1000, 2, 1200), ('Refresco Mediano', 1000, 2, 1300), ('Refresco Grande', 1500, 2, 1500), ('Agua', 800, 2, 900), 
('Palomitas Mantequilla Pequeñas', 700, 1, 1500), ('Palomitas Mantequilla Medianas', 300, 1, 1700), ('Palomitas Mantequilla Grandes', 850, 1, 1900),    
('Palomitas Caramelo Pequeñas', 610, 1, 1700), ('Palomitas Caramelo Medianas', 350, 1, 1900), ('Palomitas Caramelo Grandes', 855, 1, 2100),    
('Combo Amigos', 400, 3, 4800), ('Combo Nachos Queso', 250, 3, 4900), ('Combo Nachos Chili con Carne', 270, 3, 5400), ('Combo Hotdog', 260, 3, 4900), ('Combo Kid', 200, 3, 3500);

-- Users -- Create 2 admins and some clients

INSERT INTO cw_users(email, name, surname1, surname2, ID, vaccines, birthdate, type, password) VALUES 
('batmanrules420@gmail.com', 'Bruce', 'Wayne', 'Bat', 123456789, 3, '1995-03-25 00:00:00', 1, SUBSTRING(CONVERT(nvarchar(40), NEWID()),0,9)),
('supermanthegoat@gmail.com', 'Clark', 'Kent', 'Human', 111111111, 3, '1994-07-05 00:00:00', 1, SUBSTRING(CONVERT(nvarchar(40), NEWID()),0,9)),
('normalperson@gmail.com', 'Norman', 'Perrson', 'Smith', 111111112, 2, '2002-06-07 00:00:00', 0, SUBSTRING(CONVERT(nvarchar(40), NEWID()),0,9)), --adult
('normalperson2@gmail.com', 'Michael', 'Jackson', 'Bennet', 111111113, 2, '2007-05-15 00:00:00', 0, SUBSTRING(CONVERT(nvarchar(40), NEWID()),0,9)), --15 y.o.
('jack@gmail.com', 'Jack', 'Skelington', 'Gaze', 111111114, 0, '2000-12-04 00:00:00', 0, SUBSTRING(CONVERT(nvarchar(40), NEWID()),0,9)); --no vaccines

-- Seats for each one -> Stored Procedure


DROP PROCEDURE IF EXISTS SeatsForFunction
GO
CREATE PROCEDURE SeatsForFunction @functionID bigint
AS 
	DECLARE @Row INT, @Col INT
	SET @Row = 1

	WHILE @Row <= 10
	BEGIN
		SET @Col = 1

		WHILE @Col <= 10
		BEGIN
			INSERT INTO cw_seats values (@functionID, CONCAT(CHOOSE(@Row, 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J'), CAST(@COL as nvarchar(2))), 0)
			SET @Col = @Col + 1;
		END
		SET @Row = @Row + 1;
	END
GO


DROP PROCEDURE IF EXISTS SeatsForEachFunction
GO
CREATE PROCEDURE SeatsForEachFunction
AS
	DECLARE cw_cursor CURSOR FOR 
	SELECT shID FROM cw_screen_hour

	OPEN cw_cursor
	DECLARE @id int

	FETCH NEXT FROM cw_cursor INTO @id

	WHILE @@FETCH_STATUS = 0  
	BEGIN 
		exec SeatsForFunction @id
		FETCH NEXT FROM cw_cursor INTO @id
	END

	CLOSE cw_cursor
	DEALLOCATE cw_cursor
GO

EXEC SeatsForEachFunction


/*NOTES
Usuario <- 1 bit (clientes, admins)
Pelicula (con precios) -> Sala y Hora (id) -> 100 Asientos  *Tiquete con joins
Alimentos <- Tipo (Combo, Bebida, Comida)

-- peli bit cartelera
3 salas 100 asientos c/u
*/