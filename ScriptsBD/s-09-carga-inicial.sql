--@Autor:           Iñaky Ordiales Caballero
--@Fecha creación:  1/06/2022
--@Descripción:     Se agregan algunos datos iniciales para poder probar el correcto funcionamiento de la BD.



-- AEROPUERTOS X16
--7
insert into aeropuerto (aeropuerto_id, clave, nombre, latitud, longitud, convenio)
  values (seq_aeropuerto.nextval, 'CUU', 'A. I. de Chihuahua', 28.4210, -105.5750, '1');
--8
insert into aeropuerto (aeropuerto_id, clave, nombre, latitud, longitud, convenio)
  values (seq_aeropuerto.nextval, 'MTY', 'A. I. de Monterrey', 25.4642, -100.0623, '1');
--9
insert into aeropuerto (aeropuerto_id, clave, nombre, latitud, longitud, convenio)
  values (seq_aeropuerto.nextval, 'MEX', 'A. I. de la Ciudad de México', 19.2610, -99.0419, '1');
--10
insert into aeropuerto (aeropuerto_id, clave, nombre, latitud, longitud, convenio)
  values (seq_aeropuerto.nextval, 'NLU', 'A. I. de Santa Lucía', 19.4441, -99.0053, '1');
--11
insert into aeropuerto (aeropuerto_id, clave, nombre, latitud, longitud, convenio)
  values (seq_aeropuerto.nextval, 'TLC', 'A. I. de Toluca', 19.2013, -99.3357, '1');
--12
insert into aeropuerto (aeropuerto_id, clave, nombre, latitud, longitud, convenio)
  values (seq_aeropuerto.nextval, 'QRO', 'A. I. de Querétaro', 20.3720, -100.1118, '1');
--13
insert into aeropuerto (aeropuerto_id, clave, nombre, latitud, longitud, convenio)
  values (seq_aeropuerto.nextval, 'SJD', 'A. I. de Los Cabos', 23.0906, -109.4315, '1');
--14
insert into aeropuerto (aeropuerto_id, clave, nombre, latitud, longitud, convenio)
  values (seq_aeropuerto.nextval, 'TIJ', 'A. I. de Tijuana', 32.3227, -116.5812, '1');
--15
insert into aeropuerto (aeropuerto_id, clave, nombre, latitud, longitud, convenio)
  values (seq_aeropuerto.nextval, 'GDL', 'A. I. de Guadalajara', 20.3119, -103.1840, '1');
--16
insert into aeropuerto (aeropuerto_id, clave, nombre, latitud, longitud, convenio)
  values (seq_aeropuerto.nextval, 'MZT', 'A. I. de Mazatlán', 23.0941, -106.1558, '1');
--17
insert into aeropuerto (aeropuerto_id, clave, nombre, latitud, longitud, convenio)
  values (seq_aeropuerto.nextval, 'CUN', 'A. I. de Cancún', 21.0212, -86.5237, '1');
--18
insert into aeropuerto (aeropuerto_id, clave, nombre, latitud, longitud, convenio)
  values (seq_aeropuerto.nextval, 'MID', 'A. I. de Mérida', 20.5613, -89.3928, '1');
--19
insert into aeropuerto (aeropuerto_id, clave, nombre, latitud, longitud)
  values(seq_aeropuerto.nextval, 'VER', 'A. I. de Veracruz', 19.0845, -96.1114);
--20
insert into aeropuerto (aeropuerto_id, clave, nombre, latitud, longitud)
  values(seq_aeropuerto.nextval, 'MXL', 'A. I. de Mexicali', 32.3750, -115.1429);
--21
insert into aeropuerto (aeropuerto_id, clave, nombre, latitud, longitud)
  values(seq_aeropuerto.nextval, 'BJX', 'A. I. de Guanajuato', 20.5936, -101.2851);
--22
insert into aeropuerto (aeropuerto_id, clave, nombre, latitud, longitud)
  values(seq_aeropuerto.nextval, 'CJS', 'A. I. de Ciudad Juárez', 31.3810, -106.2543);



-- AVIONES X12 = COMERCIALES X4 + CARGA X4 + MIXTOS X4
--7
insert into avion (avion_id, matricula, modelo, es_comercial, es_carga)
  values(seq_avion.nextval, 'XA-AAA-09', 'Airbus 320', '1', '0');
insert into comercial (avion_id, cap_ordinarios, cap_vip, cap_discapacitados)
  values(seq_avion.currval, 120,12,3);
--8
insert into avion (avion_id, matricula, modelo, es_comercial, es_carga)
  values(seq_avion.nextval, 'XA-KCU-32', 'Boeing 747', '1', '0');
insert into comercial (avion_id, cap_ordinarios, cap_vip, cap_discapacitados)
  values(seq_avion.currval, 200,25,5);
--9
insert into avion (avion_id, matricula, modelo, es_comercial, es_carga)
  values(seq_avion.nextval, 'XC-LIE-01', 'Boeing 767', '1', '0');
insert into comercial (avion_id, cap_ordinarios, cap_vip, cap_discapacitados)
  values(seq_avion.currval, 150,20,2);
--10
insert into avion (avion_id, matricula, modelo, es_comercial, es_carga)
  values(seq_avion.nextval, 'XB-UDB-64', 'Boeing 747', '1', '0');
insert into comercial (avion_id, cap_ordinarios, cap_vip, cap_discapacitados)
  values(seq_avion.currval, 180,10,0);
--11
insert into avion (avion_id, matricula, modelo, es_comercial, es_carga)
  values(seq_avion.nextval, 'XC-WKI-03', 'Airbus 300-600 st', '0', '1');
insert into carga (avion_id, num_bodegas, cap_carga, profundidad, alto, ancho, aero_resguardo_id)
  values(seq_avion.currval, 20,205,3,2,3,10);
--12
insert into avion (avion_id, matricula, modelo, es_comercial, es_carga)
  values(seq_avion.nextval, 'XC-ZXA-01', 'Airbus 320', '0', '1');
insert into carga (avion_id, num_bodegas, cap_carga, profundidad, alto, ancho, aero_resguardo_id)
  values(seq_avion.currval, 15,180,2,2,2,10);
--13
insert into avion (avion_id, matricula, modelo, es_comercial, es_carga)
  values(seq_avion.nextval, 'XC-UIW-12', 'Airbus 340', '0', '1');
insert into carga (avion_id, num_bodegas, cap_carga, profundidad, alto, ancho, aero_resguardo_id)
  values(seq_avion.currval, 30,345,4.2,1.5,1.5,18);
--14
insert into avion (avion_id, matricula, modelo, es_comercial, es_carga)
  values(seq_avion.nextval, 'XC-SKR-55', 'Airbus 300-600 st', '0', '1');
insert into carga (avion_id, num_bodegas, cap_carga, profundidad, alto, ancho, aero_resguardo_id)
  values(seq_avion.currval, 26,321,1.8,2.1,1.5,17);
--15
insert into avion (avion_id, matricula, modelo, es_comercial, es_carga)
  values(seq_avion.nextval, 'XA-POR-94', 'Boeing 747', '1', '1');
insert into comercial (avion_id, cap_ordinarios, cap_vip, cap_discapacitados)
  values(seq_avion.currval, 100,6,2);
insert into carga (avion_id, num_bodegas, cap_carga, profundidad, alto, ancho, aero_resguardo_id)
  values(seq_avion.currval, 15,100,1,1.5,2,10);
--16
insert into avion (avion_id, matricula, modelo, es_comercial, es_carga)
  values(seq_avion.nextval, 'XA-EYU-36', 'ANTONOV 225 MRIYA', '1', '1');
insert into comercial (avion_id, cap_ordinarios, cap_vip, cap_discapacitados)
  values(seq_avion.currval, 70,6,0);
