--@Autor:           Iñaky Ordiales Caballero
--@Fecha creación:  1/06/2022
--@Descripción:     Creación de las secuencias necesarias en el modelo

--my_sequence.nextval
--my_sequence.currval

create sequence SEQ_PASAJERO
  start with 7
  increment by 1
  nocycle
  cache 3
  order
;


create sequence SEQ_PASAJERO_VUELO
  start with 7
  increment by 1
  nocycle
  cache 5
  order
;


create sequence SEQ_PASE_ABORDAR
  start with 7
  increment by 1
  nocycle
  cache 5
  order
;



create sequence SEQ_MALETA
  start with 7
  increment by 1
  nocycle
  cache 5
  order
;



create sequence SEQ_PUESTO_EMPLEADO
  start with 7
  increment by 1
  nocycle
  nocache
  order
;



create sequence SEQ_EMPLEADO
  start with 7
  increment by 1
  nocycle
  cache 5
  order
;



create sequence SEQ_URL_TRAYECTORIA
  start with 7
  increment by 1
  nocycle
  nocache
  order
;



create sequence SEQ_TRIPULANTE_VUELO
  start with 7
  increment by 1
  nocycle
  cache 5
  order
;



create sequence SEQ_VUELO
  start with 7
  increment by 1
  nocycle
  cache 5
  order
;



create sequence SEQ_STATUS_VUELO
  start with 7
  increment by 1
  nocycle
  nocache
  order
;



create sequence SEQ_HISTORICO_STATUS_VUELO
  start with 7
  increment by 1
  nocycle
  cache 5
  order
;



create sequence SEQ_TIPO_PAQUETE
  start with 7
  increment by 1
  nocycle
  nocache
  order
;



create sequence SEQ_PAQUETE
  start with 7
  increment by 1
  nocycle
  cache 5
  order
;



create sequence SEQ_AVION
  start with 7
  increment by 1
  nocycle
  cache 3
  order
;



create sequence SEQ_AEROPUERTO
  start with 7
  increment by 1
  nocycle
  cache 5
  order
;



