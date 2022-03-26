USE CinepolisWeb

-- Login -- Si correcto -> Manda a pantalla de admin o cliente
DROP PROCEDURE IF EXISTS Users
GO
CREATE PROCEDURE Users AS SELECT email, password, type FROM cw_users;

-- Registro de cliente

DROP PROCEDURE IF EXISTS RegisterClient
GO
CREATE PROCEDURE RegisterClient
	@email AS nvarchar(100),
	@name AS nvarchar(100),
	@surname1 AS nvarchar(100),
	@surname2 AS nvarchar(100),
	@id AS INT,
	@vaccines AS TINYINT,
	@birthdate AS DATETIME
AS
	INSERT INTO cw_users(email, name, surname1, surname2, ID, vaccines, birthdate, type)
	VALUES (@email, @name, @surname1, @surname2, @id, @vaccines, @birthdate, 0)

-- / / / / / ADMIN

-- / / Peliculas

-- Agregar Pelicula

DROP PROCEDURE IF EXISTS AddMovie
GO
CREATE PROCEDURE AddMovie
	@title AS nvarchar(255),
	@director AS nvarchar(255),
	@actors AS nvarchar(255),
	@languages AS nvarchar(255),
	@genres AS nvarchar(255),
	@runtimeMin AS smallint,
	@year AS int,
	@ageRequired AS int,
	@priceN AS money,
	@priceG AS money,
	@priceM AS money
AS
	INSERT INTO cw_movies(title, director, actors, languages, genres, runtimeMin, year, ageRequired, priceN, priceG, priceM, display) 
	VALUES (@title, @director, @actors, @languages, @genres, @runtimeMin, @year, @ageRequired, @priceN, @priceG, @priceM, 1)

-- Modificar Pelicula

DROP PROCEDURE IF EXISTS modifyMovie
GO
CREATE PROCEDURE modifyMovie
	@id AS int,

	@title AS nvarchar(255),
	@director AS nvarchar(255),
	@actors AS nvarchar(255),
	@languages AS nvarchar(255),
	@genres AS nvarchar(255),
	@runtimeMin AS smallint,
	@year AS int,
	@ageRequired AS int,
	@priceN AS money,
	@priceG AS money,
	@priceM AS money
AS
	UPDATE cw_movies
	SET title = @title, director= @director, actors = @actors, languages = @languages, genres = @genres, runtimeMin = @runtimeMin, [year] = @year, ageRequired = @ageRequired, priceN = @priceN, priceG = @priceG, priceM = @priceM
	WHERE movieID = @id;

-- Eliminar Pelicula

DROP PROCEDURE IF EXISTS deleteMovie
GO
CREATE PROCEDURE deleteMovie
	@id AS int
AS
	DELETE FROM cw_movies WHERE movieID = @id;

-- / / Alimentos

-- Agregar Alimento

DROP PROCEDURE IF EXISTS AddFood
GO
CREATE PROCEDURE AddFood
	@name AS varchar(100),
	@stock AS int,
	@type AS tinyint,
	@price AS money
AS
	INSERT INTO cw_food (name, stock, type, price) 
	VALUES (@name, @stock, @type, @price)

-- Modificar Alimentos

DROP PROCEDURE IF EXISTS modifyFood
GO
CREATE PROCEDURE modifyFood
	@id AS int,

	@name AS varchar(100),
	@stock AS int,
	@type AS tinyint,
	@price AS money
AS
	UPDATE cw_food
	SET name = @name, [stock]= @stock, type = @type, price = @price
	WHERE foodID = @id;

-- Eliminar Alimentos

DROP PROCEDURE IF EXISTS deleteFood
GO
CREATE PROCEDURE deleteFood
	@id AS int
AS
	DELETE FROM cw_food WHERE foodID = @id;

-- / / Clientes

-- Agregar Cliente

DROP PROCEDURE IF EXISTS AddUser
GO
CREATE PROCEDURE AddUser
	
AS
	INSERT INTO cw_food (name, stock, type, price) 
	VALUES (@name, @stock, @type, @price)

-- Modificar Clientes

-- Eliminar Clientes

-- / / Cartelera

-- Incluir o no en cartelera

-- Asignar sala a pelicula

-- / / / / / Cliente

-- / / Cartelera

-- Visualizar cartelera

-- Visualizar pelicula



-- Añadir al carrito

-- Selección de asientos

-- / / Compra de alimentos

-- Visualizar

-- Añadir al carrito

-- / / Carrito de compras

-- Visualizar

-- Comprar

-- Enviar factura por PDF

-- / / Aspectos generales

-- Validaciones