insert into carga (avion_id, num_bodegas, cap_carga, profundidad, alto, ancho, aero_resguardo_id)
  values(seq_avion.currval, 40,500,3,3,3,16);
--17
insert into avion (avion_id, matricula, modelo, es_comercial, es_carga)
  values(seq_avion.nextval, 'XB-IOC-11', 'Boeing 767', '1', '1');
insert into comercial (avion_id, cap_ordinarios, cap_vip, cap_discapacitados)
  values(seq_avion.currval, 50,6,4);
insert into carga (avion_id, num_bodegas, cap_carga, profundidad, alto, ancho, aero_resguardo_id)
  values(seq_avion.currval, 22,140,2,4,2,10);
--18
insert into avion (avion_id, matricula, modelo, es_comercial, es_carga)
  values(seq_avion.nextval, 'XA-LLL-87', 'Airbus 340', '1', '1');
insert into comercial (avion_id, cap_ordinarios, cap_vip, cap_discapacitados)
  values(seq_avion.currval, 210,25,8);
insert into carga (avion_id, num_bodegas, cap_carga, profundidad, alto, ancho, aero_resguardo_id)
  values(seq_avion.currval, 5,30.5,2,2,1.5,10);




-- STATUS VUELO X5
--7
insert into status_vuelo (status_vuelo_id, clave, nombre, descripcion)
  values(seq_status_vuelo.nextval, 'PR', 'PROGRAMADO', 'El vuelo está programado para salir.');
--8
insert into status_vuelo (status_vuelo_id, clave, nombre, descripcion)
  values(seq_status_vuelo.nextval, 'AB', 'ABORDANDO', 'El vuelo está abordando a los pasajeros.');
--9
insert into status_vuelo (status_vuelo_id, clave, nombre, descripcion)
  values(seq_status_vuelo.nextval, 'T', 'A TIEMPO', 'El vuelo está a tiempo en el viaje.');
--10
insert into status_vuelo (status_vuelo_id, clave, nombre, descripcion)
  values(seq_status_vuelo.nextval, 'D', 'DEMORADO', 'El vuelo está demorado por algún inconveniente.');
--11
insert into status_vuelo (status_vuelo_id, clave, nombre, descripcion)
  values(seq_status_vuelo.nextval, 'C', 'CANCELADO', 'El vuelo fue cancelado.');
--12
insert into status_vuelo (status_vuelo_id, clave, nombre, descripcion)
  values(seq_status_vuelo.nextval, 'F', 'FINALIZADO', 'El vuelo ya pasó con éxtio.');


-- VUELO X6
--7
insert into vuelo (vuelo_id, num_vuelo, salida, llegada, fecha_status, avion_id,
  aero_origen_id, aero_destino_id,status_vuelo_id)
  values(seq_vuelo.nextval, 25252, to_date('10/01/2022 17:30:00','dd/mm/yyyy hh24:mi:ss'), to_date('11/01/2022 03:45:00','dd/mm/yyyy hh24:mi:ss'),
    to_date('11/01/2022 03:50:00', 'dd/mm/yyyy hh24:mi:ss'),7,9,7,12);
--8
insert into vuelo (vuelo_id, num_vuelo, salida, llegada, fecha_status, avion_id,
  aero_origen_id, aero_destino_id,status_vuelo_id)
  values(seq_vuelo.nextval, 12345, to_date('08/06/2022 11:25:00','dd/mm/yyyy hh24:mi:ss'), to_date('8/06/2022 14:00:00','dd/mm/yyyy hh24:mi:ss'),
    to_date('08/06/2022 13:00:00', 'dd/mm/yyyy hh24:mi:ss'),15,15,17,11);
--9
insert into vuelo (vuelo_id, num_vuelo, salida, llegada, fecha_status, avion_id,
  aero_origen_id, aero_destino_id,status_vuelo_id)
  values(seq_vuelo.nextval, 67892, to_date('07/06/2022 05:00:00','dd/mm/yyyy hh24:mi:ss'), to_date('07/06/2022 08:20:00','dd/mm/yyyy hh24:mi:ss'),
    to_date('07/06/2022 09:40:00', 'dd/mm/yyyy hh24:mi:ss'),11,14,12,12);
--10
insert into vuelo (vuelo_id, num_vuelo, salida, llegada, fecha_status, avion_id,
  aero_origen_id, aero_destino_id,status_vuelo_id)
  values(seq_vuelo.nextval, 10000, to_date('11/06/2022 09:00:00','dd/mm/yyyy hh24:mi:ss'), to_date('11/06/2022 12:00:00','dd/mm/yyyy hh24:mi:ss'),
    to_date('09/06/2022 00:00:00', 'dd/mm/yyyy hh24:mi:ss'),11,12,14,11);
--11
insert into vuelo (vuelo_id, num_vuelo, salida, llegada, num_sala, fecha_status, avion_id,
  aero_origen_id, aero_destino_id)
  values(seq_vuelo.nextval, 25252, to_date('10/06/2022 13:15:00','dd/mm/yyyy hh24:mi:ss'), to_date('10/06/2022 23:30:00','dd/mm/yyyy hh24:mi:ss'),
    'AB-32',to_date('01/08/2021 00:00:00','dd/mm/yyyy hh24:mi:ss'), 7,9,7);
--12
insert into vuelo (vuelo_id, num_vuelo, salida, llegada, num_sala, fecha_status, avion_id,
  aero_origen_id, aero_destino_id)
  values(seq_vuelo.nextval, 12345, to_date('16/06/2022 11:25:00','dd/mm/yyyy hh24:mi:ss'), to_date('16/06/2022 14:00:00','dd/mm/yyyy hh24:mi:ss'),
    'D-34',to_date('01/08/2021 00:00:00','dd/mm/yyyy hh24:mi:ss'), 15,15,17);


-- HISTORICO STATUS
insert into historico_status_vuelo (historico_status_vuelo_id, fecha, status_vuelo_id, vuelo_id)
  values(seq_historico_status_vuelo.nextval, to_date('01/03/2021 00:00:00', 'dd/mm/yyyy hh24:mi:ss'), 7, 7);
insert into historico_status_vuelo (historico_status_vuelo_id, fecha, status_vuelo_id, vuelo_id)
  values(seq_historico_status_vuelo.nextval, to_date('01/08/2021 00:00:00', 'dd/mm/yyyy hh24:mi:ss'), 7, 8);
insert into historico_status_vuelo (historico_status_vuelo_id, fecha, status_vuelo_id, vuelo_id)
  values(seq_historico_status_vuelo.nextval, to_date('01/08/2021 00:00:00', 'dd/mm/yyyy hh24:mi:ss'), 7, 9);
insert into historico_status_vuelo (historico_status_vuelo_id, fecha, status_vuelo_id, vuelo_id)
  values(seq_historico_status_vuelo.nextval, to_date('01/08/2021 00:00:00', 'dd/mm/yyyy hh24:mi:ss'), 7, 10);
insert into historico_status_vuelo (historico_status_vuelo_id, fecha, status_vuelo_id, vuelo_id)
  values(seq_historico_status_vuelo.nextval, to_date('01/08/2021 00:00:00', 'dd/mm/yyyy hh24:mi:ss'), 7, 11);
insert into historico_status_vuelo (historico_status_vuelo_id, fecha, status_vuelo_id, vuelo_id)
  values(seq_historico_status_vuelo.nextval, to_date('01/08/2021 00:00:00', 'dd/mm/yyyy hh24:mi:ss'), 7, 12);
insert into historico_status_vuelo (historico_status_vuelo_id, fecha, status_vuelo_id, vuelo_id)
  values(seq_historico_status_vuelo.nextval, to_date('10/01/2022 17:05:00', 'dd/mm/yyyy hh24:mi:ss'), 8, 7);
