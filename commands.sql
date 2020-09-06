-- Crear base de datos y conectarse a ella
CREATE DATABASE biblioteca;
\c biblioteca;

-- Crear tablas y relaciones
CREATE TABLE autores(id SERIAL PRIMARY KEY, nombre VARCHAR(100) NOT NULL);

CREATE TABLE libros(codigo INT PRIMARY KEY, nombre VARCHAR(100) NOT NULL);

CREATE TABLE autores_libros(
    autor_id INT, 
    libro_cod INT, 
    FOREIGN KEY(autor_id) REFERENCES autores(id), 
    FOREIGN KEY(libro_cod) REFERENCES libros(codigo)
);

CREATE TABLE editoriales(id SERIAL PRIMARY KEY, nombre VARCHAR(100) NOT NULL);

CREATE TABLE editoriales_libros(
    editorial_id INT,
    libro_cod INT UNIQUE,
    FOREIGN KEY(editorial_id) REFERENCES editoriales(id),
    FOREIGN KEY(libro_cod) REFERENCES libros(codigo)
);

CREATE TABLE lectores(id SERIAL PRIMARY KEY, nombre VARCHAR(100) NOT NULL);

CREATE TABLE prestamos(
    id SERIAL PRIMARY KEY,
    fecha_devolucion DATE NOT NULL,
    lector_id INT NOT NULL,
    libro_cod INT NOT NULL,
    FOREIGN KEY(lector_id) REFERENCES lectores(id),
    FOREIGN KEY(libro_cod) REFERENCES libros(codigo)
);

-- Insertar datos en las tablas
INSERT INTO libros(codigo, nombre) VALUES
(515, 'Ecuaciones diferenciales para ingenieros y cientificos'),
(540, 'Quimica'),
(530, 'Fisica'),
(519, 'Estadistica'),
(512, 'Algebra Lineal');

INSERT INTO autores(nombre) VALUES
('Lambe, C. G.'),
('Tranter, C. J.'),
('Christen, Hans Rudolf'),
('Serway, Raymond A.'),
('Murray, Spiegel'),
('Voevodin, Valentin V');

INSERT INTO autores_libros(autor_id, libro_cod) VALUES
(1, 515),
(2, 515),
(3, 540),
(4, 530),
(5, 519),
(6, 512);

INSERT INTO editoriales(nombre) VALUES
('UTHEA'),
('Reverte'),
('McGraw-Hill'),
('MIR');

INSERT INTO editoriales_libros(editorial_id, libro_cod) VALUES
(1, 515),
(2, 540),
(3, 530),
(3, 519),
(4, 512);

INSERT INTO lectores(nombre) VALUES
('Perez Gomez, Juan'),
('Ortega Pereira, Margarita'),
('Garcia Contreras, Rosa'),
('Lopez Molina, Ana');

INSERT INTO prestamos(fecha_devolucion, lector_id, libro_cod) VALUES
('2019/09/15', 1, 515),
('2019/08/23', 2, 540),
('2019/09/24', 3, 540),
('2019/09/18', 4, 519),
('2019/09/17', 1, 512);