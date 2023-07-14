--@Autor:           Iñaky Ordiales Caballero
--@Fecha creación:  7/06/2022
--@Descripción:     Procedimiento para la carga del pdf de especificaciones de los aviones


prompt 
prompt Creando directoy object /tmp/avion/specs
prompt 
prompt Conectando con usuario sys ...

connect sys/ as sysdba

create or replace directory specs_dir as '/tmp/avion/specs';

grant read on directory specs_dir to or_proy_admin;

prompt 
prompt Conectando con administrador ...
prompt 

connect or_proy_admin

prompt 


create or replace procedure proc_actualiza_specs_avion(
  p_avion_id_inicial number,
  p_avion_id_final number
) is

cursor cur_fotos is 
  select avion_id
  from avion
  where avion_id between p_avion_id_inicial and p_avion_id_final;

v_bfile bfile;
v_specs blob;
v_length_archivo number;
v_length_blob number;
v_dest_offset number;
v_src_offset number;
v_cuenta number;

begin

  if (p_avion_id_inicial > p_avion_id_final) then
    raise_application_error(-20008, 'Error! El id inicial no puede ser mayor al final.'
      ||' ID inicial: '
      || p_avion_id_inicial
      ||'. ID final: '
      || p_avion_id_final);
  end if;

  select count(*) into v_cuenta
  from avion
  where avion_id=p_avion_id_final;

  if (v_cuenta = 0) then
    raise_application_error(-20011, 'Error! El id final no coincide con ningun avion.'
      ||' ID inicial: '
      || p_avion_id_inicial
      ||'. ID final: '
      || p_avion_id_final);
  end if;


  dbms_output.put_line('Leyendo imágenes.');

  for r in cur_fotos loop
    dbms_output.put_line('Procesando imagen para avion id: '||r.avion_id);
    -- abriendo archivo
    v_bfile := bfilename('SPECS_DIR', 'avion-'||r.avion_id||'.pdf');

    if dbms_lob.fileexists(v_bfile) <> 1 then
      dbms_output.put_line('No se encontró el archivo: avion-'||r.avion_id||'.pdf');
      continue;
    end if;
    
    dbms_lob.fileopen(v_bfile, dbms_lob.lob_readonly);
    if dbms_lob.isopen(v_bfile) <> 1 then
      dbms_output.put_line('No se pudo abrir el archivo: avion-'||r.avion_id||'.pdf');
      continue;
    end if;

    v_length_archivo := dbms_lob.getlength(v_bfile);
    
    -- obteniendo referencia (puntero) de la columna pdf en modo exclusivo
    select pdf_specs into v_specs
    from avion
    where avion_id=r.avion_id
    for update;
    
    v_src_offset := 1;
    v_dest_offset := 1;
    
    -- cargando la pdf en un solo paso
    dbms_lob.loadblobfromfile(
      dest_lob    =>  v_specs,
      src_bfile   =>  v_bfile,
      amount      =>  v_length_archivo,
      src_offset  =>  v_src_offset,
      dest_offset =>  v_dest_offset
    );

    dbms_output.put_line('Dest_offset = '||v_dest_offset);
    dbms_output.put_line('Tamaño pdf = '||v_length_archivo);

    -- no olvidar cerrar el archivo !!!
    dbms_lob.close(v_bfile);

    v_length_blob := dbms_lob.getlength(v_specs);

    if v_length_archivo <> v_length_blob then
      raise_application_error(-20009, 
        'Error: El pdf no se cargó completamente, se esperaba: '
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

