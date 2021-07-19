/*
companias tests
*/
insert into COMPANIA (nombre, direccion, dni) values ('AGUAS ANDINAS S.A.','AV. PRESIDENTE BALMACEDA 1398','61808000-5') ;
insert into COMPANIA (nombre, direccion, dni) values ('ENEL DISTRIBUCION CHILE S.A.','SANTA ROSA 76 PISO 2','96800570-7') ;
insert into COMPANIA (nombre, direccion, dni) values ('WOM S.A.','GENERAL MACKENNA 1369','78921690-8') ;

/*
rol tests
*/
insert into ROL (descripcion) values ('administrador de infraestructura');
insert into ROL (descripcion) values ('persona natural');
insert into ROL (descripcion) values ('analista de plataforma');

/*
estado tests
*/
insert into ESTADO (codigo_estado, mensaje_estado) values (1000, 'transaccion pagada');
insert into ESTADO (codigo_estado, mensaje_estado) values (1001, 'transaccion rechazada');
insert into ESTADO (codigo_estado, mensaje_estado) values (1002, 'transaccion reembolsada');


/*
servicios tets
*/
insert into servicio (nombre) values ('telefono hogar');
insert into servicio (nombre) values ('agua potable hogar');
insert into servicio (nombre) values ('television cable hogar');
insert into servicio (nombre) values ('internet hogar');


/*
pasarelas tests
*/
insert into pasarela (url_pago, nombre, activo) values ('http://test.url', 'U-PAY', true);
insert into pasarela (url_pago, nombre, activo) values ('http://test.url', 'FPAY', true);
insert into pasarela (url_pago, nombre, activo) values ('http://test.url', 'TRANSBANK', true);


/*
personas tests
*/
insert into persona (nombre, apellido_materno, apellido_paterno, dni, password) values ('John', 'Doe', 'Knou', '11111111-1','myencriptedpsswrd');
insert into persona (nombre, apellido_materno, apellido_paterno, dni, password) values ('Jane', 'Doe', 'Knou', '11111112-1','myencriptedpsswrd2');

/*
persona_rol tests
*/
insert into persona_rol (fk_id_rol, fk_id_persona) values (1,1);
insert into persona_rol (fk_id_rol, fk_id_persona) values (2,2);

/*
PERSONA_COMPANIA tests
*/
insert into PERSONA_COMPANIA (fk_id_persona, fk_id_compania, codigo_persona) values (1,1,'myclientcode123456');
insert into PERSONA_COMPANIA (fk_id_persona, fk_id_compania, codigo_persona) values (2,2,'myclientcode223456');
