const express = require('express');
const mysql = require('mysql2');

const app = express();
const port = 3001;

// Configuración de la conexión a MySQL
const db = mysql.createConnection({
    host: 'localhost',
    user: 'example', 
    password: 'example', 
    database: 'example_db'
});

// Conectar a MySQL
db.connect(err => {
    if (err) {
        console.error('Error conectando a MySQL:', err);
        return;
    }
    console.log('Conectado a MySQL');
});

// Obtener todos los usuarios
app.get('/usuarios', (req, res) => {
    db.query('SELECT * FROM usuarios', (err, results) => {
        if (err) {
            res.status(500).json({ error: err.message });
            return;
        }
        res.json(results);
    });
});

// Obtener un usuario por ID
app.get('/usuarios/:id', (req, res) => {
    const { id } = req.params;
    db.query('SELECT * FROM usuarios WHERE id = ?', [id], (err, results) => {
        if (err) {
            res.status(500).json({ error: err.message });
            return;
        }
        if (results.length === 0) {
            res.status(404).json({ message: 'Usuario no encontrado' });
            return;
        }
        res.json(results[0]);
    });
});

// Obtener todas las películas
app.get('/peliculas', (req, res) => {
    db.query('SELECT * FROM peliculas', (err, results) => {
        if (err) {
            res.status(500).json({ error: err.message });
            return;
        }
        res.json(results);
    });
});

// Obtener una película por ID
app.get('/peliculas/:id', (req, res) => {
    const { id } = req.params;
    db.query('SELECT * FROM peliculas WHERE id = ?', [id], (err, results) => {
        if (err) {
            res.status(500).json({ error: err.message });
            return;
        }
        if (results.length === 0) {
            res.status(404).json({ message: 'Película no encontrada' });
            return;
        }
        res.json(results[0]);
    });
});

// Obtener todas las categorías
app.get('/categorias', (req, res) => {
    db.query('SELECT * FROM categorias', (err, results) => {
        if (err) {
            res.status(500).json({ error: err.message });
            return;
        }
        res.json(results);
    });
});

// Obtener todos los actores
app.get('/actores', (req, res) => {
    db.query('SELECT * FROM actores', (err, results) => {
        if (err) {
            res.status(500).json({ error: err.message });
            return;
        }
        res.json(results);
    });
});

// Obtener todas las películas de un actor por ID
app.get('/actores/:actor_id/peliculas', (req, res) => {
    const { actor_id } = req.params;
    db.query(
        `SELECT peliculas.* FROM actor_pelicula
         INNER JOIN peliculas ON actor_pelicula.pelicula_id = peliculas.id
         WHERE actor_pelicula.actor_id = ?`,
        [actor_id],
        (err, results) => {
            if (err) {
                res.status(500).json({ error: err.message });
                return;
            }
            if (results.length === 0) {
                res.status(404).json({ message: 'No se encontraron películas para este actor' });
                return;
            }
            res.json(results);
        }
    );
});


// Obtener todas las películas favoritas de un usuario
app.get('/favoritos/:usuario_id', (req, res) => {
    const { usuario_id } = req.params;
    db.query(
        `SELECT peliculas.* FROM favoritos
         INNER JOIN peliculas ON favoritos.pelicula_id = peliculas.id
         WHERE favoritos.usuario_id = ?`,
        [usuario_id],
        (err, results) => {
            if (err) {
                res.status(500).json({ error: err.message });
                return;
            }
            res.json(results);
        }
    );
});

// Iniciar el servidor
app.listen(port, () => {
    console.log(`Servidor corriendo en http://localhost:${port}`);
});
