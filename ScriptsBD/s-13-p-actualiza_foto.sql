--@Autor:           Iñaky Ordiales Caballero
--@Fecha creación:  7/06/2022
--@Descripción:     Procedimiento para la carga de fotos de empleados


prompt 
prompt Creando directoy object /tmp/avion/fotos
prompt 
prompt Conectando con usuario sys ...

connect sys/ as sysdba

create or replace directory fotos_dir as '/tmp/avion/fotos';

grant read on directory fotos_dir to or_proy_admin;

prompt 
prompt Conectando con administrador ...
prompt 

connect or_proy_admin

prompt 


create or replace procedure proc_actualiza_foto_empleado(
  p_empleado_id_inicial number,
  p_empleado_id_final number
) is

cursor cur_fotos is 
  select empleado_id
  from empleado
  where empleado_id between p_empleado_id_inicial and p_empleado_id_final;

v_bfile bfile;
v_foto blob;
v_length_archivo number;
v_length_blob number;
v_dest_offset number;
v_src_offset number;
v_cuenta number;

begin

  if (p_empleado_id_inicial > p_empleado_id_final) then
    raise_application_error(-20006, 'Error! El id inicial no puede ser mayor al final.'
      ||' ID inicial: '
      || p_empleado_id_inicial
      ||'. ID final: '
      || p_empleado_id_final);
  end if;

  select count(*) into v_cuenta
  from empleado
  where empleado_id=p_empleado_id_final;

  if (v_cuenta = 0) then
    raise_application_error(-20011, 'Error! El id final no coincide con ningun empleado.'
      ||' ID inicial: '
      || p_empleado_id_inicial
      ||'. ID final: '
      || p_empleado_id_final);
  end if;

  dbms_output.put_line('Leyendo imágenes.');

  for r in cur_fotos loop
    dbms_output.put_line('Procesando imagen para empleado id: '||r.empleado_id);
    -- abriendo archivo
    v_bfile := bfilename('FOTOS_DIR', 'empleado-'||r.empleado_id||'.png');

    if dbms_lob.fileexists(v_bfile) <> 1 then
      dbms_output.put_line('No se encontró el archivo: empleado-'||r.empleado_id||'.png');
      continue;
    end if;
    
    dbms_lob.fileopen(v_bfile, dbms_lob.lob_readonly);
    if dbms_lob.isopen(v_bfile) <> 1 then
      dbms_output.put_line('No se pudo abrir el archivo: empleado-'||r.empleado_id||'.png');
      continue;
    end if;

    v_length_archivo := dbms_lob.getlength(v_bfile);
    
    -- obteniendo referencia (puntero) de la columna foto en modo exclusivo
    select foto into v_foto
    from empleado
    where empleado_id=r.empleado_id
    for update;
    
    v_src_offset := 1;
    v_dest_offset := 1;
    
    -- cargando la foto en un solo paso
    dbms_lob.loadblobfromfile(
      dest_lob    =>  v_foto,
      src_bfile   =>  v_bfile,
      amount      =>  v_length_archivo,
      src_offset  =>  v_src_offset,
      dest_offset =>  v_dest_offset
    );

    dbms_output.put_line('Dest_offset = '||v_dest_offset);
    dbms_output.put_line('Tamaño foto = '||v_length_archivo);

    -- no olvidar cerrar el archivo !!!
    dbms_lob.close(v_bfile);

    v_length_blob := dbms_lob.getlength(v_foto);

    if v_length_archivo <> v_length_blob then
      raise_application_error(-20007, 
        'Error: La foto no se cargó completamente, se esperaba: '
        ||v_length_archivo
        ||' y se cargaron unicamente: '
        ||v_length_blob);
    else
      dbms_output.put_line('Carga exitosa.');
    end if;

  end loop;

end;
/
show errors

