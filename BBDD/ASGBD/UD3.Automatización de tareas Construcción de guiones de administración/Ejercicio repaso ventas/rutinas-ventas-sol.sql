use ventas;
/* 1. Crea una función que devuelva el siguiente número de departamento que se deberá asignar cuando se registre
un nuevo departamento (que funcione como un auto_increment para el dep_no), es decir, cuando se llama a la
función, devolverá el máximo número de departamento existente en la tabla más 1.*/
drop function if exists fn_auto_coddepto;
delimiter /
create function fn_auto_coddepto() returns int
deterministic
begin
	declare v_maximo int;
    select max(dep_no) into v_maximo from departamentos ;
    return v_maximo +1;
end;
/
delimiter ;
select fn_auto_coddepto();

/* 2. Crea una función que devuelva el nombre del jefe de un empleado. La función aceptará como parámetro un
número de empleado y buscará el nombre del jefe de ese empleado y devolverá ese valor. */
drop function if exists fn_busca_jefe;
delimiter /
create function fn_busca_jefe(p_emp smallint(4)) returns varchar(100)
deterministic
begin
	declare v_cod_director smallint(4);
    declare v_nom_director varchar(100);
    select director into v_cod_director from empleados
    where emp_no=p_emp;
    select apellido into v_nom_director from empleados
    where emp_no=v_cod_director;
-- otra opcion:
--    select dir.apellido into v_nom_director from empleados emp, empleados dir 
--    where emp.emp_no=p_emp and emp.director=dir.emp_no;
    return v_nom_director;
end/
delimiter ;
select fn_busca_jefe(39);

/* 3. Modifica la función anterior para que en caso de que no encuentre un jefe válido devuelva el valor “Jefe no
encontrado”. */
drop function if exists fn_busca_jefe;
delimiter /
create function fn_busca_jefe(p_emp smallint(4)) returns varchar(100)
begin
	declare v_cod_director smallint(4);
    declare v_nom_director varchar(100);
    select director into v_cod_director from empleados
    where emp_no=p_emp;
    select apellido into v_nom_director from empleados
    where emp_no=v_cod_director;
    return ifnull(v_nom_director,'Jefe no encontrado');
-- equivale a:
-- 	if v_nom_director is null then 
-- 		return 'Jefe no encontrado';
-- 	else 
-- 		return v_nom_director;
-- 	end if;
end;
/
delimiter ;
select fn_busca_jefe(39);

/* 4. Desarrollar un procedimiento que visualice el apellido, el nombre del jefe y la fecha de alta de todos los
empleados ordenados por apellido. Para mostrar el nombre del jefe deberá utilizar la función creada en el
ejercicio 3. */
drop procedure if exists pr_muestra_emp;
delimiter /
create procedure pr_muestra_emp()
	begin
		select emp.emp_no,emp.apellido, fn_busca_jefe(emp.emp_no) ,emp.fecha_alta from empleados emp order by apellido;
    end;
/
delimiter ;
call pr_muestra_emp();

/*5. Escribir un procedimiento que reciba una cadena y visualice el apellido y el número de empleado de todos los
empleados cuyo apellido contenga la cadena especificada. Al finalizar mostrará el número de empleados
incluidos en el listado. */
drop procedure if exists pr_busca_emp;
delimiter /
create procedure pr_busca_emp(p_cadena varchar(50))
begin
	select emp.apellido, emp.emp_no from empleados emp where apellido like concat('%',p_cadena,'%');
    select count(*) from empleados where apellido like concat('%',p_cadena,'%');
end
/
call pr_busca_emp ('ma');

drop procedure if exists pr_busca_emp2;
delimiter /
create procedure pr_busca_emp2(p_cadena varchar(50))
begin
	declare v_apellido varchar(100);
    declare v_empno smallint(4);
    declare v_fin int default 0;
    declare v_cont int default 0;
	declare c_listado cursor for select emp.apellido, emp.emp_no from empleados emp where apellido like concat('%',p_cadena,'%');
    declare continue handler for not found set v_fin=1;
    
    open c_listado;
    inicio_loop:loop
		fetch c_listado into v_apellido,v_empno;
        if v_fin=1 then leave inicio_loop;
        end if;
		select v_apellido,v_empno;
        set v_cont=v_cont +1;        
	end loop;
    close c_listado;
    select concat('Se han mostrado ',v_cont,' empleados');
