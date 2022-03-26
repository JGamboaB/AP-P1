
-- Login -- Si correcto -> Manda a pantalla de admin o cliente

CREATE PROCEDURE Users AS SELECT email, password, type FROM cw_users

-- Registro de cliente

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

-- Eliminar Pelicula

-- / / Alimentos

-- Agregar Alimento

-- Modificar Alimentos

-- Eliminar Alimentos

-- / / Clientes

-- Agregar Cliente

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