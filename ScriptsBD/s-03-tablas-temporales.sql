--@Autor:           Iñaky Ordiales Caballero
--@Fecha creación:  1/06/2022
--@Descripción:     Tabla temporal para la desnormalización


prompt 
prompt 
prompt Creando tablas temporales
prompt 

prompt 
prompt Tabla temporal global datos avion:
prompt 
-- Tabla para saber datos de un avion con sus características completas
create global temporary table datos_avion_temp (
  avion_id           number(4,0),
  matricula          varchar2(10),
  modelo             varchar2(50),
  cap_ordinarios     number(3,0),
  cap_vip            number(3,0),
  cap_discapacitados number(3,0),
  cap_total          number(3,0),
  num_bodegas        number(3,0),
  cap_carga          number(5,2),
  carga_bodega       number(5,2),
  aero_resguardo     varchar2(50)
) on commit delete rows;


prompt 
prompt Tabla temporal privada datos vuelo:
prompt 
-- Tabla para añadir a favoritos 
create private temporary table ora$ptt_calculo_maletas_paquetes_vuelo (
  vuelo_id            number(8,0),
  aero_origen_nombre  varchar2(50),
  aero_destino_nombre varchar2(50),
  num_maletas         number(4,0),
  num_paquetes        number(5,0)
) on commit preserve definition;