end
/
delimiter ;

call pr_busca_emp2 ('ma');
-- 6. Escribir un programa que visualice el apellido y el salario de los cinco empleados que tienen el salario más alto.
drop procedure if exists pr_ver_datos_emp;
delimiter /
create procedure pr_ver_datos_emp()
begin
	declare v_apellido varchar(100);
    declare v_salario decimal(8,2);
    declare v_cont int default 0;
	declare c_listado cursor for 
		select emp.apellido, emp.salario from empleados emp order by salario desc;
    declare continue handler for not found set v_cont=5;
    
    open c_listado;
    inicio_loop:loop
		fetch c_listado into v_apellido,v_salario;
        if v_cont>=5 then leave inicio_loop;
        end if;
		select v_apellido,v_salario;
        set v_cont=v_cont +1;        
	end loop;
    close c_listado;
end
/
delimiter ;
call pr_ver_datos_emp();

-- 7. Codifica un procedimiento que muestre el nombre de cada departamento y el número de empleados que tiene.
drop function if exists fn_cuenta_emp;
delimiter /
create function fn_cuenta_emp(p_coddepto int) returns int
DETERMINISTIC
begin
	declare v_numemp int;
	select count(emp.emp_no) into v_numemp from empleados emp where emp.dep_no=p_coddepto;
    return v_numemp;
end;
/
drop procedure if exists pr_emps_departamento;
delimiter /
create procedure pr_emps_departamento()
begin
	select departamentos.dnombre, fn_cuenta_emp(departamentos.dep_no) from departamentos;
end;
/

delimiter ;
call pr_emps_departamento();

/* 8. Modifica el procedimiento anterior para que tras mostrar el nombre y número de empleados de cada departamento 
muestre un listado de los nombres de todos los empleados de ese departamento.*/
drop procedure if exists pr_emps_departamento2;
delimiter /
create procedure pr_emps_departamento2()
begin
	declare v_coddepto int;
	declare v_salir int default 0;
    declare v_nomdepto varchar(100);
    declare v_numemp int;
    declare v_apellido varchar(100);
	declare c_listado cursor for
		select dpt.dep_no,dpt.dnombre, fn_cuenta_emp(dpt.dep_no) from departamentos dpt;
	declare c_empleados cursor for
		select emp.apellido from empleados emp where emp.dep_no=v_coddepto;
	declare continue handler for not found set v_salir=1;
    open c_listado;
    inicio_loop:loop
		fetch c_listado into v_coddepto,v_nomdepto,v_numemp;
        if v_salir=1 then leave inicio_loop;
        end if;       
		select v_nomdepto,v_numemp;
		open c_empleados;
		loopempleados:loop
			fetch c_empleados into v_apellido;
            if v_salir=1 then 
				set v_salir=0;
                leave loopempleados;
			end if;
            select v_apellido;
		end loop;
        close c_empleados;
	end loop;
    close c_listado;
end;
/
delimiter ;
call pr_emps_departamento2();

/*9. Crea un procedimiento que acepte un número de departamento como argumento y visualice todos los datos de
los empleados que trabajan en ese departamento. */
drop procedure pr_muestra_emp;
delimiter /
create procedure pr_muestra_emp (in p_depto int)
	begin
		declare v_salir int default 0;
        declare v_EMP_NO int;
		declare v_APELLIDO varchar(100);
		declare v_DIRECTOR int;
		declare v_FECHA_ALTA date;
		declare v_SALARIO numeric(8,2);
		declare v_COMISION numeric(8,2);
		declare v_DEP_NO int;
		declare v_TELEFONO varchar(15);
		declare v_codpuesto int;
		declare c_empleados cursor for
			select EMP_NO,APELLIDO,DIRECTOR, FECHA_ALTA, SALARIO, COMISION, DEP_NO, TELEFONO, codpuesto 
            from empleados emp where emp.dep_no=p_depto;
		declare continue handler for not found set v_salir = 1;
        declare continue handler for sqlexception select 'error';
		open c_empleados;
		empleados_loop:loop
			fetch c_empleados into v_EMP_NO,v_APELLIDO,v_DIRECTOR, v_FECHA_ALTA, v_SALARIO, v_COMISION, v_DEP_NO, v_TELEFONO, v_codpuesto;
			if v_salir = 1 then
				leave empleados_loop;
			end if;
            select v_EMP_NO,v_APELLIDO,v_DIRECTOR, v_FECHA_ALTA, v_SALARIO, v_COMISION, v_DEP_NO, v_TELEFONO, v_codpuesto;
		end loop;
        close c_empleados;
