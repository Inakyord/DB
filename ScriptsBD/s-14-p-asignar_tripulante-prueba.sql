--@Autor:           Iñaky Ordiales Caballero
--@Fecha creación:  9/06/2022
--@Descripción:     Prueba de procedimiento para asignar tripulante a un vuelo, checando disponibilidad


set serveroutput on
alter session set nls_date_format = 'DD-MM-YYYY hh24:mi:ss';

Prompt Prueba de pagos.

Prompt
Prompt
Prompt ========================
Prompt Escenario 1:
Prompt Traslape de fechas.
Prompt ========================
Prompt


insert into vuelo (vuelo_id, num_vuelo, salida, llegada, num_sala, fecha_status, avion_id,
  aero_origen_id, aero_destino_id)
  values(30, 99999, to_date('10/06/2022 20:15:00','dd/mm/yyyy hh24:mi:ss'), to_date('10/06/2022 21:15:00','dd/mm/yyyy hh24:mi:ss'),
    'AB-32',to_date('01/08/2021 00:00:00','dd/mm/yyyy hh24:mi:ss'), 8,11,13);

declare
begin
  --invocar a la función (empleado_id, vuelo_id)
  proc_asignar_tripulante(12,30);
end;
/
show errors


Prompt
Prompt
Prompt *************************************
Prompt haciendo rollback para limpiar tablas
rollback;
Prompt *************************************
Prompt


Prompt
Prompt
Prompt ========================
Prompt Escenario 2:
Prompt Registro exitoso.
Prompt ========================
Prompt


insert into vuelo (vuelo_id, num_vuelo, salida, llegada, num_sala, fecha_status, avion_id,
  aero_origen_id, aero_destino_id)
  values(30, 99999, to_date('19/06/2022 20:15:00','dd/mm/yyyy hh24:mi:ss'), to_date('19/06/2022 21:15:00','dd/mm/yyyy hh24:mi:ss'),
    'AB-32',to_date('01/08/2021 00:00:00','dd/mm/yyyy hh24:mi:ss'), 8,11,13);

declare
begin
  --invocar a la función (empleado_id, vuelo_id)
  proc_asignar_tripulante(12,30);
end;
/
show errors

select * 
from tripulante_vuelo
where empleado_id=12
  and vuelo_id=30;

Prompt
Prompt
Prompt *************************************
Prompt haciendo rollback para limpiar tablas
rollback;
Prompt *************************************
Prompt



set serveroutput off



