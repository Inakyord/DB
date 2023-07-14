--@Autor:           Iñaky Ordiales Caballero
--@Fecha creación:  9/06/2022
--@Descripción:     Prueba de función para obtener el contenido de un vuelo


set serveroutput on

Prompt
Prompt
Prompt =====================================
Prompt Escenario 1:
Prompt Se busca vuelo sin identificador valido.
Prompt =====================================
Prompt 


select fx_contenido_vuelo(50) as informacion_vuelo_50
from dual;


Prompt
Prompt
Prompt =====================================
Prompt Escenario 2:
Prompt Se busca vuelo con id=12
Prompt =====================================
Prompt 


select fx_contenido_vuelo(12) as informacion_vuelo_12
from dual;


Prompt
Prompt
Prompt =====================================
Prompt Escenario 3:
Prompt Se busca vuelo con id=8
Prompt =====================================
Prompt 


select fx_contenido_vuelo(8) as informacion_vuelo_8
from dual;


set serveroutput off
