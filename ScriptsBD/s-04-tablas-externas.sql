--@Autor:           Iñaky Ordiales Caballero
--@Fecha creación:  1/06/2022
--@Descripción:     Creación tabla externa de aviones prospectos de compra


-- Tabla externa de prospectos de aviones para comprar y añadir a la flota

prompt 
prompt Conectando como sys ...
prompt 
connect sys/ as sysdba

prompt 
prompt Creando directorio tmp_dir_avion
prompt 

create or replace directory tmp_dir_avion as '/tmp/avion';

grant read, write on directory tmp_dir_avion to or_proy_admin;

prompt 
prompt Conectando con el usuario administrador
prompt 
connect or_proy_admin

prompt 
prompt Creando tabla externa
prompt 

create table avion_ext (
  matricula          varchar2(10),
  modelo             varchar2(50),
  cap_ordinarios     number(3,0),
  cap_vip            number(3,0),
  cap_discapacitados number(3,0),
  num_bodegas        number(3,0),
  profundidad        number(4,2),
  alto               number(4,2),
  ancho              number(4,2),
  cap_carga          number(5,2)
)
organization external (
  type oracle_loader
  default directory tmp_dir_avion
  access parameters (
    records delimited by newline
    badfile tmp_dir_avion:'avion_ext_bad.log'
    logfile tmp_dir_avion:'avion_ext.log'
    fields terminated by ','
    lrtrim
    missing field values are null
    (
      matricula, modelo, cap_ordinarios, cap_vip,
      cap_discapacitados, num_bodegas, profundidad,
      alto, ancho, cap_carga
    )
  )
  location ('avion_ext.csv')
)
reject limit unlimited;


prompt Cambiando permisos del directorio "tmp/avion"
!chmod 777 /tmp/avion

prompt
prompt Mostrando los datos
prompt

select * from avion_ext;


