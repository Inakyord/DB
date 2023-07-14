--@Autor:           Iñaky Ordiales Caballero
--@Fecha creación:  1/06/2022
--@Descripción:     Trigger para verificar que el pase de abordar se imprima con más de 10 min de anticipación.


create or replace trigger tr_tiempo_impresion
  after insert on pase_abordar
  for each row

declare
  v_tiempo number(8,0);
  v_fecha_salida date;

begin

  -- seleccionamos la fecha de salida
  select salida into v_fecha_salida
  from vuelo v, pasajero_vuelo pv
  where pv.pasajero_vuelo_id=:new.pasajero_vuelo_id
    and pv.vuelo_id = v.vuelo_id;

  v_tiempo := round((v_fecha_salida - :new.fecha_impresion)*24*60,0);

  dbms_output.put_line('
    Tiempo antes del vuelo: '
    ||v_tiempo||'.'||chr(10));
  
  if v_tiempo < 10 then
    raise_application_error(-20004, 'ERROR! El tiempo límite de impresión 
      de un pase de abordar es de 10 minutos antes de la salida');
  end if;

end;
/
show errors;
