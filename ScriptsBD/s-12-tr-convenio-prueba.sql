--@Autor:           Iñaky Ordiales Caballero
--@Fecha creación:  9/06/2022
--@Descripción:     Prueba de trigger para verificar que los aeropuertos de origen y destino tengan convenio con la aerolínea.



set serveroutput on

Prompt Prueba de inserciones a vuelo por convenios.

Prompt
Prompt
Prompt =====================================
Prompt Escenario 1:
Prompt Se inserta vuelo con aeropuertos sin convenio.
Prompt =====================================
Prompt 

select count(*) vuelos_antes
from vuelo;

insert into vuelo(vuelo_id, num_vuelo, salida, llegada, avion_id,
  aero_origen_id, aero_destino_id)
values (seq_vuelo.nextval, 12301, sysdate, sysdate+(2/24), 10, 19, 20);

select count(*) vuelos_despues
from vuelo;

Prompt
Prompt
Prompt *************************************
Prompt haciendo rollback (innecesario) para limpiar tablas
rollback;
Prompt *************************************
Prompt

Prompt
Prompt
Prompt =====================================
Prompt Escenario 2:
Prompt Se inserta vuelo con aeropuerto origen sin convenio.
Prompt =====================================
Prompt 

select count(*) vuelos_antes
from vuelo;

insert into vuelo(vuelo_id, num_vuelo, salida, llegada, avion_id,
  aero_origen_id, aero_destino_id)
values (seq_vuelo.nextval, 12301, sysdate, sysdate+(2/24), 10, 19, 11);

select count(*) vuelos_despues
from vuelo;

Prompt
Prompt
Prompt *************************************
Prompt haciendo rollback (innecesario) para limpiar tablas
rollback;
Prompt *************************************
Prompt


Prompt
Prompt
Prompt =====================================
Prompt Escenario 3:
Prompt Se inserta vuelo con aeropuerto destino sin convenio.
Prompt =====================================
Prompt 

select count(*) vuelos_antes
from vuelo;

insert into vuelo(vuelo_id, num_vuelo, salida, llegada, avion_id,
  aero_origen_id, aero_destino_id)
values (seq_vuelo.nextval, 12301, sysdate, sysdate+(2/24), 10, 11, 20);

select count(*) vuelos_despues
from vuelo;

Prompt
Prompt
Prompt *************************************
Prompt haciendo rollback (innecesario) para limpiar tablas
rollback;
Prompt *************************************
Prompt

Prompt
Prompt
Prompt =====================================
Prompt Escenario 4:
Prompt Se inserta vuelo con aeropuertos con convenio.
Prompt =====================================
Prompt 

select count(*) vuelos_antes
from vuelo;

insert into vuelo(vuelo_id, num_vuelo, salida, llegada, avion_id,
  aero_origen_id, aero_destino_id)
values (seq_vuelo.nextval, 12301, sysdate, sysdate+(2/24), 10, 11, 7);

select count(*) vuelos_despues
from vuelo;

Prompt
Prompt
Prompt *************************************
Prompt haciendo rollback (necesario) para limpiar tablas
rollback;
Prompt *************************************
Prompt

set serveroutput off

-- declare
-- begin
-- --invocar a la función
-- sp_actualiza_foto_auto(11,0);
-- end;
-- /
-- show errors

-- Prompt
-- Prompt
-- Prompt *************************************
-- Prompt haciendo rollback para limpiar tablas
-- rollback;
-- Prompt *************************************
-- Prompt

-- Prompt
-- Prompt
-- Prompt ========================
-- Prompt Escenario 2:
-- Prompt Agregar imagen a 11 autos.
-- Prompt ========================
-- Prompt agregando imagen de los autos con id: [20-30]

-- declare
-- begin
-- --invocar a la función
-- sp_actualiza_foto_auto(20,10);
-- end;
-- /
-- show errors

-- Prompt
-- Prompt
-- Prompt *************************************
-- Prompt haciendo rollback para limpiar tablas
-- rollback;
-- Prompt *************************************
-- Prompt

-- Prompt
-- Prompt
-- Prompt ========================
-- Prompt Escenario 3:
-- Prompt Agregar imagen a autos fuera del rango de imagenes.
-- Prompt ========================
-- Prompt agregando imagen de los autos con id: [201-205]

-- declare
-- begin
-- --invocar a la función
-- sp_actualiza_foto_auto(201,4);
-- end;
-- /
-- show errors

-- Prompt
-- Prompt
-- Prompt *************************************
-- Prompt haciendo rollback para limpiar tablas
-- rollback;
-- Prompt *************************************
-- Prompt

-- set serveroutput off