insert into historico_status_vuelo (historico_status_vuelo_id, fecha, status_vuelo_id, vuelo_id)
  values(seq_historico_status_vuelo.nextval, to_date('10/01/2022 17:35:00', 'dd/mm/yyyy hh24:mi:ss'), 9, 7);
insert into historico_status_vuelo (historico_status_vuelo_id, fecha, status_vuelo_id, vuelo_id)
  values(seq_historico_status_vuelo.nextval, to_date('11/01/2022 03:50:00', 'dd/mm/yyyy hh24:mi:ss'), 12, 7);
insert into historico_status_vuelo (historico_status_vuelo_id, fecha, status_vuelo_id, vuelo_id)
  values(seq_historico_status_vuelo.nextval, to_date('08/06/2022 11:30:00', 'dd/mm/yyyy hh24:mi:ss'), 10, 8);
insert into historico_status_vuelo (historico_status_vuelo_id, fecha, status_vuelo_id, vuelo_id)
  values(seq_historico_status_vuelo.nextval, to_date('08/06/2022 13:00:00', 'dd/mm/yyyy hh24:mi:ss'), 11, 8);
insert into historico_status_vuelo (historico_status_vuelo_id, fecha, status_vuelo_id, vuelo_id)
  values(seq_historico_status_vuelo.nextval, to_date('07/06/2022 05:05:00', 'dd/mm/yyyy hh24:mi:ss'), 10, 9);
insert into historico_status_vuelo (historico_status_vuelo_id, fecha, status_vuelo_id, vuelo_id)
  values(seq_historico_status_vuelo.nextval, to_date('07/06/2022 06:00:00', 'dd/mm/yyyy hh24:mi:ss'), 9, 9);
insert into historico_status_vuelo (historico_status_vuelo_id, fecha, status_vuelo_id, vuelo_id)
  values(seq_historico_status_vuelo.nextval, to_date('07/06/2022 09:40:00', 'dd/mm/yyyy hh24:mi:ss'), 12, 9);
insert into historico_status_vuelo (historico_status_vuelo_id, fecha, status_vuelo_id, vuelo_id)
  values(seq_historico_status_vuelo.nextval, to_date('09/06/2022 00:00:00', 'dd/mm/yyyy hh24:mi:ss'), 11, 10);


-- PUESTOS X8
--7
insert into puesto_empleado (puesto_empleado_id, clave, nombre, descripcion, sueldo_mensual)
  values(seq_puesto_empleado.nextval, 'PI', 'PILOTO', 'Encargado de pilotar los aviones de un destino a otro.', 70500.00);
--8
insert into puesto_empleado (puesto_empleado_id, clave, nombre, descripcion, sueldo_mensual)
  values(seq_puesto_empleado.nextval, 'COP', 'CO PILOTO', 'Piloto que acompaña al piloto principal en la cabina del avión.', 55320.60);
--9
insert into puesto_empleado (puesto_empleado_id, clave, nombre, descripcion, sueldo_mensual)
  values(seq_puesto_empleado.nextval, 'JS', 'JEFE SOBRECARGOS', 'Encargado de la organización de sobrecargos en el avión.', 25000.32);
--10
insert into puesto_empleado (puesto_empleado_id, clave, nombre, descripcion, sueldo_mensual)
  values(seq_puesto_empleado.nextval, 'SO', 'SOBRECARGO', 'Encargado del servicio y cuidado de los pasajeros dentro del avión.', 19000);
--11
insert into puesto_empleado (puesto_empleado_id, clave, nombre, descripcion, sueldo_mensual)
  values(seq_puesto_empleado.nextval, 'TE', 'TÉCNICO', 'Encargado de salvaguardar la integridad de la carga del avión durante el vuelo.', 18000);
--12
insert into puesto_empleado (puesto_empleado_id, clave, nombre, descripcion, sueldo_mensual)
  values(seq_puesto_empleado.nextval, 'DI', 'DIRECTOR', 'Encargado de la administración de la compañía.', 63900.00);
--13
insert into puesto_empleado (puesto_empleado_id, clave, nombre, descripcion, sueldo_mensual)
  values(seq_puesto_empleado.nextval, 'GE', 'GERENTE', 'Jefe de equipo, asigna vuelos y tripulación.', 39900.00);
--14
insert into puesto_empleado (puesto_empleado_id, clave, nombre, descripcion, sueldo_mensual)
  values(seq_puesto_empleado.nextval, 'LI', 'LIMPIEZA', 'Persona encargada de limpiar oficinas, mostradores o aviones.', 15000);



-- EMPLEADOS X25
--7
insert into empleado (empleado_id, rfc, curp, nombre, ap_paterno, ap_materno, puesto_empleado_id)
  values(seq_empleado.nextval, 'GOVM860812QA2','GOVM860812MJCNLR05','Maricela','Gonzalez', 'Villalobos',12);
--8
insert into empleado (empleado_id, rfc, curp, nombre, ap_paterno, ap_materno, puesto_empleado_id)
  values(seq_empleado.nextval, 'JACL841028Q62','JACL841028MJCRLZ00','Lizbeth','Jauregui','Calvillo',12);
--9
insert into empleado (empleado_id, rfc, curp, nombre, ap_paterno, ap_materno, puesto_empleado_id, jefe_id)
  values(seq_empleado.nextval, 'RAGF630503EW7','RAGF630503HJCMNR03','Francisco','Ramirez','González',13,7);
--10
insert into empleado (empleado_id, rfc, curp, nombre, ap_paterno, ap_materno, puesto_empleado_id, jefe_id)
  values(seq_empleado.nextval, 'HUHL7205233T9','HUHL720523HJCZRS04','José','Huizar','Hernández',13,7);
--11
insert into empleado (empleado_id, rfc, curp, nombre, ap_paterno, ap_materno, puesto_empleado_id, jefe_id)
  values(seq_empleado.nextval, 'CAGL741126P17','CAGL741126HJCHRS01','Luis','Chávez', 'García',13,8);

--12
insert into empleado (empleado_id, rfc, curp, nombre, ap_paterno, ap_materno, puesto_empleado_id, jefe_id)
  values(seq_empleado.nextval, 'AADJ640913L90','AADJ640913MTSRRN12','Juana','Armas','Durón',7,7);
--13
insert into empleado (empleado_id, rfc, curp, nombre, ap_paterno, ap_materno, puesto_empleado_id, jefe_id)
  values(seq_empleado.nextval, 'BEDF441203D49','BEDF441203HSERZR00','Francisco','Bernabe','Díaz',7,7);
--14
insert into empleado (empleado_id, rfc, curp, nombre, ap_paterno, ap_materno, puesto_empleado_id, jefe_id)
  values(seq_empleado.nextval, 'BEHN750719000','BEHN750719MGRLRR09','Noraney','Beltrán','Hernández',8,7);
--15
insert into empleado (empleado_id, rfc, curp, nombre, ap_paterno, ap_materno, puesto_empleado_id, jefe_id)
  values(seq_empleado.nextval, 'BEPB860909000','BEPB860909HGRDLS01','Cayetano','Bedolla','Platero',8,7);
--16
insert into empleado (empleado_id, rfc, curp, nombre, ap_paterno, ap_materno, puesto_empleado_id, jefe_id)
  values(seq_empleado.nextval, 'DIDL810205000','DIDL810205MGRZZZ07','Luz Elena','Díaz','Díaz',9,8);
--17
insert into empleado (empleado_id, rfc, curp, nombre, ap_paterno, ap_materno, puesto_empleado_id, jefe_id)
  values(seq_empleado.nextval, 'DOFV850701000','DOFV850701HGRRLC02','Victor Manuel','Dorantes','Flores',10,8);
