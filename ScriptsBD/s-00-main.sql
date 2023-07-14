--@Autor:           Iñaky Ordiales Caballero
--@Fecha creación:  1/06/2022
--@Descripción:     Archivo desde donde se crea el modelo "Air Flights"

prompt 
prompt ===================================================================
prompt
prompt PROYECTO FINAL
prompt
prompt Modelo: "AIR FLIGHTS"
prompt
prompt ===================================================================
prompt 
prompt Creación de los objetos del modelo:
prompt usuarios, tablas, secuencias, índices, sinónimos, vistas, etc...
prompt
prompt ===================================================================
prompt

set linesize window

prompt
prompt
prompt *******************************************************************
prompt 1. USUARIOS
prompt
prompt Conectando con el usuario sys ...

connect sys/ as sysdba

-- Creación de roles y usuarios
@s-01-usuarios.sql

prompt 
prompt Desconectando usuario sys
prompt 

prompt
prompt
prompt *******************************************************************
prompt 2. ENTIDADES
prompt 
prompt Conectando con el usuario administrador
prompt

connect or_proy_admin/

-- Creación de entidades (tablas)
@s-02-entidades.sql


prompt
prompt 
prompt *******************************************************************
prompt 3. TABLAS TEMPORALES
prompt 
prompt

@s-03-tablas-temporales.sql


prompt
prompt 
prompt *******************************************************************
prompt 4. TABLAS EXTERNAS
prompt 
prompt

col MODELO format a24
@s-04-tablas-externas.sql


prompt
prompt 
prompt *******************************************************************
prompt 5. SECUENCIAS
prompt 
prompt

@s-05-secuencias.sql


prompt
prompt 
prompt *******************************************************************
prompt 6. ÍNDICES
prompt 
prompt

@s-06-indices.sql


prompt
prompt 
prompt *******************************************************************
prompt 7. SINÓNIMOS
prompt 
prompt

@s-07-sinonimos.sql


prompt
prompt 
prompt *******************************************************************
prompt 8. VISTAS
prompt 
prompt

@s-08-vistas.sql


prompt
prompt 
prompt *******************************************************************
prompt 9. CARGA INICIAL DE DATOS
prompt 
prompt

@s-09-carga-inicial.sql


prompt
prompt 
prompt *******************************************************************
prompt 10. CONSULTAS
prompt 
prompt

--Formato de columnas
alter session set nls_date_format = 'DD-MM-YYYY hh24:mi:ss';
set linesize window
col NOMBRE format a30
col AP_PATERNO format a15
col EMAIL format a25
col CLAVE format a7
col DESCRIPCION format a40
col FOTO format a5
col URL format a40
col ASIENTO format a7
col ATENCION_ESPECIAL format a35
col ABORDO format a6
col INDICACIONES format a40
col CONVENIO format a8
col PDF_SPECS format a10
col ES_CARGA format a8
col ES_COMERCIAL format a12
col MODELO format a24
col NUM_SALA format a9
col FOLIO format 999999999999999999
col STATUS format a18
col APELLIDO_PATERNO format a15
col CLAVE_PUESTO format a12
col PUESTO format a20

@s-10-consultas.sql


prompt
prompt 
prompt *******************************************************************
prompt 11. TRIGGERS
prompt 
prompt

@s-11-tr-convenio.sql
@s-11-tr-tiempo.sql
@s-11-tr-historico.sql

prompt 
prompt Triggers compilados con éxito.


prompt
prompt 
prompt *******************************************************************
prompt 13. PROCEDIMIENTOS
prompt 
prompt

@s-13-p-actualiza_foto.sql
@s-13-p-actualiza_specs.sql
@s-13-p-asignar_tripulante.sql

prompt 
prompt Procedimientos compilados con éxito.

prompt
prompt 
prompt *******************************************************************
prompt 15. FUNCIONES
prompt 
prompt

@s-15-fx-monitoreo.sql
@s-15-fx-contenido_vuelo.sql
@s-15-fx-identificador_vuelo.sql

prompt 
prompt Funciones compiladas con éxito.

prompt
prompt 
prompt *******************************************************************
prompt 17. LARGE OBJECT   ,    19. CURSORES
prompt 
prompt

prompt El manejo de large object ya está con anterioridad en los procedimientos.
prompt El uso de cursores fue incluido con anterioridad en los procedimientos.


prompt
prompt
prompt 
prompt ===================================================================
prompt
prompt PROYECTO FINAL
prompt
prompt Modelo: "AIR FLIGHTS"
prompt
prompt ===================================================================
prompt 
prompt
prompt

alter session set nls_date_format = 'DD-MM-YYYY hh24:mi:ss';
set linesize window
col NOMBRE format a30
col AP_PATERNO format a15
col EMAIL format a25
col CLAVE format a7
col DESCRIPCION format a40
col FOTO format a5
col URL format a40
col ASIENTO format a7
col ATENCION_ESPECIAL format a35
col ABORDO format a6
col INDICACIONES format a40
col CONVENIO format a8
col PDF_SPECS format a10
col ES_CARGA format a8
col ES_COMERCIAL format a12
col MODELO format a24
col NUM_SALA format a9
col FOLIO format 999999999999999999
col STATUS format a18
col APELLIDO_PATERNO format a15
col CLAVE_PUESTO format a12
col PUESTO format a20

