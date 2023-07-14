--@Autor:           Iñaky Ordiales Caballero
--@Fecha creación:  7/06/2022
--@Descripción:     Asignar tripulante a un vuelo, checando disponibilidad


create or replace procedure proc_asignar_tripulante (
  p_empleado_id number,
  p_vuelo_id number
) is 

  v_fecha_salida date;
  v_fecha_llegada date;

  cursor cur_empleado is
    select salida, llegada
    from vuelo v, tripulante_vuelo tv
    where tv.empleado_id = p_empleado_id
      and v.vuelo_id = tv.vuelo_id;


begin

  select salida, llegada into v_fecha_salida, v_fecha_llegada
  from vuelo
  where vuelo_id = p_vuelo_id;

  for r in cur_empleado loop
    if (v_fecha_salida between r.salida and r.llegada)
      or (v_fecha_llegada between r.salida and r.llegada) then 
      dbms_output.put_line(
        'Fecha de salida: '
        ||v_fecha_salida
        ||' . Fecha de llegada: '
        ||v_fecha_llegada
        );
      dbms_output.put_line(
        'TRASLAPE = Fecha de salida: '
        ||r.salida
        ||' . Fecha de llegada: '
        ||r.llegada
        );
      raise_application_error(-20010, 'Error! Las fechas se traslapan con otro vuelo.');
    end if;
  end loop;
  
  insert into tripulante_vuelo(tripulante_vuelo_id, empleado_id, vuelo_id)
  	values(seq_tripulante_vuelo.nextval, p_empleado_id, p_vuelo_id);

end;
/
show errors