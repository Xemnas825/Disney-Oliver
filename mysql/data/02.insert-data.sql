-- Insertar datos en la tabla usuarios
INSERT INTO usuarios (nombre, email, contrasena_hash, estado) VALUES
    ('Juan Pérez', 'juan@example.com', 'hashed_password_123', 'activo'),
    ('Ana López', 'ana@example.com', 'hashed_password_456', 'inactivo'),
    ('Carlos Ruiz', 'carlos@example.com', 'hashed_password_789', 'activo');

-- Insertar datos en la tabla categorias
INSERT INTO categorias (nombre, descripcion) VALUES
    ('Acción', 'Películas llenas de adrenalina y escenas emocionantes'),
    ('Comedia', 'Películas para reír y disfrutar'),
    ('Drama', 'Historias intensas y llenas de emociones'),
    ('Ciencia Ficción', 'Viajes al futuro y tecnología avanzada');

-- Insertar datos en la tabla actores
INSERT INTO actores (nombre, fecha_nacimiento, biografia) VALUES
    ('Tom Cruise', '1962-07-03', 'Actor famoso por sus películas de acción'),
    ('Emma Stone', '1988-11-06', 'Actriz ganadora de un Oscar por La La Land'),
    ('Robert Downey Jr.', '1965-04-04', 'Actor conocido por su papel de Iron Man');

-- Insertar datos en la tabla saga
INSERT INTO saga (nombre, descripcion) VALUES
    ('Harry Potter', 'La saga del famoso mago de Hogwarts'),
    ('Avengers', 'Películas de los superhéroes de Marvel'),
    ('El Señor de los Anillos', 'La épica historia de la Tierra Media');

-- Insertar datos en la tabla peliculas
INSERT INTO peliculas (titulo, descripcion, fecha_lanzamiento, duracion, categoria_id) VALUES
    ('Avengers: Endgame', 'La batalla final contra Thanos', '2019-04-26', 181, 1),
    ('La La Land', 'Una historia de amor en Los Ángeles', '2016-12-09', 128, 2),
    ('Harry Potter y la Piedra Filosofal', 'El inicio de la historia del joven mago', '2001-11-16', 152, 4);

-- Insertar datos en la tabla favoritos
INSERT INTO favoritos (usuario_id, pelicula_id) VALUES
    (1, 2),
    (3, 1),
    (2, 3);

-- Insertar datos en la tabla peliculas_actores
INSERT INTO peliculas_actores (pelicula_id, actor_id) VALUES
    (1, 3),
    (2, 2),
    (3, 1);

-- Insertar datos en la tabla peliculas_saga
INSERT INTO peliculas_saga (pelicula_id, saga_id) VALUES
    (3, 1),
    (1, 2),
    (3, 2);
