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
  id_persona SERIAL NOT NULL PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  apellido_materno VARCHAR(50) NOT NULL,
  apellido_paterno VARCHAR(50) NOT NULL,
  dni VARCHAR(50) NOT NULL,
  password VARCHAR(50) NOT NULL,
  activo BOOL DEFAULT TRUE
);

/*
ROL
*/
CREATE TABLE ROL(
  id_rol SERIAL NOT NULL PRIMARY KEY,
  descripcion VARCHAR(50) NOT NULL
);

/*
PERSONA_ROL
*/
CREATE TABLE PERSONA_ROL (
  fk_id_rol INT NOT NULL REFERENCES ROL(id_rol)  ON DELETE RESTRICT ON UPDATE CASCADE,
  fk_id_persona INT NOT NULL REFERENCES PERSONA(id_persona) ON DELETE RESTRICT ON UPDATE CASCADE
);

/*
CONTACTO
*/
CREATE TABLE CONTACTO(
  id_contacto SERIAL PRIMARY KEY,
  telefono VARCHAR(50) NOT NULL,
  direccion VARCHAR(50) NOT NULL,
  correo_electronico VARCHAR(50) not null,
  fk_id_persona INT REFERENCES PERSONA(id_persona) ON DELETE RESTRICT ON UPDATE CASCADE
);


/*
COMPANIA
*/
CREATE TABLE COMPANIA(
  id_compania SERIAL PRIMARY KEY,
  nombre  VARCHAR(50) NOT NULL,
  direccion VARCHAR(50) NOT NULL,
  dni VARCHAR(50) NOT NULL
);

/*
COMPANIA-PERSONA
*/
CREATE TABLE PERSONA_COMPANIA(
    fk_id_persona INT NOT NULL REFERENCES PERSONA(id_persona) ON DELETE RESTRICT ON UPDATE CASCADE,
    fk_id_compania INT NOT NULL REFERENCES COMPANIA(id_compania) ON DELETE RESTRICT ON UPDATE CASCADE,
    codigo_persona varchar(50) NOT NULL
);

/*
SERVICIO
*/
CREATE TABLE SERVICIO(
    id_servicio SERIAL NOT NULL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);
/*
ESTADO
*/
CREATE TABLE ESTADO(
  id_estado SERIAL NOT NULL PRIMARY KEY,
  codigo_estado INT NOT NULL,
  mensaje_estado VARCHAR(100) NOT NULL
);

/*
TRANSACCION
*/
CREATE TABLE TRANSACCION(
  id_transaccion SERIAL NOT NULL PRIMARY KEY,
  comprobante_url VARCHAR(200),
  fecha_transaccion TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  fk_id_estado INT NOT NULL REFERENCES ESTADO(id_estado) ON DELETE RESTRICT ON UPDATE CASCADE
);


/*
PASARELA
*/
CREATE TABLE PASARELA (
    id_pasarela SERIAL NOT NULL PRIMARY KEY,
    url_pago VARCHAR(200) NOT NULL,
    nombre VARCHAR(50),
    activo bool default true
);


/*
INTENCION
*/

CREATE TABLE INTENCION (
    id_intencion SERIAL NOT NULL PRIMARY KEY,
    estado VARCHAR(50) NOT NULL,
    MONTO INT NOT NULL,
    CREACION  TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    modificacion  TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    fk_id_compania INT NOT NULL REFERENCES COMPANIA(id_compania) ON DELETE RESTRICT ON UPDATE CASCADE,
    fk_id_pasarela INT NOT NULL REFERENCES PASARELA(id_pasarela) ON DELETE RESTRICT ON UPDATE CASCADE,
    fk_id_servicio INT NOT NULL REFERENCES SERVICIO(id_servicio) ON DELETE RESTRICT ON UPDATE CASCADE,
    fk_id_persona INT NOT NULL REFERENCES PERSONA(id_persona) ON DELETE RESTRICT ON UPDATE CASCADE,
    fk_id_transaccion INT NOT NULL REFERENCES TRANSACCION(id_transaccion) ON DELETE CASCADE ON UPDATE CASCADE
);