end;
/
delimiter ;
call pr_muestra_emp(20);
select * from empleados;
-- 10. Crea un procedimiento que acepte un número de departamento y devuelva mediante dos parámetros de tipo OUT su nombre y localidad.
drop procedure if exists pr_departamento;
delimiter /
create procedure pr_departamento(in p_dep_no int, out p_nombre varchar(100), out p_localidad varchar(100))
begin
	select dnombre,localidad into p_nombre,p_localidad from departamentos where dep_no=p_dep_no;
end;
/
delimiter ;
call pr_departamento(20,@nombre,@localidad);
select @nombre,@localidad;
select * from departamentos;
/* 11. Crea un procedimiento que reciba como parámetro una localidad y cree automáticamente 1 departamento en
esa localidad con los siguientes valores:
	a. número de departamento: será el valor devuelto por la función creada en el ejercicio 1
	b. nombre: el nombre del departamento tendrá el formato “departamento X“, siendo X el valor asignado como número de departamento.
	c. Localidad: se asignará el valor pasado como parámetro. */
drop procedure pr_crea_depto;
delimiter /
create procedure pr_crea_depto(in p_localidad varchar(100))
begin
	insert into departamentos(dep_no,dnombre,localidad) values (fn_auto_coddepto(),concat('Departamento ',fn_auto_coddepto()),p_localidad);
end;
/
delimiter ;
call pr_crea_depto('Vigo');

/* 12. Crea un procedimiento al que se pase como parámetro un número de departamento y cree 3 empleados en ese
departamento con la siguiente información:
	a. EMP_NO: se debe cubrir por medio de una función similar a la empleada para el código del departamento.
	b. APELLIDO: se asignará la cadena “desconocido”.
	c. OFICIO: se asignará a los tres empleados el oficio que menos empleados de la empresa tengan.
	d. DIRECTOR: se les asignará como director al jefe de la empresa (al empleado que no tenga ningún jefe).
	e. FECHA_ALTA: fecha actual.
	f. SALARIO: se les asignará el salario mínimo de la empresa (el menor salario que haya en la empresa).
	g. COMISION: nula
	h. DEP_NO: se asignará el número de departamento que se pase como parámetro.
	i. TELEFONO: nulo */
drop function if exists fn_auto_codemp;
delimiter /
create function fn_auto_codemp() returns int
deterministic
begin
	declare v_max int;
    select max(emp_no) into v_max from empleados ;
    return v_max +1;
end;
/
delimiter ;
drop procedure if exists pr_crea_emp;
delimiter /
create procedure pr_crea_emp(p_num_dep int )
begin
	declare v_cont int default 1;
	declare v_oficio varchar(100);
	declare v_jefe int;
	declare v_salario numeric(8,2);
	declare v_numemp int;
	select min(salario) into v_salario from empleados;
    select emp_no into v_jefe from empleados where director is null;
    while v_cont<=3 do
		select oficio,count(*) into v_oficio,v_numemp from empleados group by oficio order by 2 asc limit 1;
		insert into empleados(EMP_NO,APELLIDO,OFICIO,DIRECTOR,FECHA_ALTA,SALARIO,COMISION,DEP_NO,TELEFONO)
		values (fn_auto_codemp(),'desconocido',v_oficio,v_jefe,date(now()),v_salario,null,p_num_dep,null);
        set v_cont=v_cont+1;
	end while;
end;
/
delimiter ;
call pr_crea_emp(42);
select * from empleados where dep_no=41;
  desc empleados;  
