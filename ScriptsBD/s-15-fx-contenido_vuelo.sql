--@Autor:           Iñaky Ordiales Caballero
--@Fecha creación:  7/06/2022
--@Descripción:     Función para obtener el contenido de un vuelo



create or replace function fx_contenido_vuelo (
  p_vuelo_id number
) return varchar2 is

  v_cuenta number(3,0);
  v_pasajeros number(3,0);
  v_paquetes number(3,0);
  v_peso number(5,2);

  v_str varchar2(4000);

begin

  select count(*) into v_cuenta
  from vuelo
  where vuelo_id = p_vuelo_id;

  if v_cuenta = 0 then
    v_str := 'No existe ningún vuelo que coincida con el identificador de vuelo: '||p_vuelo_id;
    return v_str;
  end if;

  select count(*) into v_pasajeros
  from pasajero_vuelo
  where vuelo_id = p_vuelo_id
    and abordo = '1';

  select count(*), sum(peso) into v_paquetes, v_peso
  from paquete
  where vuelo_id = p_vuelo_id;

  v_str := 'El vuelo con identificador: '
    ||p_vuelo_id
    ||' . Tiene '
    ||v_pasajeros
    ||' pasajeros a bordo y '
    ||v_paquetes
    ||' paquetes. El peso de los paquetes es: '
    ||v_peso
    ||' .';

  return v_str;

end;
/
show errors
