--@Autor:           Iñaky Ordiales Caballero
--@Fecha creación:  7/06/2022
--@Descripción:     Función para obtener los identificadores de un vuelo con un número específico.



create or replace type numeros_varray
  as varray(10) of number;
/

create or replace function fx_identificador_vuelo (
  p_num_vuelo number
) return numeros_varray pipelined is

  v_ids_vuelos numeros_varray;
  v_cuenta number(3,0);
  v_aux number(3,0);

  cursor cur_numeros is
    select vuelo_id
    from vuelo
    where num_vuelo=p_num_vuelo;

begin
  
  select count(*) into v_cuenta
  from vuelo
  where num_vuelo=p_num_vuelo;

  v_ids_vuelos := numeros_varray(0,0,0,0,0,0,0,0,0,0);

  v_aux := 1;

  for r in cur_numeros loop
    v_ids_vuelos(v_aux) := r.vuelo_id;
    v_aux := v_aux +1;
  end loop;

  for i in 1 .. v_ids_vuelos.last loop
    pipe row(v_ids_vuelos(i));
  end loop;
  return;
end;
/
show errors