/* 13. Modifica el procedimiento anterior para que si le pasamos un número de departamento que no exista, en lugar de abortar al
tratar de insertar un empleado en un departamento no existente, devuelva el error ‘Departamento no
existente’ y finalice correctamente (sin abortar). */
drop procedure if exists pr_crea_emp;
delimiter /
create procedure pr_crea_emp(p_num_dep int )
begin
	declare v_cont int default 1;
	declare v_oficio varchar(100);
	declare v_jefe int;
	declare v_salario numeric(8,2);
	declare v_numemp int;
    -- opcion 1:
    -- declare exit handler for 1452 select 'Departamento no existente';
    -- opcion 2:
    declare v_numdepto int;
    select count(*) into v_numdepto from departamentos where dep_no=p_num_dep;
    if v_numdepto=0 then 
		select 'Departamento no existente';
	else
		select min(salario) into v_salario from empleados;
		select emp_no into v_jefe from empleados where director is null;
		while v_cont<=3 do
			select oficio,count(*) into v_oficio,v_numemp from empleados group by oficio order by 2 asc limit 1;
			insert into empleados(EMP_NO,APELLIDO,OFICIO,DIRECTOR,FECHA_ALTA,SALARIO,COMISION,DEP_NO,TELEFONO)
			values (fn_auto_codemp(),'desconocido',v_oficio,v_jefe,date(now()),v_salario,null,p_num_dep,null);
			set v_cont=v_cont+1;
		end while;
	end if;
end;
/
delimiter ;
call pr_crea_emp(42);

/* 14. Modifica el procedimiento anterior para que no falle en caso de que no exista ningún oficio en la BD (al buscar
el menos repetido no devolvería nada y trataría de insertar un oficio nulo). En este caso debería devolver el
error ‘No es posible insertar un empleado sin oficio’ y finalizar. */
drop procedure if exists pr_crea_emp;
delimiter /
create procedure pr_crea_emp(p_num_dep int )
begin
	declare v_cont int default 1;
	declare v_oficio varchar(100);
	declare v_jefe int;
	declare v_salario numeric(8,2);
	declare v_numemp int;
    declare exit handler for 1452 select 'Departamento no existente';
    declare exit handler for 1048 select 'No es posible insertar un empleado sin oficio';
	select min(salario) into v_salario from empleados;
	select emp_no into v_jefe from empleados where director is null;
	while v_cont<=3 do
		select oficio,count(*) into v_oficio,v_numemp from empleados group by oficio order by 2 asc limit 1;
		insert into empleados(EMP_NO,APELLIDO,OFICIO,DIRECTOR,FECHA_ALTA,SALARIO,COMISION,DEP_NO,TELEFONO)
		values (fn_auto_codemp(),'desconocido',v_oficio,v_jefe,date(now()),v_salario,null,p_num_dep,null);
		set v_cont=v_cont+1;
	end while;
end;
/
delimiter ;
call pr_crea_emp(41);

/* 15. Crea un procedimiento que busque los departamentos que no tienen ningún empleado, y en cada uno de ellos
inserte 3 empleados empleando el procedimiento anterior. */
drop procedure pr_ficha_empleados;
delimiter /
create procedure pr_ficha_empleados()
	begin
		declare v_dep_no int;
        declare v_salir int default 0;
        declare c_dep cursor for 
			select dep_no from departamentos dep 
			where not exists(select 1 from empleados emp where emp.dep_no=dep.dep_no);
        declare continue handler for not found set v_salir=1;
        open c_dep;
        inicio:loop
			fetch c_dep into v_dep_no;
            if v_salir=1 then leave inicio;
            end if;
            call pr_crea_emp (v_dep_no);
		end loop;
        close c_dep;
	end;
/
delimiter ;
call pr_ficha_empleados();
select * from empleados where dep_no in (41,42,43);
select * from empleados;

select * from departamentos;
select dep_no from empleados; 