--18
insert into empleado (empleado_id, rfc, curp, nombre, ap_paterno, ap_materno, puesto_empleado_id, jefe_id)
  values(seq_empleado.nextval, 'EASL801218000','EASL801218MGRSLR36','Laura','Estrada','Salgado',10,8);
--19
insert into empleado (empleado_id, rfc, curp, nombre, ap_paterno, ap_materno, puesto_empleado_id, jefe_id)
  values(seq_empleado.nextval, 'FOCR841122000','FOCR841122HGRLTL04','Raul','Flores','Catalán',10,8);
--20
insert into empleado (empleado_id, rfc, curp, nombre, ap_paterno, ap_materno, puesto_empleado_id, jefe_id)
  values(seq_empleado.nextval, 'GAMT871216000','GAMT871216MGRLRH05','Thalía','Galeana','Mora',9,9);
--21
insert into empleado (empleado_id, rfc, curp, nombre, ap_paterno, ap_materno, puesto_empleado_id, jefe_id)
  values(seq_empleado.nextval, 'HEDF860927000','HEDF860927MGRRLB08','Fabiola','Hernández','Delgado',10,9);
--22
insert into empleado (empleado_id, rfc, curp, nombre, ap_paterno, ap_materno, puesto_empleado_id, jefe_id)
  values(seq_empleado.nextval, 'IAGC861001000','IAGC861001MGRGRR07','Carime','Ignacio','García',10,9);
--23
insert into empleado (empleado_id, rfc, curp, nombre, ap_paterno, ap_materno, puesto_empleado_id, jefe_id)
  values(seq_empleado.nextval, 'JAMG8609227T3','JAMG860922MGRRRBO8','Gabriela','Jaramillo','Morales',10,9);
--24
insert into empleado (empleado_id, rfc, curp, nombre, ap_paterno, ap_materno, puesto_empleado_id, jefe_id)
  values(seq_empleado.nextval, 'MAPI831119000','MAPI831119MGRRRS08','María Isabel','Matrínez','Parra',11,10);
--25
insert into empleado (empleado_id, rfc, curp, nombre, ap_paterno, ap_materno, puesto_empleado_id, jefe_id)
  values(seq_empleado.nextval, 'OEPR690206E37','OEPR690206H6RTRF06','Rafael','Otero','Perez',11,10);
--26
insert into empleado (empleado_id, rfc, curp, nombre, ap_paterno, ap_materno, puesto_empleado_id, jefe_id)
  values(seq_empleado.nextval, 'PACE811104000','PACE811104MGRLRR09','Erika','Placido','de la Cruz',11,10);
--27
insert into empleado (empleado_id, rfc, curp, nombre, ap_paterno, ap_materno, puesto_empleado_id, jefe_id)
  values(seq_empleado.nextval, 'RALJ860316000','RALJ860316HGRYNR01','Jerson','Rayo','Leonides',11,10);
--28
insert into empleado (empleado_id, rfc, curp, nombre, ap_paterno, ap_materno, puesto_empleado_id, jefe_id)
  values(seq_empleado.nextval, 'SABJ791021000','SABJ791021MGRLLS09','Josefina','Salgado','Blancas',11,11);

--29
insert into empleado (empleado_id, rfc, curp, nombre, ap_paterno, ap_materno, puesto_empleado_id, jefe_id)
  values(seq_empleado.nextval, 'TOAJ780617M53','TOAJ780617HSERRS00','Jesús','Torres','Arellano',14,11);
--30
insert into empleado (empleado_id, rfc, curp, nombre, ap_paterno, ap_materno, puesto_empleado_id, jefe_id)
  values(seq_empleado.nextval, 'VEPE730719000','VEPE730719MGRGRS00','Esmeralda','Vega','Parra',14,11);
--31
insert into empleado (empleado_id, rfc, curp, nombre, ap_paterno, ap_materno, puesto_empleado_id, jefe_id)
  values(seq_empleado.nextval, 'ROSP810629000','ROSP810629HGRMNB04','Pablo','Romero','Santiago',14,11);



-- URL X15
insert into url_trayectoria_empleado (url_trayectoria_id, url, empleado_id)
  values(seq_url_trayectoria.nextval, 'https://trabajosTodo.com/839',7);
insert into url_trayectoria_empleado (url_trayectoria_id, url, empleado_id)
  values(seq_url_trayectoria.nextval, 'www.trayectoriaProf.net/abs.htm',7);
insert into url_trayectoria_empleado (url_trayectoria_id, url, empleado_id)
  values(seq_url_trayectoria.nextval, 'www.puestoMexico.mx/id=3',7);
insert into url_trayectoria_empleado (url_trayectoria_id, url, empleado_id)
  values(seq_url_trayectoria.nextval, 'https://miTrabajo.com/vida893',7);
insert into url_trayectoria_empleado (url_trayectoria_id, url, empleado_id)
  values(seq_url_trayectoria.nextval, 'https://experiencia.net/j3',7);
insert into url_trayectoria_empleado (url_trayectoria_id, url, empleado_id)
  values(seq_url_trayectoria.nextval, 'https://trabajosTodo.com/aa9',8);
insert into url_trayectoria_empleado (url_trayectoria_id, url, empleado_id)
  values(seq_url_trayectoria.nextval, 'www.trayectoriaProf.net/tum.htm',8);
insert into url_trayectoria_empleado (url_trayectoria_id, url, empleado_id)
  values(seq_url_trayectoria.nextval, 'www.puestoMexico.mx/id=84',8);
insert into url_trayectoria_empleado (url_trayectoria_id, url, empleado_id)
  values(seq_url_trayectoria.nextval, 'https://trabajosTodo.com/2.-1',9);
insert into url_trayectoria_empleado (url_trayectoria_id, url, empleado_id)
  values(seq_url_trayectoria.nextval, 'www.trayectoriaProf.net/les.htm',9);
insert into url_trayectoria_empleado (url_trayectoria_id, url, empleado_id)
  values(seq_url_trayectoria.nextval, 'https://trabajosTodo.com/642',10);
insert into url_trayectoria_empleado (url_trayectoria_id, url, empleado_id)
  values(seq_url_trayectoria.nextval, 'https://trabajosTodo.com/374',11);
insert into url_trayectoria_empleado (url_trayectoria_id, url, empleado_id)
  values(seq_url_trayectoria.nextval, 'https://trabajosTodo.com/811',14);
insert into url_trayectoria_empleado (url_trayectoria_id, url, empleado_id)
  values(seq_url_trayectoria.nextval, 'https://trabajosTodo.com/029',15);
insert into url_trayectoria_empleado (url_trayectoria_id, url, empleado_id)
  values(seq_url_trayectoria.nextval, 'www.trayectoriaProf.net/ked.htm',15);


--PILOTOS: 12, 13
--COPilotos: 14, 15
--Jefe: 16,20
--Sobre: 17,18,19,21,22,23
--Tecnico: 24,25,26,27,28
--VUELO CARGA: 9,10
--VUELO COMERCIAL: 7,11
--AMBOS: 8,12

-- TRIPULANTES

insert into tripulante_vuelo (tripulante_vuelo_id, empleado_id, vuelo_id)
  values(seq_tripulante_vuelo.nextval, 12,7);
insert into tripulante_vuelo (tripulante_vuelo_id, empleado_id, vuelo_id)
  values(seq_tripulante_vuelo.nextval, 14,7);
insert into tripulante_vuelo (tripulante_vuelo_id, empleado_id, vuelo_id)
  values(seq_tripulante_vuelo.nextval, 16,7);
insert into tripulante_vuelo (tripulante_vuelo_id, empleado_id, vuelo_id)
  values(seq_tripulante_vuelo.nextval, 17,7);
insert into tripulante_vuelo (tripulante_vuelo_id, empleado_id, vuelo_id)
  values(seq_tripulante_vuelo.nextval, 18,7);
