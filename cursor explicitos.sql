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
guardar_calificaciones(valor,'java 2',6);
end;
/

declare 
valor integer;
begin
guardar_calificaciones(valor,'redes',8);
end;
/
---verificamos
select*from calificaciones;
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
