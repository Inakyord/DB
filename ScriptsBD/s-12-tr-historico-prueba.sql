--@Autor:           Iñaky Ordiales Caballero
--@Fecha creación:  9/06/2022
--@Descripción:     Prueba de trigger para ir actualizando el histórico de los vuelos.



set serveroutput on

Prompt Prueba de actualización del histórico.

Prompt
Prompt
Prompt =====================================
Prompt Escenario 1:
Prompt Se ingresa nuevo vuelo status PROGRAMADO.
Prompt =====================================
Prompt 


select count(*) historico_antes
from historico_status_vuelo;

insert into vuelo (vuelo_id, num_vuelo, salida, llegada, fecha_status, avion_id,
  aero_origen_id, aero_destino_id,status_vuelo_id)
  values(33, 99892, to_date('17/06/2022 05:00:00','dd/mm/yyyy hh24:mi:ss'), to_date('17/06/2022 08:20:00','dd/mm/yyyy hh24:mi:ss'),
    to_date('17/06/2022 09:40:00', 'dd/mm/yyyy hh24:mi:ss'),11,14,12,7);

select count(*) historico_despues
from historico_status_vuelo;

Prompt
Prompt
Prompt =====================================
Prompt Escenario 2:
Prompt Se actualiza status a ABORDANDO.
Prompt =====================================
Prompt 


select count(*) historico_antes
from historico_status_vuelo;

update vuelo
set fecha_status=sysdate,
  status_vuelo_id=8
where vuelo_id=33;

select count(*) historico_despues
from historico_status_vuelo;


Prompt
Prompt
Prompt *************************************
Prompt haciendo rollback necesario para limpiar tablas
rollback;
Prompt *************************************
Prompt



Prompt
Prompt
Prompt =====================================
Prompt Escenario 3:
Prompt Se ingresa nuevo vuelo status CANCELADO.
Prompt =====================================
Prompt 


select count(*) historico_antes
from historico_status_vuelo;

insert into vuelo (vuelo_id, num_vuelo, salida, llegada, fecha_status, avion_id,
  aero_origen_id, aero_destino_id,status_vuelo_id)
  values(33, 99892, to_date('17/06/2022 05:00:00','dd/mm/yyyy hh24:mi:ss'), to_date('17/06/2022 08:20:00','dd/mm/yyyy hh24:mi:ss'),
    to_date('17/06/2022 09:40:00', 'dd/mm/yyyy hh24:mi:ss'),11,14,12,11);

select count(*) historico_despues
from historico_status_vuelo;


Prompt
Prompt
Prompt *************************************
Prompt haciendo rollback (no necesario) para limpiar tablas
rollback;
Prompt *************************************
Prompt


set serveroutput off