insert into tripulante_vuelo (tripulante_vuelo_id, empleado_id, vuelo_id)
  values(seq_tripulante_vuelo.nextval, 19,7);

insert into tripulante_vuelo (tripulante_vuelo_id, puntos, empleado_id, vuelo_id)
  values(seq_tripulante_vuelo.nextval, 99,12,11);
insert into tripulante_vuelo (tripulante_vuelo_id, puntos, empleado_id, vuelo_id)
  values(seq_tripulante_vuelo.nextval, 90,15,11);
insert into tripulante_vuelo (tripulante_vuelo_id, puntos, empleado_id, vuelo_id)
  values(seq_tripulante_vuelo.nextval, 90,20,11);
insert into tripulante_vuelo (tripulante_vuelo_id, puntos, empleado_id, vuelo_id)
  values(seq_tripulante_vuelo.nextval, 70,21,11);
insert into tripulante_vuelo (tripulante_vuelo_id, puntos, empleado_id, vuelo_id)
  values(seq_tripulante_vuelo.nextval, 30,22,11);
insert into tripulante_vuelo (tripulante_vuelo_id, puntos, empleado_id, vuelo_id)
  values(seq_tripulante_vuelo.nextval, 95,23,11);



insert into tripulante_vuelo (tripulante_vuelo_id, empleado_id, vuelo_id)
  values(seq_tripulante_vuelo.nextval, 13,9);
insert into tripulante_vuelo (tripulante_vuelo_id, empleado_id, vuelo_id)
  values(seq_tripulante_vuelo.nextval, 14,9);
insert into tripulante_vuelo (tripulante_vuelo_id, empleado_id, vuelo_id)
  values(seq_tripulante_vuelo.nextval, 15,9);
insert into tripulante_vuelo (tripulante_vuelo_id, empleado_id, vuelo_id)
  values(seq_tripulante_vuelo.nextval, 24,9);
insert into tripulante_vuelo (tripulante_vuelo_id, empleado_id, vuelo_id)
  values(seq_tripulante_vuelo.nextval, 25,9);

insert into tripulante_vuelo (tripulante_vuelo_id, puntos, empleado_id, vuelo_id)
  values(seq_tripulante_vuelo.nextval, 90,13,10);
insert into tripulante_vuelo (tripulante_vuelo_id, puntos, empleado_id, vuelo_id)
  values(seq_tripulante_vuelo.nextval, 80,14,10);
insert into tripulante_vuelo (tripulante_vuelo_id, puntos, empleado_id, vuelo_id)
  values(seq_tripulante_vuelo.nextval, 95,15,10);
insert into tripulante_vuelo (tripulante_vuelo_id, puntos, empleado_id, vuelo_id)
  values(seq_tripulante_vuelo.nextval, 100,26,10);
insert into tripulante_vuelo (tripulante_vuelo_id, puntos, empleado_id, vuelo_id)
  values(seq_tripulante_vuelo.nextval, 90,27,10);



insert into tripulante_vuelo (tripulante_vuelo_id, empleado_id, vuelo_id)
  values(seq_tripulante_vuelo.nextval, 12,8);
insert into tripulante_vuelo (tripulante_vuelo_id, empleado_id, vuelo_id)
  values(seq_tripulante_vuelo.nextval, 14,8);
insert into tripulante_vuelo (tripulante_vuelo_id, empleado_id, vuelo_id)
  values(seq_tripulante_vuelo.nextval, 15,8);
insert into tripulante_vuelo (tripulante_vuelo_id, empleado_id, vuelo_id)
  values(seq_tripulante_vuelo.nextval, 16,8);
insert into tripulante_vuelo (tripulante_vuelo_id, empleado_id, vuelo_id)
  values(seq_tripulante_vuelo.nextval, 17,8);
insert into tripulante_vuelo (tripulante_vuelo_id, empleado_id, vuelo_id)
  values(seq_tripulante_vuelo.nextval, 18,8);
insert into tripulante_vuelo (tripulante_vuelo_id, empleado_id, vuelo_id)
  values(seq_tripulante_vuelo.nextval, 19,8);
insert into tripulante_vuelo (tripulante_vuelo_id, empleado_id, vuelo_id)
  values(seq_tripulante_vuelo.nextval, 28,8);
insert into tripulante_vuelo (tripulante_vuelo_id, empleado_id, vuelo_id)
  values(seq_tripulante_vuelo.nextval, 24,8);

insert into tripulante_vuelo (tripulante_vuelo_id, puntos, empleado_id, vuelo_id)
  values(seq_tripulante_vuelo.nextval, 75,13,12);
insert into tripulante_vuelo (tripulante_vuelo_id, puntos, empleado_id, vuelo_id)
  values(seq_tripulante_vuelo.nextval, 85,14,12);
insert into tripulante_vuelo (tripulante_vuelo_id, puntos, empleado_id, vuelo_id)
  values(seq_tripulante_vuelo.nextval, 92,15,12);
insert into tripulante_vuelo (tripulante_vuelo_id, puntos, empleado_id, vuelo_id)
  values(seq_tripulante_vuelo.nextval, 99,20,12);
insert into tripulante_vuelo (tripulante_vuelo_id, puntos, empleado_id, vuelo_id)
  values(seq_tripulante_vuelo.nextval, 90,21,12);
insert into tripulante_vuelo (tripulante_vuelo_id, puntos, empleado_id, vuelo_id)
  values(seq_tripulante_vuelo.nextval, 65,22,12);
insert into tripulante_vuelo (tripulante_vuelo_id, puntos, empleado_id, vuelo_id)
  values(seq_tripulante_vuelo.nextval, 92,23,12);
insert into tripulante_vuelo (tripulante_vuelo_id, puntos, empleado_id, vuelo_id)
  values(seq_tripulante_vuelo.nextval, 100,25,12);
insert into tripulante_vuelo (tripulante_vuelo_id, puntos, empleado_id, vuelo_id)
  values(seq_tripulante_vuelo.nextval, 80,26,12);





-- PASAJEROS X20

-- completos X10
insert into pasajero (pasajero_id, curp, nombre, ap_paterno, ap_materno, fecha_nacimiento, email)
  values(seq_pasajero.nextval, 'BICM800122MJCRHNA7','Monica','Briceño','Chávez',to_date('22/01/1980', 'dd/mm/yyyy'),'moni.bri@gmail.com');
insert into pasajero (pasajero_id, curp, nombre, ap_paterno, ap_materno, fecha_nacimiento, email)
  values(seq_pasajero.nextval, 'CALE011026HQRMCDA9','Edmundo','Lechuga','Campos',to_date('26/10/2001', 'dd/mm/yyyy'),'edmu.lechu@hotmail.com');
insert into pasajero (pasajero_id, curp, nombre, ap_paterno, ap_materno, fecha_nacimiento, email)
  values(seq_pasajero.nextval, 'GACF020205HQRLLRA6','Galarza','Colorado','Freddy',to_date('05/02/2002', 'dd/mm/yyyy'),'freddy523@gmail.com');
insert into pasajero (pasajero_id, curp, nombre, ap_paterno, ap_materno, fecha_nacimiento, email)
  values(seq_pasajero.nextval, 'GURD011031HQRTDVA7','José David','Gutiérrez','Rodriguez',to_date('31/10/2001', 'dd/mm/yyyy'),'josedavid.g@gmail.com');
insert into pasajero (pasajero_id, curp, nombre, ap_paterno, ap_materno, fecha_nacimiento, email)
  values(seq_pasajero.nextval, 'HEGC910520HGRRRRA0','Cristino','Hernández','García',to_date('20/05/1991', 'dd/mm/yyyy'),'cristiandor7@gmail.com');
