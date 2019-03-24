CREATE DATABASE ferreteria_acme;

USE ferreteria_acme;

CREATE TABLE users(
    username varchar(20) NOT NULL PRIMARY KEY,
    password varchar(32) NOT NULL,
    privilege integer NOT NULL DEFAULT -1,
    status integer NOT NULL DEFAULT 1,
    name varchar(150) NOT NULL,
    email varchar(100) NOT NULL,
    other_data varchar(50) NOT NULL,
    user_hash varchar(32) NOT NULL,
    change_pwd integer NOT NULL DEFAULT 1,
    created timestamp NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE sessions(
    session_id char(128) UNIQUE NOT NULL,
    atime timestamp NOT NULL default current_timestamp,
    data text
)ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE logs( 
    id_log integer NOT NULL PRIMARY KEY AUTO_INCREMENT,
    username varchar(20) NOT NULL,
    ip varchar(16) NOT NULL,
    access timestamp NOT NULL,
    FOREIGN KEY (username) REFERENCES users(username)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE clientes( 
    id_cliente integer NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre varchar(50) NOT NULL,
    apellido_paterno varchar(50) NOT NULL,
    apellido_materno varchar(50) NOT NULL,
    calle varchar(50) NOT NULL,
    colonia varchar(50) NOT NULL,
    estado varchar(50) NOT NULL,
    municipio varchar(50) NOT NULL,
    telefono varchar(15) NOT NULL,
    latitud varchar(20) NOT NULL,
    longitud varchar(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO clientes(nombre,apellido_paterno,apellido_materno,calle,
colonia,estado,municipio,telefono,latitud,longitud)
VALUES('karla','fragoso','cerecedo','calle 1','colonia 1','estado 1','municipio 1','1234567890','10.908000','-90.8663'),
('Jorge','Morales','Paredes','7710235907','JoMa@email.com'),;






INSERT INTO users (username, password, privilege, status, name, email, other_data, user_hash, change_pwd)
VALUES ('admin',MD5(concat('admin', 'kuorra_key')), 0, 1, 'Admin', 'admin@gmail.com','TIC:SI', MD5(concat('admin', 'kuorra_key', '2016/06/04')), 0),
('guess',MD5(concat('guess', 'kuorra_key')), 1, 1, 'Guess', 'guess@gmail.com','TIC:SI', MD5(concat('guess', 'kuorra_key','2016/06/04')), 0);


SELECT * FROM users;
SELECT * FROM sessions;

CREATE USER 'karla'@'localhost' IDENTIFIED BY 'karla.2019';
GRANT ALL PRIVILEGES ON ferreteria_acme.* TO 'karla'@'localhost';
FLUSH PRIVILEGES;
