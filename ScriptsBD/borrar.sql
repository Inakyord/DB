--@Autor:           Iñaky Ordiales Caballero
--@Fecha creación:  1/06/2022
--@Descripción:     Borra todos los datos del modelo hasta el momento.


Prompt Conectando con usuario sys para borrar usuarios -> todo el modelo ...

connect sys/ as sysdba

drop user or_proy_invitado cascade;
drop user or_proy_admin cascade;

drop role rol_invitado;
drop role rol_admin;

disconnect