insert into pasajero (pasajero_id, curp, nombre, ap_paterno, ap_materno, fecha_nacimiento, email)
  values(seq_pasajero.nextval, 'RIMC010911HQRVRRA8','Cristian','Rivero','Matrínez',to_date('11/09/2001', 'dd/mm/yyyy'),'riveromartinez@gmail.com');
insert into pasajero (pasajero_id, curp, nombre, ap_paterno, ap_materno, fecha_nacimiento, email)
  values(seq_pasajero.nextval, 'SOAA731118HQRLMXA7','Axel','Solis','Amezcua',to_date('18/11/1973', 'dd/mm/yyyy'),'axel.solis@hotmail.com');
insert into pasajero (pasajero_id, curp, nombre, ap_paterno, ap_materno, fecha_nacimiento, email)
  values(seq_pasajero.nextval, 'GICM020610HQRLRRA8','Mario','Gil','Cruz',to_date('10/06/2002', 'dd/mm/yyyy'),'mariogilcruz@gmail.com');
insert into pasajero (pasajero_id, curp, nombre, ap_paterno, ap_materno, fecha_nacimiento, email)
  values(seq_pasajero.nextval, 'MASI991125HQRRLS05','Isaac','Martínez','Silias',to_date('25/11/1999', 'dd/mm/yyyy'),'isaaaaac@gmail.com');
insert into pasajero (pasajero_id, curp, nombre, ap_paterno, ap_materno, fecha_nacimiento, email)
  values(seq_pasajero.nextval, 'OOCL840320HQRRRSA0','Luis','Orozco','Cortéz',to_date('20/03/1984', 'dd/mm/yyyy'),'luisorozcocor@gmail.com');

-- sin ap_materno ni email X10
insert into pasajero (pasajero_id, curp, nombre, ap_paterno, fecha_nacimiento)
  values(seq_pasajero.nextval, 'BOPJ020823HQRLRNA6','Juan','Bolon',to_date('23/08/2002', 'dd/mm/yyyy'));
insert into pasajero (pasajero_id, curp, nombre, ap_paterno, fecha_nacimiento)
  values(seq_pasajero.nextval, 'CAMA021115MVZSYLA4','Alessandra','Castillo',to_date('15/11/2002', 'dd/mm/yyyy'));
insert into pasajero (pasajero_id, curp, nombre, ap_paterno, fecha_nacimiento)
  values(seq_pasajero.nextval, 'CAJW620719MBSHVNB0','Wendi','Chavez',to_date('19/07/1962', 'dd/mm/yyyy'));
insert into pasajero (pasajero_id, curp, nombre, ap_paterno, fecha_nacimiento)
  values(seq_pasajero.nextval, 'PEGD510319MMCRNNA3','Diana','Pérez',to_date('19/03/1951', 'dd/mm/yyyy'));
insert into pasajero (pasajero_id, curp, nombre, ap_paterno, fecha_nacimiento)
  values(seq_pasajero.nextval, 'ROGJ730908HQRSRSA3','Josué','Rosado',to_date('08/09/1973', 'dd/mm/yyyy'));
insert into pasajero (pasajero_id, curp, nombre, ap_paterno, fecha_nacimiento)
  values(seq_pasajero.nextval, 'LOPM820328MQRPRRA1','Mariana','López',to_date('28/03/1982', 'dd/mm/yyyy'));
insert into pasajero (pasajero_id, curp, nombre, ap_paterno, fecha_nacimiento)
  values(seq_pasajero.nextval, 'PAZR920514HQRCPCA6','José','Pacheco',to_date('14/05/1992', 'dd/mm/yyyy'));
insert into pasajero (pasajero_id, curp, nombre, ap_paterno, fecha_nacimiento)
  values(seq_pasajero.nextval, 'FUHS031205MQRNCMA6','Consuelo','Fuentes',to_date('05/12/2003', 'dd/mm/yyyy'));
insert into pasajero (pasajero_id, curp, nombre, ap_paterno, fecha_nacimiento)
  values(seq_pasajero.nextval, 'ROCC021102HQRDHRA9','Carmelo','Rodriguez',to_date('02/11/2002', 'dd/mm/yyyy'));
insert into pasajero (pasajero_id, curp, nombre, ap_paterno, fecha_nacimiento)
  values(seq_pasajero.nextval, 'HURA920918HCCRZLA3','Eduardo','Huerta',to_date('18/09/1992', 'dd/mm/yyyy'));
insert into pasajero (pasajero_id, curp, nombre, ap_paterno, fecha_nacimiento)
  values(seq_pasajero.nextval, 'SAHR980103HQRNRL05','Raúl','Sánchez',to_date('03/01/1998', 'dd/mm/yyyy'));



-- PASAJERO VUELO X15
insert into pasajero_vuelo (pasajero_vuelo_id, asiento, atencion_especial, abordo, pasajero_id, vuelo_id)
  values(seq_pasajero_vuelo.nextval, '23-A','Ninguna','1',7,7);
insert into pasajero_vuelo (pasajero_vuelo_id, asiento, atencion_especial, abordo, pasajero_id, vuelo_id)
  values(seq_pasajero_vuelo.nextval, '12-B','Ninguna','1',18,7);
insert into pasajero_vuelo (pasajero_vuelo_id, asiento, atencion_especial, abordo, pasajero_id, vuelo_id)
  values(seq_pasajero_vuelo.nextval, '1-D','Diabético','1',17,7);
insert into pasajero_vuelo (pasajero_vuelo_id, asiento, atencion_especial, abordo, pasajero_id, vuelo_id)
  values(seq_pasajero_vuelo.nextval, '1-C','Ayuda para parase del asiento.','1',8,7);
insert into pasajero_vuelo (pasajero_vuelo_id, asiento, atencion_especial, abordo, pasajero_id, vuelo_id)
  values(seq_pasajero_vuelo.nextval, '32-A','Ninguna','1',7,11);
insert into pasajero_vuelo (pasajero_vuelo_id, asiento, atencion_especial, abordo, pasajero_id, vuelo_id)
  values(seq_pasajero_vuelo.nextval, '101-F','Ninguna','1',18,11);
insert into pasajero_vuelo (pasajero_vuelo_id, asiento, atencion_especial, abordo, pasajero_id, vuelo_id)
  values(seq_pasajero_vuelo.nextval, '52-C','Ninguna','1',10,11);
insert into pasajero_vuelo (pasajero_vuelo_id, asiento, atencion_especial, abordo, pasajero_id, vuelo_id)
  values(seq_pasajero_vuelo.nextval, '52-B','Ninguna','1',9,11);
insert into pasajero_vuelo (pasajero_vuelo_id, asiento, atencion_especial, abordo, pasajero_id, vuelo_id)
  values(seq_pasajero_vuelo.nextval, '23-A','Ninguna','1',11,11);
insert into pasajero_vuelo (pasajero_vuelo_id, asiento, atencion_especial, abordo, pasajero_id, vuelo_id)
  values(seq_pasajero_vuelo.nextval, '23-D','Vegetariano','1',7,8);
insert into pasajero_vuelo (pasajero_vuelo_id, asiento, atencion_especial, pasajero_id, vuelo_id)
  values(seq_pasajero_vuelo.nextval, '11-C','Vegetariano',9,8);
insert into pasajero_vuelo (pasajero_vuelo_id, asiento, atencion_especial, pasajero_id, vuelo_id)
  values(seq_pasajero_vuelo.nextval, '5-D','Lleva bebé en brazos',18,8);
insert into pasajero_vuelo (pasajero_vuelo_id, asiento, atencion_especial, pasajero_id, vuelo_id)
  values(seq_pasajero_vuelo.nextval, '5-E','Ninguna',8,12);
insert into pasajero_vuelo (pasajero_vuelo_id, asiento, atencion_especial, pasajero_id, vuelo_id)
  values(seq_pasajero_vuelo.nextval, '22-AB','Ninguna',7,12);
