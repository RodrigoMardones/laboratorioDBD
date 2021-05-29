create schema schema_laboratorio;
SET search_path TO schema_laboratorio;

SHOW search_path;

/*
TABLAS
*/


/*
PERSONA
*/
CREATE TABLE PERSONA(
  id_persona SERIAL PRIMARY KEY,
  nombre varchar(50) NOT NULL,
  apellido_materno varchar(50) NOT NULL,
  apellido_paterno varchar(50) NOT NULL,
  dni varchar(50) NOT NULL,
  password varchar(50) NOT NULL,
  activo bool default true
);

/*
ROL
*/
CREATE TABLE ROL(
  id_rol SERIAL PRIMARY KEY,
  descripcion varchar(50) NOT NULL
);

/*
PERSONA_ROL
*/
CREATE TABLE PERSONA_ROL (
  fk_id_rol int NOT NULL REFERENCES ROL(id_rol)  ON DELETE RESTRICT ON UPDATE CASCADE,
  fk_id_persona int NOT NULL REFERENCES PERSONA(id_persona) ON DELETE RESTRICT ON UPDATE CASCADE
);

/*
CONTACTO
*/
CREATE TABLE CONTACTO(
  id_contacto SERIAL PRIMARY KEY,
  telefono varchar(50) NOT NULL,
  direccion varchar(50) NOT NULL,
  correo_electronico varchar(50) not null,
  fk_id_persona int REFERENCES PERSONA(id_persona) ON DELETE RESTRICT ON UPDATE CASCADE
);


/*
COMPANIA
*/
CREATE TABLE COMPANIA(
  id_compania SERIAL PRIMARY KEY,
  nombre  varchar(50) NOT NULL,
  direccion varchar(50) NOT NULL,
  dni varchar(50) NOT NULL
);

/*
COMPANIA-PERSONA
*/
CREATE TABLE PERSONA_COMPANIA(
    fk_id_persona INT NOT NULL REFERENCES PERSONA(id_persona) ON DELETE RESTRICT ON UPDATE CASCADE,
    fk_id_compania INT NOT NULL REFERENCES COMPANIA(id_compania) ON DELETE RESTRICT ON UPDATE CASCADE
);

/*
SERVICIO
*/
CREATE TABLE SERVICIO(
    id_servicio SERIAL NOT NULL PRIMARY KEY,
    nombre varchar(50) NOT NULL
);
/*
ESTADO
*/
CREATE TABLE ESTADO(
  id_estado SERIAL NOT NULL PRIMARY KEY,
  codigo_estado INT NOT NULL,
  mensaje_estado varchar(100) NOT NULL
);

/*
TRANSACCION
*/
CREATE TABLE TRANSACCION(
  id_transaccion SERIAL NOT NULL PRIMARY KEY,
  comprobante_url varchar(200),
  fecha_transaccion DATE NOT NULL,
  fk_id_estado INT NOT NULL REFERENCES ESTADO(id_estado) ON DELETE RESTRICT ON UPDATE CASCADE
);


/*
PASARELA
*/
CREATE TABLE PASARELA (
    id_pasarela SERIAL NOT NULL PRIMARY KEY,
    url_pago varchar(200) NOT NULL,
    nombre varchar(50),
    activo bool default true
);


/*
INTENCION
*/

CREATE TABLE INTENCION (
    id_intencion SERIAL NOT NULL PRIMARY KEY,
    estado varchar(50) NOT NULL,
    MONTO INT NOT NULL,
    CREACION DATE NOT NULL DEFAULT now(),
    modificacion date NOT NULL DEFAULT now(),
    fk_id_compania INT NOT NULL REFERENCES COMPANIA(id_compania) ON DELETE RESTRICT ON UPDATE CASCADE,
    fk_id_pasarela INT NOT NULL REFERENCES PASARELA(id_pasarela) ON DELETE RESTRICT ON UPDATE CASCADE,
    fk_id_servicio INT NOT NULL REFERENCES SERVICIO(id_servicio) ON DELETE RESTRICT ON UPDATE CASCADE,
    fk_id_persona INT NOT NULL REFERENCES PERSONA(id_persona) ON DELETE RESTRICT ON UPDATE CASCADE,
    fk_id_transaccion INT NOT NULL REFERENCES TRANSACCION(id_transaccion) ON DELETE CASCADE ON UPDATE CASCADE
);