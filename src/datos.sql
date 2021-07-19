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