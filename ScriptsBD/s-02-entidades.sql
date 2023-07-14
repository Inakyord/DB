--@Autor:           Iñaky Ordiales Caballero
--@Fecha creación:  14/05/2022
--@Descripción:     Creación de tablas del modelo de Air Flight (Proyecto Final)

prompt 
prompt 
prompt Empezando a crear tablas del modelo.
prompt 


create table AVION (
  avion_id     number(4,0)  not null constraint avion_pk primary key,
  matricula    varchar2(10) not null,
  modelo       varchar2(50) not null,
  pdf_specs    blob         default empty_blob() not null,
  es_comercial char(1)      not null,
  es_carga     char(1)      not null,
  constraint avion_matriculo_uk unique (matricula),
  constraint avion_tipo_vuelo_chk check (
    (es_comercial = 1) or (es_carga = 1))
);


create table COMERCIAL (
  avion_id            number(4,0) not null constraint comercial_pk primary key,
  cap_ordinarios      number(3,0) not null,
  cap_vip             number(3,0) not null,
  cap_discapacitados  number(3,0) default 0 not null,
  cap_total           generated always as (cap_ordinarios+cap_vip+cap_discapacitados) virtual,
  constraint comercial_avion_id_fk foreign key (avion_id)
    references avion(avion_id),
  constraint comercial_capacidad_total_chk check (
    cap_ordinarios + cap_vip + cap_discapacitados >= 30)
);


create table AEROPUERTO (
  aeropuerto_id  number(5,0)  not null constraint aeropuerto_pk primary key,
  clave          char(13)     not null,
  nombre         varchar2(50) not null,
  latitud        number(10,8) not null,
  longitud       number(11,8) not null,
  convenio char(1)      default '0' not null,
  constraint aeropuerto_clave_uk unique (clave),
  constraint aeropuerto_latitud_chk check (
    latitud between -90 and 90 ),
  constraint aeropuerto_longitud_chk check (
    longitud between -180 and 180)
);


-- carga en toneladas
create table CARGA (
  avion_id          number(4,0) not null constraint carga_pk primary key,
  num_bodegas       number(3,0) not null,
  cap_carga         number(5,2) not null,
  profundidad       number(4,2) not null,
  alto              number(4,2) not null,
  ancho             number(4,2) not null,
  carga_bodega      generated always as (cap_carga / num_bodegas) virtual,
  aero_resguardo_id number(5,0) not null,
  constraint carga_avion_id_fk foreign key (avion_id)
    references avion(avion_id),
  constraint carga_aero_resguardo_id_fk foreign key (aero_resguardo_id)
    references aeropuerto(aeropuerto_id),
  constraint carga_cap_carga_chk check (
    cap_carga >= 1)
);


create table STATUS_VUELO (
  status_vuelo_id number(2,0)   not null constraint status_pk primary key,
  clave           varchar2(40)  not null,
  nombre          varchar2(40)  not null,
  descripcion     varchar2(300) not null,
  constraint status_vuelo_clave_uk unique (clave)
);


create table VUELO (
  vuelo_id        number(8,0) not null constraint vuelo_pk primary key,
  num_vuelo       number(5,0) not null,
  salida          date        not null,
  llegada         date        not null,
  num_sala        varchar2(5),
  fecha_status    date        default sysdate not null,
  tiempo_vuelo    number(4,0) generated always as ((llegada - salida)*24*60) virtual,
  avion_id        number(4,0) not null,
  aero_origen_id  number(5,0) not null,
  aero_destino_id number(5,0) not null,
  status_vuelo_id number(2,0) default 7 not null,
  constraint vuelo_avion_id_fk foreign key (avion_id)
    references avion(avion_id),
  constraint vuelo_aero_origen_id_fk foreign key (aero_origen_id)
    references aeropuerto(aeropuerto_id),
  constraint vuelo_aero_destino_id_fk foreign key (aero_destino_id)
    references aeropuerto(aeropuerto_id),
  constraint vuelo_status_vuelo_id_fk foreign key (status_vuelo_id)
    references status_vuelo(status_vuelo_id),
  constraint vuelo_fechas_diferentes_chk check (
    llegada > salida),
  constraint vuelo_aeropuertos_diferentes_chk check (
    aero_origen_id <> aero_destino_id)
);


create table HISTORICO_STATUS_VUELO (
  historico_status_vuelo_id number(10,0) not null constraint historico_status_pk primary key,
  fecha                     date         default sysdate not null,
  status_vuelo_id           number(2,0)  not null,
  vuelo_id                  number(8,0)  not null,
  constraint historico_status_vuelo_status_vuelo_id_fk foreign key (status_vuelo_id)
    references status_vuelo(status_vuelo_id),
  constraint historico_status_vuelo_vuelo_id_fk foreign key (vuelo_id)
    references vuelo(vuelo_id)
);


create table PUESTO_EMPLEADO (
  puesto_empleado_id number(2,0)   not null constraint puesto_empleado_pk primary key,
  clave              varchar2(40)  not null,
  nombre             varchar2(40)  not null,
  descripcion        varchar2(300) not null,
  sueldo_mensual     number(9,2)   not null,
  constraint puesto_empleado_clave_uk unique (clave),
  constraint puesto_empleado_sueldo_mensual_chk check (
    sueldo_mensual >= 5255 )
);


