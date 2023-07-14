--@Autor:           Iñaky Ordiales Caballero
--@Fecha creación:  1/06/2022
--@Descripción:     Consultas relevantes dentro del caso de estudio.



-- Consulta 1: Información de pasajeros
prompt
prompt - - -  CONSULTA 1  - - -

prompt
prompt Información importante de los pasajeros de los vuelos.
prompt 
select v.vuelo_id, v.num_vuelo, p.pasajero_id, p.curp, p.nombre, p.ap_paterno, trunc(((sysdate - p.fecha_nacimiento)/365.25),0) as edad,
  q1.num_maletas, q2.num_vuelos
from vuelo v, pasajero p, pasajero_vuelo pv, pase_abordar pa, (
    select pase_abordar_id, max(num_maleta) as num_maletas
    from maleta
    group by pase_abordar_id
  )q1, (
    select pasajero_vuelo_id, count(*) as num_vuelos
    from pasajero_vuelo
    where abordo='1'
    group by pasajero_vuelo_id
  )q2
where v.vuelo_id = pv.vuelo_id
  and pv.pasajero_id = p.pasajero_id
  and pv.pasajero_vuelo_id = pa.pasajero_vuelo_id
  and q1.pase_abordar_id = pa.pase_abordar_id
  and q2.pasajero_vuelo_id = pa.pasajero_vuelo_id
order by vuelo_id;



-- Consulta 2: Información de los aviones
prompt
prompt - - -  CONSULTA 2  - - -

prompt
prompt Información completa de los aviones de la aerolínea.
prompt 
select a.avion_id, a.matricula, a.modelo, a.es_comercial,
  a.es_carga, co.cap_total cap_total_pasajeros, ca.num_bodegas, ca.cap_carga, ae.nombre
from avion a, comercial co, carga ca, aeropuerto ae
where a.avion_id=co.avion_id(+)
  and a.avion_id=ca.avion_id(+)
  and ca.aero_resguardo_id = ae.aeropuerto_id(+);



-- Consulta 3: Información histórico vuelo
prompt
prompt - - -  CONSULTA 3  - - -

prompt
prompt Información completa (extra) del histórico de los vuelos.
prompt 
select vuelo_id, v.num_vuelo, h.historico_status_vuelo_id, h.fecha, s.clave, s.nombre
from
  historico_status_vuelo h
  natural join
  status_vuelo s
  join
  vuelo v using (vuelo_id)
order by vuelo_id, historico_status_vuelo_id;



-- Consulta 4: Tabla externa: modelos que no tenemos o con mayor capacidad de pasajeros o carga.
prompt
prompt - - -  CONSULTA 4  - - -

prompt
prompt Aviones candidatos para compra: no se tienen, caben más pasajero o más carga.
prompt 
select matricula, modelo, (cap_ordinarios+cap_vip+cap_discapacitados) as cap_pasajeros_total,
  num_bodegas, cap_carga, (select max(cap_total) from comercial) as cap_pasajeros_max_actual, 
  (select max(cap_carga) from carga) as cap_carga_max_actual
from avion_ext
where modelo not in (
  select modelo from avion)
union ( 
    select matricula, modelo, (cap_ordinarios+cap_vip+cap_discapacitados) as cap_pasajeros_total,
      num_bodegas, cap_carga, (select max(cap_total) from comercial) as cap_pasajeros_max_actual, 
      (select max(cap_carga) from carga) as cap_carga_max_actual
    from avion_ext
    where (cap_ordinarios+cap_vip+cap_discapacitados) > (
        select max(cap_total)
        from comercial
      )
      or cap_carga > (
        select max(cap_carga)
        from carga
      )
  minus
    select matricula, modelo, (cap_ordinarios+cap_vip+cap_discapacitados) as cap_pasajeros_total,
      num_bodegas, cap_carga, (select max(cap_total) from comercial) as cap_pasajeros_max_actual, 
      (select max(cap_carga) from carga) as cap_carga_max_actual
    from avion_ext
    where modelo not in (
      select modelo from avion)
);



-- Consulta 5: Usuario invitado ve información vuelos con sinónimos.
prompt
prompt - - -  CONSULTA 5  - - -

prompt
prompt Lectura de información de vuelos por usuario invitado con sinónimos.
prompt 

prompt Conectando con usuario invitado ...
connect or_proy_invitado
prompt
col origen format a30
col destino format a30

select v.vuelo_id, v.num_vuelo, a.matricula, a.modelo, v.salida, aeor.nombre origen,
  aede.nombre destino, v.fecha_status, st.nombre status
from sy_avion a, sy_vuelo v, status_vuelo st, sy_aeropuerto aeor, sy_aeropuerto aede
where a.avion_id=v.avion_id
  and v.status_vuelo_id = st.status_vuelo_id
  and aeor.aeropuerto_id=v.aero_origen_id
  and aede.aeropuerto_id=v.aero_destino_id;

prompt
prompt Lectura de monitoreo del vuelo 7.
prompt 

select * from sy_monitoreo
where vuelo_id=7;

prompt
prompt Conectando con usuario administrador
connect or_proy_admin
prompt



