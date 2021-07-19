
/*
pagos ultimos 6 meses
*/
select * from intencion where
(fk_id_persona = 1 and
 estado = 'paid' and
 modificacion > now() - interval '6 months');