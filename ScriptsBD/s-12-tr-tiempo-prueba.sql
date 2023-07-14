--@Autor:           Iñaky Ordiales Caballero
--@Fecha creación:  9/06/2022
--@Descripción:     Prueba de trigger para verificar que el pase de abordar se imprima con más de 10 min de anticipación.



set serveroutput on

Prompt Prueba de inserciones a pase de abordar por tiempo impresión.

Prompt
Prompt
Prompt =====================================
Prompt Escenario 1:
Prompt Se trata de imprimir un pase 5 minutos antes de la salida.
Prompt =====================================
Prompt 



select vuelo_id, salida as fecha_salida
from vuelo
where vuelo_id=11;

prompt insertando en pase de abordar con vuelo_id=11 y hora=13:10:00

select count(*) pases_antes
from pase_abordar;

insert into pase_abordar(pase_abordar_id, folio, fecha_impresion, pasajero_vuelo_id)
values (seq_pase_abordar.nextval, 'ABCD0009', to_date('10/06/2022 13:10:00','dd/mm/yyyy hh24:mi:ss'),
  14);

select count(*) pases_despues
from pase_abordar;

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
Prompt Se registra con éxito un pase 1 hora antes de la salida.
Prompt =====================================
Prompt 

select vuelo_id, salida as fecha_salida
from vuelo
where vuelo_id=11;

prompt insertando en pase de abordar con vuelo_id=11 y hora=12:15:00

select count(*) pases_antes
from pase_abordar;

insert into pase_abordar(pase_abordar_id, folio, fecha_impresion, pasajero_vuelo_id)
values (seq_pase_abordar.nextval, 'ABCD0009', to_date('10/06/2022 12:15:00','dd/mm/yyyy hh24:mi:ss'),
  14);

select count(*) pases_despues
from pase_abordar;

Prompt
Prompt
Prompt *************************************
Prompt haciendo rollback (necesario) para limpiar tablas
rollback;
Prompt *************************************
Prompt

set serveroutput off



