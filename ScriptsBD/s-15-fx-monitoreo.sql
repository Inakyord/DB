--@Autor:           Iñaky Ordiales Caballero
--@Fecha creación:  7/06/2022
--@Descripción:     Función para obtener el status de un vuelo



create or replace function fx_consulta_monitoreo (
  p_num_vuelo number
) return varchar2 is

  v_vuelo_id number(8,0);
  v_cuenta number(1,0);
  v_cuenta_monitor number(4,0);
  v_nombre_status varchar2(40);
  v_fecha_status date;
  v_longitud number(11,8);
  v_latitud number(10,8);

  v_str varchar2(4000);

begin

  select count(*) into v_cuenta
  from vuelo
  where num_vuelo = p_num_vuelo;

  if v_cuenta = 0 then
    v_str := 'No existe ningún vuelo que coincida con el número de vuelo: '||p_num_vuelo;
    return v_str;
  end if;

  select vuelo_id into v_vuelo_id
  from (
    select vuelo_id
    from vuelo where num_vuelo = p_num_vuelo
    order by fecha_status desc
    )
  where rownum=1;

  select st.nombre, v.fecha_status into v_nombre_status, v_fecha_status
  from vuelo v, status_vuelo st
  where v.vuelo_id=v_vuelo_id
    and v.status_vuelo_id = st.status_vuelo_id;

  v_str := 'Para el vuelo número '||p_num_vuelo;
  v_str := v_str||' Su estatus es: '||v_nombre_status;
  v_str := v_str||' con fecha: '||v_fecha_status;

  select count(*) into v_cuenta_monitor
  from monitoreo
  where vuelo_id=v_vuelo_id;

  if v_cuenta_monitor = 0 then
    v_str := v_str||' No hay datos de ubicación.';
    return v_str;
  end if;


  select latitud, longitud into v_latitud, v_longitud
  from monitoreo
  where vuelo_id=v_vuelo_id
    and num_registro = (
      select max(num_registro)
      from monitoreo
      where vuelo_id=v_vuelo_id);
  
  v_str := v_str||' Última ubicación: longitud = '||v_longitud||' , latitud = '||v_latitud||' .';

  return v_str;

end;
/
show errors


-- su estatus es con fecha