/* 16. Crea un trigger en la tabla empleados que asigne automáticamente la fecha actual al empleado en la fecha de
contratación si la fecha de contratación que se ha indicado es nula. */
drop trigger if exists tg_comprueba_emp;
delimiter /
create trigger tg_comprueba_emp before insert on empleados
for each row
begin
		if new.fecha_alta is null then 
			set new.fecha_alta=date(now());
		end if;
        -- opcion 2: 
        -- set new.fecha_alta=ifnull(new.fecha_alta,date(now()));
end;
/
delimiter ;
-- PENDIENTE DE COMPROBAR:
insert into empleados(EMP_NO,APELLIDO,OFICIO,DIRECTOR,FECHA_ALTA,SALARIO,COMISION,DEP_NO,TELEFONO)
values(8999,'DESCOR','VENDEDOR',7698,null,180000,null,30,null);
select * from empleados where EMP_NO=8999;

-- 17. Modifica el trigger anterior para que impida insertar empleados con número de empleado mayor que 1000.
drop trigger if exists tg_comprueba_emp;
delimiter /
create trigger tg_comprueba_emp before insert on empleados
for each row
begin
	if new.EMP_NO>1000 then
		SIGNAL SQLSTATE '42S02' SET MESSAGE_TEXT ='el id es demasiado alto';
    end if;
	if new.fecha_alta is null then 
		set new.fecha_alta=date(now());
	end if;
    -- opcion 2: 
    -- set new.fecha_alta=ifnull(new.fecha_alta,date(now()));
end;
/
delimiter ;

-- 18. ¿Qué ocurriría si en lugar de modificar el trigger anterior creas un nuevo trigger before insert en empleados?
delimiter /
create trigger tg_comprueba_emp2 before insert on empleados
for each row
begin
	if new.EMP_NO>1000 then
		SIGNAL SQLSTATE '42S02' SET MESSAGE_TEXT ='el id es demasiado alto';
    end if;
end;
/
delimiter ;

/* 19. Añade un campo “importe” en la tabla PEDIDO de tipo numeric(9,2). Crea un disparador que se ejecute cada
vez que se inserte o modifique una fila en la tabla PEDIDO que calcule el valor del campo importe de la
siguiente manera: importe=precio del producto por cantidad. El precio del producto tendrás que buscarlo en la
tabla PRODUTO. */
alter table pedidos add importe numeric(9,2);
drop trigger if exists tg_ACTUALIZA_IMPORTE_ped;
delimiter /
create trigger tg_ACTUALIZA_IMPORTE_ped before insert on pedidos
for each row
begin
	declare v_precio double;
	select precio_actual into v_precio from productos where PRODUCTO_NO=new.PRODUCTO_NO;
    set new.importe=v_precio*new.unidades;
end;
/
delimiter ;
desc pedidos;
select * from pedidos where PEDIDO_NO=1018;
insert into pedidos (PEDIDO_NO,PRODUCTO_NO,CLIENTE_NO,unidades,fecha_pedido,importe)
values (1018,20,105,2,'2000-01-20 00:00:00',null);
select precio_actual*2 from productos where PRODUCTO_NO=20;-- 134000

/* 20. Crea una tabla empleados_historico que guarde los registros de los empleados borrados; junto con los atributos
del empleado cada registro guardará el nombre del usuario que hace el borrado y la fecha de borrado. Crea un
trigger que se ejecute antes de hacer el borrado de un empleado y guarde en la tabla empleados_historico cada
empleado que es borrado.*/
create table empleados_historico like empleados;
alter table empleados_historico add usuario varchar(100);
alter table empleados_historico add fecborrado timestamp;
drop trigger if exists tg_historico_emp;
delimiter /
create trigger tg_historico_emp before delete on empleados
for each row
begin
	insert into empleados_historico(EMP_NO,APELLIDO,OFICIO,DIRECTOR,FECHA_ALTA,SALARIO,COMISION,DEP_NO,
		TELEFONO,usuario,fecborrado)
	values(old.EMP_NO,old.APELLIDO,old.OFICIO,old.DIRECTOR,old.FECHA_ALTA,old.SALARIO,old.COMISION,old.DEP_NO,
		old.TELEFONO,user(),now());
end;
/
delimiter ;
start transaction;
delete from empleados where EMP_NO=1000;
select * from empleados_historico;
rollback;
select * from empleados_historico;
select * from empleados;

