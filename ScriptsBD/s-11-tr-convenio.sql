--@Autor:           Iñaky Ordiales Caballero
--@Fecha creación:  1/06/2022
--@Descripción:     Trigger para verificar que los aeropuertos de origen y destino tengan convenio con la aerolínea.


create or replace trigger tr_convenio_aeropuerto
  before insert or update of aero_origen_id, aero_destino_id on vuelo
  for each row
  
  declare
    v_convenio_origen char(1);
    v_convenio_destino char(1);
    v_nombre_origen varchar2(50);
    v_nombre_destino varchar2(50);

begin

  select convenio, nombre into v_convenio_origen, v_nombre_origen
  from aeropuerto where aeropuerto_id = :new.aero_origen_id;
  
  select convenio, nombre into v_convenio_destino, v_nombre_destino
  from aeropuerto where aeropuerto_id = :new.aero_destino_id;
  
  if v_convenio_origen = '0' and v_convenio_destino = '0' then
    dbms_output.put_line('
      Aeropuerto origen sin convenio: '
      ||v_nombre_origen||'.');
    dbms_output.put_line('
      Aeropuerto destino sin convenio: '
      ||v_nombre_destino||'.'||chr(10));
    raise_application_error(-20001, 'ERROR! Los aeropuertos de destino y de
      origen del vuelo no tienen convenio con la aerolínea.');

  elsif v_convenio_origen = '0' then
    dbms_output.put_line('
      Aeropuerto origen sin convenio: '
      ||v_nombre_origen||'.'||chr(10));
    raise_application_error(-20002, 'ERROR! El aeropuerto de origen 
      no tiene convenio con la aerolínea.');

  elsif v_convenio_destino = '0' then
    dbms_output.put_line('
      Aeropuerto destino sin convenio: '
      ||v_nombre_destino||'.'||chr(10));
    raise_application_error(-20003, 'ERROR! El aeropuerto de destino 
      no tiene convenio con la aerolínea.');

  end if;
end;
/
show errors





