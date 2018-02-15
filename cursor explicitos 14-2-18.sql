create table calificaciones (id_calificacion integer, materia varchar2(80),
valor float,
constraint pk_id_cal primary key (id_calificacion));
---generamos una secuencia
create sequence sec_calificaciones
start with 1
increment by 1
nomaxvalue;


---AQUI YA VIENE EL PROCEDIMIENTO!!!
CREATE OR REPLACE PROCEDURE GUARDAR_CALIFICACIONES(
my_id_calificacion out integer,
my_materia in varchar2,
my_valor in float

)
as
begin
select sec_calificaciones.nextval into my_id_calificacion from dual;--dual tabla virtual
insert into calificaciones values (my_id_calificacion,my_materia,my_valor);
end;
/

----probar el procedimiento
declare 
valor integer;
begin
guardar_calificaciones(valor,'java 2 ',3.5);
end;
/

declare 
valor integer;
begin
guardar_calificaciones(valor,'java 3 ',6.8);
end;
/

declare 
valor integer;
begin
guardar_calificaciones(valor,'B.D 2',7.5);
end;
/

declare 
valor integer;
begin
guardar_calificaciones(valor,'pds ',4.2);
end;
/
declare 
valor integer;
begin
guardar_calificaciones(valor,'Fund neg ',10);
end;
/




---verificamos
select * from calificaciones;
delete from calificaciones where id_calificacion=2;
select count(*) from calificaciones; 


----ejemplo de curssor explicito con la tabla calificaciones
declare
cursor cur_calif is select * from calificaciones;
begin
for rec in cur_calif loop--hace busqueda desde primer fila hasta la ultima columna--en rec se deposita toda una fila
dbms_output.put_line('EJEMPLO DE CURSOR EXPLICITO'||rec.valor|| 'materia '||rec.materia );
end loop;
end;
/

set serveroutput or;



-- cursor para actualizar calificaciones a 5--
declare 
cursor cur_2 is select * from calificaciones for update;
begin 
 for rec in cur_2 loop
 
  if rec.valor <5 then 
  update calificaciones set valor=5 where current of cur_2;
  end if;
 end loop;
end;
/

--cursor para subir o bajar calificacion al digito proximo
declare
cursor cur_3 is select * from calificaciones for update;
begin
 for rec in cur_3 loop
  
  if rec.valor <...  then 
  update calificaciones set valor .... where current of cur_3;
  end if;
  end loop;
  end;
  /
  