/* 21. Crea un TRIGGER BEFORE INSERT que cuando se inserte un empleado sin salario le asigne el salario más bajo de
cualquier empleado de la empresa (calculado sin tener en cuenta los salarios NULL o 0).*/
-- reutilizamos el del ejercicio 17 que ya se ejecutaba before insert on empleados
drop trigger if exists tg_comprueba_emp;
delimiter /
create trigger tg_comprueba_emp before insert on empleados
for each row
begin	
	declare v_salario double;
	if new.salario is null or new.salario=0 then
		select min(salario) into v_salario from empleados where salario>0 and salario is not null;
        set new.salario=v_salario;
	end if;
	if new.EMP_NO>1000 then
		SIGNAL SQLSTATE '42S02' SET MESSAGE_TEXT ='el id es demasiado alto';
    end if;
	if new.fecha_alta is null then 
		set new.fecha_alta=date(now());
	end if;
end;
/
delimiter ;
insert into empleados(EMP_NO,APELLIDO,OFICIO,DIRECTOR,FECHA_ALTA,SALARIO,COMISION,DEP_NO,TELEFONO)
values(1,'DESCOR','VENDEDOR',7698,null,0,null,30,null);
select * from empleados where EMP_NO=1;

/* 22. Elabora un mecanismo que impida que se inserte un registro en la tabla de pedidos cuando el número de
unidades pedidas de un producto supera el stock disponible de ese producto. Además mostrará un mensaje
indicando que no se puede realizar el pedido por falta de stock. En caso de que se pueda realizar el pedido
restará al stock del producto la cantidad comprada en el pedido.*/
-- reutilizamos el del ejercicio 19 que ya se ejecuta before insert on pedidos
drop trigger if exists tg_ACTUALIZA_IMPORTE_ped;
delimiter /
create trigger tg_ACTUALIZA_IMPORTE_ped before insert on pedidos
for each row
begin
	declare v_precio double;
    declare v_stock double;
	select precio_actual, stock_disponible  into v_precio, v_stock from productos where PRODUCTO_NO=new.PRODUCTO_NO;
    if new.unidades>v_stock then 
		SIGNAL SQLSTATE '42S02' SET MESSAGE_TEXT ='no hay tantos productos';
    end if;
    set new.importe=v_precio*new.unidades;
end;
/
delimiter ;
desc productos;

insert into pedidos (PEDIDO_NO,PRODUCTO_NO,CLIENTE_NO,unidades,fecha_pedido,importe)
values (1018,20,105,25,'2000-01-20 00:00:00',null);

-- 23. Indica cómo se puede conseguir lo siguiente: Deseamos evitar que se borre un empleado mientras sea jefe 
-- de otros empleados
create trigger; XXX -> no, los triggers no son pa esto;
alter table empleados add constraint fk_emp_jefe foreign key (DIRECTOR) references empleados(EMP_NO) on delete restrict;

/* 24. Indica cómo se puede conseguir lo siguiente: Deseamos evitar que un empleado pueda ser jefe de más de 3
empleados (no se permitirá modificar a un empleado si su nuevo jefe ya tiene 3 subordinados,
además mostrará un mensaje de error apropiado) */
drop trigger if exists tg_actualiza_emp;
delimiter /
create trigger tg_actualiza_emp before update on empleados
for each row
begin
	declare v_cuenta_emps int;
    select count(*) into v_cuenta_emps from empleados where DIRECTOR=new.DIRECTOR;
    if v_cuenta_emps>=3 then
		signal sqlstate '42000' set MESSAGE_TEXT='Ese jefe ya tiene tres subordinados';
	end if;
end;
/
delimiter ;
desc empleados;
select DIRECTOR,count(*) from empleados group by DIRECTOR;
update empleados set DIRECTOR=7698 where EMP_NO=1;
select * from empleados where EMP_NO=1;

/* 25. Indica cómo se puede conseguir lo siguiente: Deseamos evitar que por error se introduzca el mismo producto
varias veces en la tabla de productos (aunque sea de distintos fabricantes).*/
alter table productos add constraint uq_nombre unique (descripcion);
-- los triggers tampoco son para esto!!!


