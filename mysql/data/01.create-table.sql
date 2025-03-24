-- Tabla de categorías (crear primero porque es referenciada por otras tablas)
CREATE TABLE IF NOT EXISTS categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion TEXT
);

-- Tabla de usuarios
CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    contrasena_hash VARCHAR(255) NOT NULL,
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado ENUM('activo', 'inactivo') DEFAULT 'activo'
);

-- Tabla de películas
CREATE TABLE IF NOT EXISTS peliculas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    descripcion TEXT,
    fecha_lanzamiento DATE,
    duracion INT,
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES categorias(id) ON DELETE SET NULL
);

-- Tabla de actores
CREATE TABLE IF NOT EXISTS actores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    fecha_nacimiento DATE,
    biografia TEXT
);

-- Tabla de sagas
CREATE TABLE IF NOT EXISTS saga (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT
);

-- Tabla de favoritos
CREATE TABLE IF NOT EXISTS favoritos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    pelicula_id INT,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (pelicula_id) REFERENCES peliculas(id) ON DELETE CASCADE
);

-- Tabla intermedia para películas y actores (relación muchos a muchos)
CREATE TABLE IF NOT EXISTS peliculas_actores (
    pelicula_id INT,
    actor_id INT,
    FOREIGN KEY (pelicula_id) REFERENCES peliculas(id) ON DELETE CASCADE,
    FOREIGN KEY (actor_id) REFERENCES actores(id) ON DELETE CASCADE,
    PRIMARY KEY (pelicula_id, actor_id)
);

-- Tabla intermedia para películas y sagas (relación muchos a muchos)
CREATE TABLE IF NOT EXISTS peliculas_saga (
    pelicula_id INT,
    saga_id INT,
    FOREIGN KEY (pelicula_id) REFERENCES peliculas(id) ON DELETE CASCADE,
    FOREIGN KEY (saga_id) REFERENCES saga(id) ON DELETE CASCADE,
    PRIMARY KEY (pelicula_id, saga_id)
);
