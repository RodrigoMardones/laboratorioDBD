/*
* pagos de los ultimos 6 meses anteriores
*/

select * from persona as per join intencion as intn on
    (
    per.dni = '11111111-1' and
    intn.estado = 'paid' and
    modificacion > NOW() - INTERVAL '6 MONTHS');


/*
* comprobante de pago efectivo
*/
SELECT DISTINCT compania.nombre as comp, servicio.nombre as servs, comprobante_url FROM persona JOIN intencion ON dni='11111111-1' JOIN compania ON id_compania=fk_id_compania JOIN servicio ON fk_id_servicio=id_servicio  JOIN transaccion ON (id_persona=fk_id_persona AND modificacion BETWEEN '2021-01-30' AND '2021-07-20');


/*
* identificar qué dia del mes
*/
SELECT EXTRACT(DAY FROM modificacion) AS dia_del_mes, COUNT(*) AS npagos FROM intencion WHERE estado='paid' AND EXTRACT(MONTH FROM modificacion)=7 GROUP BY dia_del_mes ORDER BY npagos DESC LIMIT 1;


/*
* top  5 empresas con mayor cantidad de pago
*/

SELECT nombre, count(*) AS npagos FROM compania JOIN intencion ON estado='paid' GROUP BY id_compania ORDER BY npagos DESC LIMIT 5;