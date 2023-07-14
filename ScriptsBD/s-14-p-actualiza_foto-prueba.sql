--@Autor:           Iñaky Ordiales Caballero
--@Fecha creación:  9/06/2022
--@Descripción:     Prueba de procedimiento para la carga de fotos de empleados


set serveroutput on

Prompt Prueba de pagos.

Prompt
Prompt
Prompt ========================
Prompt Escenario 1:
Prompt Agregar imagen a 1 solo empleado.
Prompt ========================
Prompt agregando imagen del empleado con id = 7
Prompt

select empleado_id, dbms_lob.getlength(foto) as longitud_foto_antes
from empleado
where empleado_id between 7 and 7;

declare
begin
  --invocar a la función
  proc_actualiza_foto_empleado(7,7);
end;
/
show errors

select empleado_id, dbms_lob.getlength(foto) as longitud_foto_despues
from empleado
where empleado_id between 7 and 7;


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
Prompt Agregar imagen a 11 empleados.
Prompt ========================
Prompt agregando imagen de los empleados con id: [7-17]
prompt

select empleado_id, dbms_lob.getlength(foto) as longitud_foto_antes
from empleado
where empleado_id between 7 and 17;

declare
begin
  --invocar a la función
  proc_actualiza_foto_empleado(7,17);
end;
/
show errors

select empleado_id, dbms_lob.getlength(foto) as longitud_foto_despues
from empleado
where empleado_id between 7 and 17;


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
Prompt Escenario 3:
Prompt Agregar imagen a empleados fuera del rango.
Prompt ========================
Prompt agregando imagen del empleado con id: 50
Prompt

declare
begin
  --invocar a la función
  proc_actualiza_foto_empleado(50,50);
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

set serveroutput off
