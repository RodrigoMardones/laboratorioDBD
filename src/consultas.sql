
/*
pagos ultimos 6 meses
*/
select * from intencion where modificacion > now() - interval '6 months';

