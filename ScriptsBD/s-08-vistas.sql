--@Autor:           Iñaky Ordiales Caballero
--@Fecha creación:  1/06/2022
--@Descripción:     Creación de diferentes vistas de utilidad


-- Información acerca de la tripulación de los vuelos.
create or replace view V_INFO_TRIPULACION (
  empleado_id, nombre, apellido_paterno, clave_puesto, puesto, num_vuelos, puntaje_prom
) as
  select e.empleado_id, e.nombre, e.ap_paterno, pe.clave, pe.nombre, num_vuelos, puntaje_prom
  from empleado e, puesto_empleado pe, (
  	select empleado_id, count(*) as num_vuelos, round(avg(puntos),2) as puntaje_prom
  	from tripulante_vuelo
  	group by (empleado_id)
    ) q
  where e.puesto_empleado_id = pe.puesto_empleado_id
    and e.empleado_id = q.empleado_id;



-- Información acerca de los paquetes normalizada
create or replace view V_INFO_PAQUETE (
  paquete_id, folio, peso, clave, descripcion, vuelo_id, num_vuelo, llegada, status
) as
  select p.paquete_id, p.folio, p.peso, tp.clave, tp.descripcion,
    v.vuelo_id, v.num_vuelo, v.llegada, st.nombre
  from paquete p, tipo_paquete tp, vuelo v, status_vuelo st
  where p.tipo_paquete_id = tp.tipo_paquete_id
    and p.vuelo_id = v.vuelo_id
    and v.status_vuelo_id = st.status_vuelo_id;

grant select on V_INFO_PAQUETE to or_proy_invitado;



-- Características más completas de avion con datos derivados.
create or replace view V_AVION_COMPLETO (
  avion_id, matricula, modelo, capacidad_pasajeros, capacidad_carga
) as
  select a.avion_id, a.matricula, a.modelo, co.cap_total, ca.cap_carga
  from avion a, comercial co, carga ca
  where a.avion_id=co.avion_id(+)
    and a.avion_id=ca.avion_id(+);