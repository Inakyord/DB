--@Autor:           Iñaky Ordiales Caballero
--@Fecha creación:  7/06/2022
--@Descripción:     Trigger para ir actualizando el histórico de los vuelos.


create or replace trigger tr_actualizar_historico
  after insert or update of status_vuelo_id, fecha_status on vuelo
  for each row

declare
  v_status_id number(2,0);
  v_fecha_status date;
  v_vuelo_id number(8,0);
  v_status_nombre varchar2(40);
  v_str varchar2(300);

begin
  case
    when inserting then
      v_status_id := :new.status_vuelo_id;
      v_fecha_status := :new.fecha_status;

      if v_status_id <> 7 then
        select nombre into v_status_nombre from status_vuelo where status_vuelo_id=v_status_id;
        dbms_output.put_line('El status que se trató de ingresar fue: '||v_status_nombre||chr(10));
        
        raise_application_error(-20005, 'ERROR! No se puede ingresar vuelo con otro 
          status que no sea PROGRAMADDO.');

      else
        v_str:='insert into historico_status_vuelo(historico_status_vuelo_id,fecha,status_vuelo_id,vuelo_id)'||
          'values ('||seq_historico_status_vuelo.nextval||', to_date('''||v_fecha_status||''', ''dd-mm-yyyy hh24:mi:ss''), '
          ||v_status_id||', '||:new.vuelo_id||')';
        execute immediate v_str;
      end if;

    when updating then
      v_status_id := :new.status_vuelo_id;
      v_fecha_status := :new.fecha_status;

      v_str:='insert into historico_status_vuelo(historico_status_vuelo_id,fecha,status_vuelo_id,vuelo_id)'||
        'values ('||seq_historico_status_vuelo.nextval||', to_date('''||v_fecha_status||''', ''dd-mm-yyyy hh24:mi:ss''), '
        ||v_status_id||', '||:new.vuelo_id||')';
      execute immediate v_str;

  end case;
end;
/
show errors;




