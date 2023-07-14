--@Autor:           Iñaky Ordiales Caballero
--@Fecha creación:  9/06/2022
--@Descripción:     Prueba de función para obtener los identificadores de un vuelo con un número específico.


set serveroutput on

Prompt
Prompt
Prompt =====================================
Prompt Escenario 1:
Prompt Se busca vuelo sin numero valido.
Prompt =====================================
Prompt 


select fx_identificador_vuelo(11111) as id_vuelo_num_11111
from dual;


Prompt
Prompt
Prompt =====================================
Prompt Escenario 2:
Prompt Se busca vuelo con num=25252
Prompt =====================================
Prompt 


select fx_identificador_vuelo(25252) as id_vuelo_num_25252
from dual;


Prompt
Prompt
Prompt =====================================
Prompt Escenario 3:
Prompt Se busca vuelo con num=12345
Prompt =====================================
Prompt 


select fx_identificador_vuelo(12345) as id_vuelo_num_12345
from dual;


set serveroutput off


