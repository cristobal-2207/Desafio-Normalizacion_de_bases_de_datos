CREATE DATABASE normalizacion;
\c normalizacion

CREATE TABLE lectores(
    id_lector SERIAL PRIMARY KEY,
    nombre VARCHAR(30),
    apellido_Paterno VARCHAR(30),
    apellido_Materno VARCHAR(30)
);

CREATE TABLE autores(
    id_autor SERIAL PRIMARY KEY ,
    nombre VARCHAR(30),
    apellido_Paterno VARCHAR(30),
    apellido_Materno VARCHAR(30)
);

CREATE TABLE editoriales(
    id_editorial SERIAL PRIMARY KEY,
    nombre_editorial VARCHAR(30)
);


CREATE TABLE prestamos(
    id_prestamo SERIAL PRIMARY KEY,
    fecha_devolucion DATE
);

CREATE TABLE libros(
    id_libro SERIAL PRIMARY KEY,
    titulo VARCHAR(50)
);

CREATE TABLE libro_autor(
    id_libro INT,
    id_autor INT,
    FOREIGN KEY (id_autor) REFERENCES autores(id_autor),
    FOREIGN KEY (id_libro) REFERENCES libros(id_libro)
);

CREATE TABLE editorial_libro(
    id_editorial  INT,
    id_libro INT,
    FOREIGN KEY (id_editorial) REFERENCES editoriales(id_editorial),
    FOREIGN KEY (id_libro) REFERENCES libros(id_libro)
);

CREATE TABLE lector_libro(
    id_lector INT,
    id_libro INT,
    FOREIGN KEY (id_lector) REFERENCES lectores(id_lector),
    FOREIGN KEY (id_libro) REFERENCES libros(id_libro)
);

CREATE TABLE prestamo_libro(
    id_prestamo INT,
    id_libro INT,
    FOREIGN KEY (id_prestamo) REFERENCES prestamos(id_prestamo),
    FOREIGN KEY (id_libro) REFERENCES libros(id_libro)
);