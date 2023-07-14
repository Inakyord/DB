--@Autor:           Iñaky Ordiales Caballero
--@Fecha creación:  9/06/2022
--@Descripción:     Prueba de procedimiento para la carga del pdf de especificaciones de los aviones


set serveroutput on

Prompt Prueba de pagos.

Prompt
Prompt
Prompt ========================
Prompt Escenario 1:
Prompt Agregar pdf a 1 solo avion.
Prompt ========================
Prompt agregando pdf del avion con id = 7
Prompt

select avion_id, dbms_lob.getlength(pdf_specs) as longitud_archivo_antes
from avion
where avion_id between 7 and 7;

declare
begin
  --invocar a la función
  proc_actualiza_specs_avion(7,7);
end;
/
show errors

select avion_id, dbms_lob.getlength(pdf_specs) as longitud_archivo_despues
from avion
where avion_id between 7 and 7;

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
Prompt Agregar pdf a 11 aviones.
Prompt ========================
Prompt agregando pdf de los aviones con id: [7-17]
prompt

select avion_id, dbms_lob.getlength(pdf_specs) as longitud_archivo_antes
from avion
where avion_id between 7 and 17;

declare
begin
  --invocar a la función
  proc_actualiza_specs_avion(7,17);
end;
/
show errors

select avion_id, dbms_lob.getlength(pdf_specs) as longitud_archivo_despues
from avion
where avion_id between 7 and 17;

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
Prompt Agregar pdf a aviones fuera del rango.
Prompt ========================
Prompt agregando pdf del avion con id: 50
Prompt

declare
begin
  --invocar a la función
  proc_actualiza_specs_avion(50,50);
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