-- Consulta 6: Mejores puntuados de la vista de información tripulación.
prompt
prompt - - -  CONSULTA 6  - - -

prompt
prompt Tripulantes con mejor calificación por puesto.
prompt 
select distinct * 
from v_info_tripulacion
where puntaje_prom in (
  select max(puntaje_prom) from v_info_tripulacion
  group by puesto
  );



-- Consulta 7: Tabla temporal
prompt
prompt - - -  CONSULTA 7  - - -

prompt
prompt Tabla temporal de registro de avioens actuales para conocer la flota repetida.
prompt 
insert into datos_avion_temp(avion_id,matricula,modelo,cap_ordinarios,cap_vip,cap_discapacitados,cap_total,
  num_bodegas,cap_carga,carga_bodega,aero_resguardo)
  values(7, 'XA-AAA-09', 'Airbus 320', 120, 12, 3, 135, 0, 0, 0, '');
insert into datos_avion_temp(avion_id,matricula,modelo,cap_ordinarios,cap_vip,cap_discapacitados,cap_total,
  num_bodegas,cap_carga,carga_bodega,aero_resguardo)
  values(8, 'XA-KCU-32', 'Boeing 747', 200, 25, 5, 230, 0, 0, 0, '');
insert into datos_avion_temp(avion_id,matricula,modelo,cap_ordinarios,cap_vip,cap_discapacitados,cap_total,
  num_bodegas,cap_carga,carga_bodega,aero_resguardo)
  values(9, 'XC-LIE-01', 'Boeing 767', 150, 20, 2, 172, 0, 0, 0, '');
insert into datos_avion_temp(avion_id,matricula,modelo,cap_ordinarios,cap_vip,cap_discapacitados,cap_total,
  num_bodegas,cap_carga,carga_bodega,aero_resguardo)
  values(10, 'XB-UDB-64', 'Boeing 747', 180, 10, 0, 190, 0, 0, 0, '');
insert into datos_avion_temp(avion_id,matricula,modelo,cap_ordinarios,cap_vip,cap_discapacitados,cap_total,
  num_bodegas,cap_carga,carga_bodega,aero_resguardo)
  values(11, 'XC-WKI-03', 'Airbus 300-600 st', 0, 0, 0, 0, 20, 205, 10.25, 'A. I. de Santa Lucía');
insert into datos_avion_temp(avion_id,matricula,modelo,cap_ordinarios,cap_vip,cap_discapacitados,cap_total,
  num_bodegas,cap_carga,carga_bodega,aero_resguardo)
  values(12, 'XC-ZXA-01', 'Airbus 320', 0, 0, 0, 0, 15, 180, 12, 'A. I. de Santa Lucía');
insert into datos_avion_temp(avion_id,matricula,modelo,cap_ordinarios,cap_vip,cap_discapacitados,cap_total,
  num_bodegas,cap_carga,carga_bodega,aero_resguardo)
  values(13, 'XC-UIW-12', 'Airbus 340', 0, 0, 0, 0, 30, 345, 11.5, 'A. I. de Mérida');
insert into datos_avion_temp(avion_id,matricula,modelo,cap_ordinarios,cap_vip,cap_discapacitados,cap_total,
  num_bodegas,cap_carga,carga_bodega,aero_resguardo)
  values(14, 'XC-SKR-55', 'Airbus 300-600 st', 0, 0, 0, 0, 26, 321, 12.35, 'A. I. de Cancun');
insert into datos_avion_temp(avion_id,matricula,modelo,cap_ordinarios,cap_vip,cap_discapacitados,cap_total,
  num_bodegas,cap_carga,carga_bodega,aero_resguardo)
  values(15, 'XA-POR-94', 'Boeing 747', 100, 6, 2, 108, 15, 100, 6.67, 'A. I. de Santa Lucía');
insert into datos_avion_temp(avion_id,matricula,modelo,cap_ordinarios,cap_vip,cap_discapacitados,cap_total,
  num_bodegas,cap_carga,carga_bodega,aero_resguardo)
  values(16, 'XA-EYU-36', 'ANTONOV 225 MRIYA', 70, 6, 0, 76, 40, 500, 12.5, 'A.I. de Mazatlán');
insert into datos_avion_temp(avion_id,matricula,modelo,cap_ordinarios,cap_vip,cap_discapacitados,cap_total,
  num_bodegas,cap_carga,carga_bodega,aero_resguardo)
  values(17, 'XB-IOC-11', 'Boeing 767', 50, 6, 4, 60, 22, 140, 6.36, 'A. I. de Santa Lucía');
insert into datos_avion_temp(avion_id,matricula,modelo,cap_ordinarios,cap_vip,cap_discapacitados,cap_total,
  num_bodegas,cap_carga,carga_bodega,aero_resguardo)
  values(18, 'XA-LLL-87', 'Airbus 340', 210, 25, 8, 243, 5, 30.5, 6.1, 'A. I. de Santa Lucía');

select modelo, count(*) num_aviones, sum(cap_total) pasajeros, sum(cap_carga) carga
from datos_avion_temp
group by modelo
having count(*) >1;