create table EMPLEADO (
  empleado_id        number(6,0)  not null constraint empleado_pk primary key,
  rfc                char(13)     not null,
  curp               char(18)     not null,
  nombre             varchar2(40) not null,
  ap_paterno         varchar2(40) not null,
  ap_materno         varchar2(40) not null,
  foto               blob         default empty_blob() not null,
  puesto_empleado_id number(2,0)  not null,
  jefe_id            number(6,0),
  constraint empleado_puesto_empleado_id_fk foreign key (puesto_empleado_id)
    references puesto_empleado(puesto_empleado_id),
  constraint empleado_jefe_id_fk foreign key (jefe_id)
    references empleado(empleado_id),
  constraint empleado_rfc_uk unique (rfc),
  constraint empleado_curp_uk unique (curp),
  constraint empleado_jefe_id_chk check (
    jefe_id <> empleado_id )
);


create table URL_TRAYECTORIA_EMPLEADO (
  url_trayectoria_id number(10,0)  not null constraint url_trayectoria_pk primary key,
  url                varchar2(200) not null,
  empleado_id        number(6,0)   not null,
  constraint url_trayectoria_empleado_empleado_id_fk foreign key (empleado_id)
    references empleado(empleado_id)
);


create table TRIPULANTE_VUELO (
  tripulante_vuelo_id number(10,0) not null constraint tripulante_vuelo_pk primary key,
  puntos              number(3,0),
  empleado_id         number(6,0)  not null,
  vuelo_id            number(8,0)  not null,
  constraint tripulante_vuelo_empleado_id_fk foreign key (empleado_id)
    references empleado(empleado_id),
  constraint tripulante_vuelo_vuelo_id_fk foreign key (vuelo_id)
    references vuelo(vuelo_id),
  constraint tripulante_vuelo_puntos_chk check (
    puntos between 0 and 100)
);


create table PASAJERO (
  pasajero_id      number(9,0)  not null constraint pasajero_pk primary key,
  curp             char(18)     not null,
  nombre           varchar2(40) not null,
  ap_paterno       varchar2(40) not null,
  ap_materno       varchar2(40),
  fecha_nacimiento date         not null,
  email            varchar2(60),
  constraint pasajero_pasajero_id_uk unique (curp)
);


create table PASAJERO_VUELO (
  pasajero_vuelo_id number(10,0)   not null constraint pasajero_vuelo_pk primary key,
  asiento           varchar2(5)    not null,
  atencion_especial varchar2(2000) default '' not null,
  abordo            char(1)        default '0' not null,
  pasajero_id       number(9,0)    not null,
  vuelo_id          number(8,0)    not null,
  constraint pasajero_vuelo_pasajero_id_fk foreign key (pasajero_id)
    references pasajero(pasajero_id),
  constraint pasajero_vuelo_vuelo_id_fk foreign key (vuelo_id)
    references vuelo(vuelo_id)
);


create table PASE_ABORDAR (
  pase_abordar_id   number(10,0) not null constraint pase_de_abordar_pk primary key,
  folio             char(8)      not null,
  fecha_impresion   date         default sysdate not null,
  pasajero_vuelo_id number(10,0) not null,
  constraint pase_abordar_pasajero_vuelo_id_fk foreign key (pasajero_vuelo_id)
    references pasajero_vuelo(pasajero_vuelo_id),
  constraint pase_abordar_folio_uk unique (folio)
);


create table MALETA (
  maleta_id       number(10,0) not null constraint maleta_pk primary key,
  num_maleta      number(2,0)  not null,
  peso            number(5,2)  not null,
  pase_abordar_id number(10,0) not null,
  constraint maleta_pase_abordar_id_fk foreign key (pase_abordar_id)
    references pase_abordar(pase_abordar_id),
  constraint maleta_peso_chk check (
    peso between 1 and 100),
  constraint maleta_num_maleta_pase_abordar_id_uk 
    unique (pase_abordar_id,num_maleta)
);


create table TIPO_PAQUETE (
  tipo_paquete_id number(3,0)   not null constraint tipo_paquete_pk primary key,
  clave           varchar2(40)  not null,
  descripcion     varchar2(400) not null,
  indicaciones    varchar2(500) not null,
  constraint tipo_paquete_uk unique (clave)
);


create table PAQUETE (
  paquete_id      number(18,0) not null constraint paquete_pk primary key,
  folio           number(18,0) not null,
  peso            number(8,2)  not null,
  tipo_paquete_id number(3,0)  not null,
  vuelo_id        number(8,0)  not null,
  constraint paquete_tipo_paquete_id_fk foreign key (tipo_paquete_id)
    references tipo_paquete(tipo_paquete_id),
  constraint paquete_vuelo_id_fk foreign key (vuelo_id)
    references vuelo(vuelo_id),
  constraint paquete_folio_uk unique (folio)
);


create table MONITOREO (
  vuelo_id     number(8,0)  not null,
  num_registro number(4,0)  not null,
  fecha_exacta date         default sysdate not null,
  latitud      number(10,8) not null,
  longitud     number(11,8) not null,
  constraint monitoreo_pk primary key (vuelo_id,num_registro),
  constraint monitoreo_vuelo_id_fk foreign key (vuelo_id)
    references vuelo(vuelo_id),
  constraint aeropuerto_latitud_check check (
    latitud between -90 and 90 ),
  constraint aeropuerto_longitud_check check (
    longitud between -180 and 180)
);



prompt 
prompt Listo! Modelo creado con éxito
prompt 