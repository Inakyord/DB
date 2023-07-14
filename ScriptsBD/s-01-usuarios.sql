--@Autor:           Iñaky Ordiales Caballero
--@Fecha creación:  27/05/2022
--@Descripción:     Creación de usuarios del modelo de Air Flight (Proyecto Final)


prompt 
prompt Creación de usuarios y roles ...
prompt 

-- permite la salida de mensajes a consola empleando dbms_output.put_line
set serveroutput on

prompt
Prompt Checando existencia y posble eliminación de roles ...
prompt

-- este bloque anónimo valida la existencia del rol, si existe lo elimina.
declare
  v_count number(1,0);
begin
  select count(*) into v_count
  from dba_roles
  where role = 'ROL_INVITADO';
  if v_count > 0 then
    dbms_output.put_line('Eliminando rol invitado existente');
    execute immediate 'drop role ROL_INVITADO';
  end if;
end;
/

create role rol_invitado;
grant create session, create synonym
to rol_invitado;








-- este bloque anónimo valida la existencia del rol, si existe lo elimina.
declare
  v_count number(1,0);
begin
  select count(*) into v_count
  from dba_roles
  where role = 'ROL_ADMIN';
  if v_count > 0 then
    dbms_output.put_line('Eliminando rol admin existente');
    execute immediate 'drop role ROL_ADMIN';
  end if;
end;
/

create role rol_admin;
grant create session, create table, create sequence, create synonym, 
  create public synonym, create view, create procedure, create trigger,
  create type
to rol_admin; 










prompt
Prompt Checando existencia usuario invitado y posible eliminación ...
prompt

-- este bloque anónimo valida la existencia del usuario, si existe lo elimina.
declare
  v_count number(1,0);
begin
  select count(*) into v_count
  from dba_users
  where username = 'OR_PROY_INVITADO';
  if v_count > 0 then
    dbms_output.put_line('Eliminando usuario invitado existente');
    execute immediate 'drop user OR_PROY_INVITADO cascade';
  end if;
end;
/

prompt 
Prompt Creando usuario: or_proy_invitado
prompt 

-- creación del usuario
create user or_proy_invitado identified by invitado quota unlimited on users;

prompt 
Prompt Checando existencia usuario admin y posible eliminación ...
prompt 

-- este bloque anónimo valida la existencia del usuario, si existe lo elimina.
declare
  v_count number(1,0);
begin
  select count(*) into v_count
  from dba_users
  where username = 'OR_PROY_ADMIN';
  if v_count > 0 then
    dbms_output.put_line('Eliminando usuario admin existente');
    execute immediate 'drop user OR_PROY_ADMIN cascade';
  end if;
end;
/

prompt
Prompt Creando usuario: or_proy_admin
prompt

-- creación del usuario
create user or_proy_admin identified by inaky quota unlimited on users;

prompt 
Prompt Asignando los roles a los usuarios.
prompt

grant rol_admin to or_proy_admin;
grant rol_invitado to or_proy_invitado;

prompt
prompt 
Prompt Listo! Usuarios y roles creados 
prompt

set serveroutput off