insert into pasajero_vuelo (pasajero_vuelo_id, asiento, atencion_especial, pasajero_id, vuelo_id)
  values(seq_pasajero_vuelo.nextval, '31-CD','Ninguna',19,12);


-- PASE DE ABORDAR X15
insert into pase_abordar (pase_abordar_id, folio, fecha_impresion, pasajero_vuelo_id)
  values(seq_pase_abordar.nextval, 'ABCD1234', to_date('10/01/2022 15:30:00','dd/mm/yyyy hh24:mi:ss'), 7);
insert into pase_abordar (pase_abordar_id, folio, fecha_impresion, pasajero_vuelo_id)
  values(seq_pase_abordar.nextval, 'ABCD1235', to_date('10/01/2022 16:30:00','dd/mm/yyyy hh24:mi:ss'), 8);
insert into pase_abordar (pase_abordar_id, folio, fecha_impresion, pasajero_vuelo_id)
  values(seq_pase_abordar.nextval, 'ABCD1236', to_date('10/01/2022 17:00:00','dd/mm/yyyy hh24:mi:ss'), 9);
insert into pase_abordar (pase_abordar_id, folio, fecha_impresion, pasajero_vuelo_id)
  values(seq_pase_abordar.nextval, 'ABCD1237', to_date('10/01/2022 17:05:00','dd/mm/yyyy hh24:mi:ss'), 10);
insert into pase_abordar (pase_abordar_id, folio, fecha_impresion, pasajero_vuelo_id)
  values(seq_pase_abordar.nextval, 'ABCD1238', to_date('10/06/2022 11:15:00','dd/mm/yyyy hh24:mi:ss'), 11);
insert into pase_abordar (pase_abordar_id, folio, fecha_impresion, pasajero_vuelo_id)
  values(seq_pase_abordar.nextval, 'ABCD1239', to_date('10/06/2022 12:15:00','dd/mm/yyyy hh24:mi:ss'), 12);
insert into pase_abordar (pase_abordar_id, folio, fecha_impresion, pasajero_vuelo_id)
  values(seq_pase_abordar.nextval, 'ABCD1240', to_date('10/06/2022 13:05:00','dd/mm/yyyy hh24:mi:ss'), 13);
insert into pase_abordar (pase_abordar_id, folio, fecha_impresion, pasajero_vuelo_id)
  values(seq_pase_abordar.nextval, 'ABCD1241', to_date('10/06/2022 13:00:00','dd/mm/yyyy hh24:mi:ss'), 14);
insert into pase_abordar (pase_abordar_id, folio, fecha_impresion, pasajero_vuelo_id)
  values(seq_pase_abordar.nextval, 'ABCD1242', to_date('10/06/2022 12:10:00','dd/mm/yyyy hh24:mi:ss'), 15);
insert into pase_abordar (pase_abordar_id, folio, fecha_impresion, pasajero_vuelo_id)
  values(seq_pase_abordar.nextval, 'ABCD1243', to_date('08/06/2022 09:18:00','dd/mm/yyyy hh24:mi:ss'), 16);
insert into pase_abordar (pase_abordar_id, folio, fecha_impresion, pasajero_vuelo_id)
  values(seq_pase_abordar.nextval, 'ABCD1244', to_date('08/06/2022 09:20:00','dd/mm/yyyy hh24:mi:ss'), 17);
insert into pase_abordar (pase_abordar_id, folio, fecha_impresion, pasajero_vuelo_id)
  values(seq_pase_abordar.nextval, 'ABCD1245', to_date('08/06/2022 10:35:00','dd/mm/yyyy hh24:mi:ss'), 18);
insert into pase_abordar (pase_abordar_id, folio, fecha_impresion, pasajero_vuelo_id)
  values(seq_pase_abordar.nextval, 'ABCD1246', to_date('16/06/2022 11:05:00','dd/mm/yyyy hh24:mi:ss'), 19);
insert into pase_abordar (pase_abordar_id, folio, fecha_impresion, pasajero_vuelo_id)
  values(seq_pase_abordar.nextval, 'ABCD1247', to_date('16/06/2022 10:25:00','dd/mm/yyyy hh24:mi:ss'), 20);
insert into pase_abordar (pase_abordar_id, folio, fecha_impresion, pasajero_vuelo_id)
  values(seq_pase_abordar.nextval, 'ABCD1248', to_date('16/06/2022 09:55:00','dd/mm/yyyy hh24:mi:ss'), 21);


-- MALETA X20
insert into maleta (maleta_id, num_maleta, peso, pase_abordar_id)
  values(seq_maleta.nextval, 1, 22,7);
insert into maleta (maleta_id, num_maleta, peso, pase_abordar_id)
  values(seq_maleta.nextval, 2, 25,7);
insert into maleta (maleta_id, num_maleta, peso, pase_abordar_id)
  values(seq_maleta.nextval, 3, 13,7);
insert into maleta (maleta_id, num_maleta, peso, pase_abordar_id)
  values(seq_maleta.nextval, 1, 24,8);
insert into maleta (maleta_id, num_maleta, peso, pase_abordar_id)
  values(seq_maleta.nextval, 2, 16,8);
insert into maleta (maleta_id, num_maleta, peso, pase_abordar_id)
  values(seq_maleta.nextval, 1, 49,9);
insert into maleta (maleta_id, num_maleta, peso, pase_abordar_id)
  values(seq_maleta.nextval, 2, 22,9);
insert into maleta (maleta_id, num_maleta, peso, pase_abordar_id)
  values(seq_maleta.nextval, 1, 32,10);
insert into maleta (maleta_id, num_maleta, peso, pase_abordar_id)
  values(seq_maleta.nextval, 2, 18,10);
insert into maleta (maleta_id, num_maleta, peso, pase_abordar_id)
  values(seq_maleta.nextval, 1, 23,11);
insert into maleta (maleta_id, num_maleta, peso, pase_abordar_id)
  values(seq_maleta.nextval, 1, 24,12);
insert into maleta (maleta_id, num_maleta, peso, pase_abordar_id)
  values(seq_maleta.nextval, 1, 25,13);
insert into maleta (maleta_id, num_maleta, peso, pase_abordar_id)
  values(seq_maleta.nextval, 1, 14,14);
insert into maleta (maleta_id, num_maleta, peso, pase_abordar_id)
  values(seq_maleta.nextval, 1, 18.2,15);
insert into maleta (maleta_id, num_maleta, peso, pase_abordar_id)
  values(seq_maleta.nextval, 1, 20.4,16);
insert into maleta (maleta_id, num_maleta, peso, pase_abordar_id)
  values(seq_maleta.nextval, 1, 10.9,17);
insert into maleta (maleta_id, num_maleta, peso, pase_abordar_id)
  values(seq_maleta.nextval, 1, 20.2,18);
insert into maleta (maleta_id, num_maleta, peso, pase_abordar_id)
  values(seq_maleta.nextval, 1, 27.6,19);
insert into maleta (maleta_id, num_maleta, peso, pase_abordar_id)
  values(seq_maleta.nextval, 1, 10,20);
insert into maleta (maleta_id, num_maleta, peso, pase_abordar_id)
  values(seq_maleta.nextval, 1, 19,21);


-- TIPOS DE PAQUETE X6
--7
insert into tipo_paquete (tipo_paquete_id, clave, descripcion, indicaciones)
  values(seq_tipo_paquete.nextval, 'FR','FRAGIL: Objetos que se pueden romper o estropear por golpes.','Debe ser lo último en acomodarse con cuidado y ajustado.');
--8
insert into tipo_paquete (tipo_paquete_id, clave, descripcion, indicaciones)
  values(seq_tipo_paquete.nextval, 'NO','NORMAL: Objetos que no necesitan cuidado especial.','Se pueden acomodar en cualquier momento y lugar.');
