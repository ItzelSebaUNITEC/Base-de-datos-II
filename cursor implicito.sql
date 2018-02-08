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

