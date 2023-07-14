--@Autor:           Iñaky Ordiales Caballero
--@Fecha creación:  1/06/2022
--@Descripción:     Creación de índices propuestos de utilidad.



-- índices para el rendimiento de búsquedas comunes para columnas

create index vue_num_vuelo_ix on vuelo (num_vuelo);
create index avi_modelo_ix on avion (modelo);
create index aero_nombre_ix on aeropuerto (nombre);
-- create unique index pasa_curp_iuk on pasajero (curp);
-- create unique index pase_folio_iuk on pase_abordar (folio);
-- create unique index emp_rfc_iuk on empleado (rfc);
-- create unique index emp_curp_iuk on empleado (curp);
-- create unique index avi_matricula_iuk on avion (matricula);
-- create unique index aero_clave_iuk on aeropuerto (aeropuerto_id);



-- índices de llaves foráneas muy usadas en joins

-- create unique index vue_vuelo_id_iuk on vuelo (vuelo_id);
-- create unique index avi_avion_id_iuk on avion (avion_id);
-- create unique index aero_aeropuerto_id_iuk on aeropuerto (aeropuerto_id);
-- create unique index emp_empleado_id on empleado (empleado_id);



-- índices de unicidad de valores (compuestos)

create unique index pasa_vue_pasajero_id_vuelo_id_iuk on pasajero_vuelo (pasajero_id,vuelo_id);
create unique index tripu_vue_empleado_id_vuelo_id_iuk on tripulante_vuelo (empleado_id,vuelo_id);


-- índices basados en funciones

create unique index idx_pasa_nombre_iuk on pasajero (lower(nombre));