--9
insert into tipo_paquete (tipo_paquete_id, clave, descripcion, indicaciones)
  values(seq_tipo_paquete.nextval, 'PE','PESADOS: Objetos con un peso mayor a 50 kg y menor a 100kg.','Tomar las precauciones por el peso puede dañar otros paquetes.');
--10
insert into tipo_paquete (tipo_paquete_id, clave, descripcion, indicaciones)
  values(seq_tipo_paquete.nextval, 'XPE','MUY PESADOS: Objetos con un peso mayor 100 kg.','Usar equipo especial para su movimiento y fijar bien sin debalancear avión.');
--11
insert into tipo_paquete (tipo_paquete_id, clave, descripcion, indicaciones)
  values(seq_tipo_paquete.nextval, 'AR','ARTE: Piezas artísticas (pinturas, esculturas, etc.).','Usar bodegas únicamente para arte que serán cerradas y selladas.');
--12
insert into tipo_paquete (tipo_paquete_id, clave, descripcion, indicaciones)
  values(seq_tipo_paquete.nextval, 'DE','DEPORTIVO: Artículos deportivos.','Acomodar conforme a la forma del paquete para evitar posibles daños.');


-- PAQUETES X15
insert into paquete (paquete_id, folio, peso, tipo_paquete_id, vuelo_id)
  values(seq_paquete.nextval, 123000000000000000, 52, 9, 9);
insert into paquete (paquete_id, folio, peso, tipo_paquete_id, vuelo_id)
  values(seq_paquete.nextval, 123000000000000001, 65, 9, 9);
insert into paquete (paquete_id, folio, peso, tipo_paquete_id, vuelo_id)
  values(seq_paquete.nextval, 123000000000000002, 101.5, 10, 9);
insert into paquete (paquete_id, folio, peso, tipo_paquete_id, vuelo_id)
  values(seq_paquete.nextval, 123000000000000003, 3, 7, 9);
insert into paquete (paquete_id, folio, peso, tipo_paquete_id, vuelo_id)
  values(seq_paquete.nextval, 123000000000000004, 5.4, 7, 10);
insert into paquete (paquete_id, folio, peso, tipo_paquete_id, vuelo_id)
  values(seq_paquete.nextval, 123000000000000005, 10, 11, 10);
insert into paquete (paquete_id, folio, peso, tipo_paquete_id, vuelo_id)
  values(seq_paquete.nextval, 123000000000000006, 40, 11, 10);
insert into paquete (paquete_id, folio, peso, tipo_paquete_id, vuelo_id)
  values(seq_paquete.nextval, 123000000000000007, 5, 11, 10);
insert into paquete (paquete_id, folio, peso, tipo_paquete_id, vuelo_id)
  values(seq_paquete.nextval, 123000000000000008, 1.2, 7, 10);
insert into paquete (paquete_id, folio, peso, tipo_paquete_id, vuelo_id)
  values(seq_paquete.nextval, 123000000000000009, 10.1, 12, 8);
insert into paquete (paquete_id, folio, peso, tipo_paquete_id, vuelo_id)
  values(seq_paquete.nextval, 123000000000000010, 3.2, 7, 8);
insert into paquete (paquete_id, folio, peso, tipo_paquete_id, vuelo_id)
  values(seq_paquete.nextval, 123000000000000011, 22.3, 8, 8);
insert into paquete (paquete_id, folio, peso, tipo_paquete_id, vuelo_id)
  values(seq_paquete.nextval, 123000000000000012, 15, 12, 12);
insert into paquete (paquete_id, folio, peso, tipo_paquete_id, vuelo_id)
  values(seq_paquete.nextval, 123000000000000013, 8.5, 12, 12);
insert into paquete (paquete_id, folio, peso, tipo_paquete_id, vuelo_id)
  values(seq_paquete.nextval, 123000000000000014, 15, 8, 12);


-- MONITORIZACIÓN X5
insert into monitoreo (vuelo_id, num_registro, latitud, longitud)
  values(7, 1, 19.2610, -99.0419);
insert into monitoreo (vuelo_id, num_registro, latitud, longitud)
  values(7, 2, 19.2611, -99.0419);
insert into monitoreo (vuelo_id, num_registro, latitud, longitud)
  values(7, 3, 19.2612, -99.0420);
insert into monitoreo (vuelo_id, num_registro, latitud, longitud)
  values(7, 4, 19.2613, -99.0420);
insert into monitoreo (vuelo_id, num_registro, latitud, longitud)
  values(7, 5, 19.2614, -99.0421);
insert into monitoreo (vuelo_id, num_registro, latitud, longitud)
  values(7, 6, 19.2615, -99.0421);
insert into monitoreo (vuelo_id, num_registro, latitud, longitud)
  values(7, 7, 19.2616, -99.0422);
insert into monitoreo (vuelo_id, num_registro, latitud, longitud)
  values(7, 8, 19.2617, -99.0422);
insert into monitoreo (vuelo_id, num_registro, latitud, longitud)
  values(7, 9, 19.2618, -99.0423);
insert into monitoreo (vuelo_id, num_registro, latitud, longitud)
  values(7, 10, 19.2619, -99.0423);
insert into monitoreo (vuelo_id, num_registro, latitud, longitud)
  values(7, 11, 19.2620, -99.0424);
insert into monitoreo (vuelo_id, num_registro, latitud, longitud)
  values(7, 12, 19.2621, -99.0424);
insert into monitoreo (vuelo_id, num_registro, latitud, longitud)
  values(7, 13, 19.2622, -99.0425);
insert into monitoreo (vuelo_id, num_registro, latitud, longitud)
  values(7, 14, 19.2623, -99.0425);
insert into monitoreo (vuelo_id, num_registro, latitud, longitud)
  values(7, 15, 19.2624, -99.0426);
insert into monitoreo (vuelo_id, num_registro, latitud, longitud)
  values(9, 1, 32.3225, -116.5812);
insert into monitoreo (vuelo_id, num_registro, latitud, longitud)
  values(9, 2, 32.3223, -116.5807);
insert into monitoreo (vuelo_id, num_registro, latitud, longitud)
  values(9, 3, 32.3221, -116.5802);
insert into monitoreo (vuelo_id, num_registro, latitud, longitud)
  values(9, 4, 32.3219, -116.5797);
insert into monitoreo (vuelo_id, num_registro, latitud, longitud)
  values(9, 5, 32.3217, -116.5792);
insert into monitoreo (vuelo_id, num_registro, latitud, longitud)
  values(9, 6, 32.3215, -116.5787);
insert into monitoreo (vuelo_id, num_registro, latitud, longitud)
  values(9, 7, 32.3213, -116.5782);
insert into monitoreo (vuelo_id, num_registro, latitud, longitud)
  values(9, 8, 32.3211, -116.5777);
insert into monitoreo (vuelo_id, num_registro, latitud, longitud)
  values(9, 9, 32.3209, -116.5772);
insert into monitoreo (vuelo_id, num_registro, latitud, longitud)
  values(9, 10, 32.3207, -116.5767);
insert into monitoreo (vuelo_id, num_registro, latitud, longitud)
  values(9, 11, 32.3205, -116.5762);
insert into monitoreo (vuelo_id, num_registro, latitud, longitud)
  values(9, 12, 32.3203, -116.5757);
insert into monitoreo (vuelo_id, num_registro, latitud, longitud)
  values(9, 13, 32.3201, -116.5752);
insert into monitoreo (vuelo_id, num_registro, latitud, longitud)
  values(9, 14, 32.3199, -116.5747);
insert into monitoreo (vuelo_id, num_registro, latitud, longitud)
  values(9, 15, 32.3197, -116.5742);