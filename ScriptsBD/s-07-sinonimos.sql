--@Autor:           Iñaky Ordiales Caballero
--@Fecha creación:  1/06/2022
--@Descripción:     Creación de sinónimos del modelo



-- Sinónimos público del usuario administrador
create or replace public synonym sy_avion for avion;
create or replace public synonym sy_vuelo for vuelo;
create or replace public synonym sy_monitoreo for monitoreo;
create or replace public synonym sy_aeropuerto for aeropuerto;

-- Otorgar permiso de selección al rol invitado en sinónimos públicos
grant select on sy_avion to rol_invitado;
grant select on sy_vuelo to rol_invitado;
grant select on sy_monitoreo to rol_invitado;
grant select on sy_aeropuerto to rol_invitado;


-- Otorgar permiso de selección al usuario invitado en entidades del usuario admin
grant select on status_vuelo to or_proy_invitado;
grant select on historico_status_vuelo to or_proy_invitado;
grant select on tipo_paquete to or_proy_invitado;
grant select on puesto_empleado to or_proy_invitado;

prompt
prompt Conectando con usuario invitado ...
prompt
connect or_proy_invitado;

-- Sinónimos privados del usuario invitado
create or replace synonym status_vuelo for or_proy_admin.status_vuelo;
create or replace synonym historico_status_vuelo for or_proy_admin.historico_status_vuelo;
create or replace synonym tipo_paquete for or_proy_admin.tipo_paquete;
create or replace synonym puesto_empleado for or_proy_admin.puesto_empleado;

prompt
prompt Conectando con usuario administrador ...
prompt
connect or_proy_admin;

-- Sinónimos con el prefijo 'oc' para todas las tablas

declare
  
  cursor cur_nombres_tablas is
  select table_name as name
  from user_tables;

  v_sql varchar2(150);

begin
  for p in cur_nombres_tablas loop
    v_sql :=
      'create or replace synonym OC_'
      ||p.name
      ||' for '
      ||p.name;
    execute immediate v_sql;
  end loop;
end;
/
show errors

