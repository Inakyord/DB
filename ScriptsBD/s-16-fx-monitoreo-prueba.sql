--@Autor:           Iñaky Ordiales Caballero
--@Fecha creación:  9/06/2022
--@Descripción:     Prueba de función para obtener el status de un vuelo


set serveroutput on

Prompt
Prompt
Prompt =====================================
Prompt Escenario 1:
Prompt Se busca vuelo sin número valido.
Prompt =====================================
Prompt 


select fx_consulta_monitoreo(1111) as informacion_vuelo_num_1111
from dual;


Prompt
Prompt
Prompt =====================================
Prompt Escenario 2:
Prompt Se busca vuelo con num=12345
Prompt =====================================
Prompt 


select fx_consulta_monitoreo(12345) as informacion_vuelo_num_12345
from dual;


Prompt
Prompt
Prompt =====================================
Prompt Escenario 3:
Prompt Se busca vuelo con num=67892
Prompt =====================================
Prompt 


select fx_consulta_monitoreo(67892) as informacion_vuelo_num_67892
from dual;


set serveroutput off