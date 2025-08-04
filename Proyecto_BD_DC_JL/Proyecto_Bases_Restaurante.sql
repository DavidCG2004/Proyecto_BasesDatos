create database restaurante_bd;
use restaurante_bd;

-- Parte 1 DC

-- tabla: clientes
create table clientes (
    id_cliente int primary key auto_increment,
    nombre varchar(100) not null,
    telefono varchar(20),
    correo varchar(100) unique,
    fecha_registro timestamp default current_timestamp
);

-- tabla: roles_empleado (catálogo)
create table roles_empleado (
    id_rol int primary key auto_increment,
    nombre_rol varchar(50) unique not null
);

-- tabla: empleados
create table empleados (
    id_empleado int primary key auto_increment,
    nombre varchar(100) not null,
    id_rol int not null,
    fecha_contratacion date not null,
    salario decimal(10,2) not null check (salario > 0),
    foreign key (id_rol) references roles_empleado(id_rol)
);

-- tabla: mesas
create table mesas (
    id_mesa int primary key auto_increment,
    capacidad int not null check (capacidad > 0),
    ubicacion varchar(100),
    estado varchar(20) default 'disponible' 
	check (estado in ('disponible', 'ocupada', 'reservada'))
);

-- tabla: categorias_plato (catalogo)
create table categorias_plato (
    id_categoria int primary key auto_increment,
    nombre_categoria varchar(50) unique not null
);

-- tabla: platos
create table platos (
    id_plato int primary key auto_increment,
    nombre varchar(100) not null,
    descripcion text,
    precio decimal(6,2) not null check (precio > 0),
    id_categoria int not null,
    foreign key (id_categoria) references categorias_plato(id_categoria)
);

-- tabla: ingredientes
create table ingredientes (
    id_ingrediente int primary key auto_increment,
    nombre varchar(100) not null,
    stock_actual int not null default 0,
    unidad varchar(20) not null,
	fecha_actualizacion datetime default current_timestamp
);

-- tabla: plato_ingredientes (relación muchos a muchos)
create table plato_ingredientes (
    id_plato int,
    id_ingrediente int,
    cantidad decimal(6,2) not null,
    unidad varchar(20),
    primary key (id_plato, id_ingrediente),
    foreign key (id_plato) references platos(id_plato),
    foreign key (id_ingrediente) references ingredientes(id_ingrediente)
);

-- tabla: comandas
create table comandas (
    id_comanda int primary key auto_increment,
    id_mesa int not null,
    id_empleado int not null,
    fecha_hora datetime default current_timestamp,
    estado varchar(30) default 'solicitado' 
	check (estado in ('solicitado', 'en cocina', 'servido', 'cancelado')),
    foreign key (id_mesa) references mesas(id_mesa),
    foreign key (id_empleado) references empleados(id_empleado)
);

-- tabla: detalle_comanda
create table detalle_comanda (
    id_comanda int,
    id_plato int,
    cantidad int not null check (cantidad > 0),
    observaciones text,
    primary key (id_comanda, id_plato),
    foreign key (id_comanda) references comandas(id_comanda) on delete cascade,
    foreign key (id_plato) references platos(id_plato)
);

-- tabla: formas_pago (catalogo)
create table formas_pago (
    id_forma_pago int primary key auto_increment,
    nombre_forma varchar(50) unique not null
);

-- tabla: facturas
create table facturas (
    id_factura int primary key auto_increment,
    id_comanda int unique not null,
    id_cliente int,
    id_forma_pago int,
    fecha datetime default current_timestamp,
    total decimal(10,2),
    propina decimal(6,2) default 0,
    foreign key (id_comanda) references comandas(id_comanda),
    foreign key (id_cliente) references clientes(id_cliente),
    foreign key (id_forma_pago) references formas_pago(id_forma_pago)
);

-- tabla: turnos_empleados
create table turnos_empleados (
    id_turno int primary key auto_increment,
    id_empleado int not null,
    fecha date not null,
    hora_inicio time not null,
    hora_fin time not null,
    foreign key (id_empleado) references empleados(id_empleado)
);

-- tabla: historial_stock
create table historial_stock (
    id_historial int primary key auto_increment,
    id_ingrediente int not null,
    fecha_movimiento datetime default current_timestamp,
    cantidad int,
    tipo_movimiento varchar(20) 
	check (tipo_movimiento in ('entrada', 'salida')),
    foreign key (id_ingrediente) references ingredientes(id_ingrediente)
);

-- tabla: promociones
create table promociones (
    id_promocion int primary key auto_increment,
    descripcion text not null,
    descuento_porcentaje decimal(5,2) 
	check (descuento_porcentaje > 0 and descuento_porcentaje <= 100),
    fecha_inicio date not null,
    fecha_fin date not null
);

-- tabla: platos_promocion (relacion muchos a muchos)
create table platos_promocion (
    id_plato int,
    id_promocion int,
    primary key (id_plato, id_promocion),
    foreign key (id_plato) references platos(id_plato),
    foreign key (id_promocion) references promociones(id_promocion)
);

-- tabla: log_acciones (auditoria)
create table log_acciones (
    id_log int primary key auto_increment,
    usuario varchar(100),
    ip_origen varchar(50),
    fecha datetime default current_timestamp,
    accion varchar(50),
    tabla_afectada varchar(50),
    id_afectado int,
    descripcion text
);

-- Ingreso de datos 

-- tabla: roles_empleado
insert into roles_empleado (nombre_rol) values 
('mesero'), ('cocinero'), ('gerente'), ('cajero'), ('administrador');


-- tabla: empleados
insert into empleados (nombre, id_rol, fecha_contratacion, salario) values
('juan perez', 1, '2022-01-10', 800.00),
('ana lopez', 2, '2021-11-20', 950.00),
('mario ruiz', 3, '2020-06-15', 1200.00),
('carla moreno', 4, '2023-03-05', 750.00),
('sofia jimenez', 5, '2019-09-01', 1300.00);


-- tabla: clientes
insert into clientes (nombre, telefono, correo) values
('pedro salazar', '0987654321', 'pedro@example.com'),
('lucia vallejo', '0971234567', 'lucia@example.com'),
('andres almeida', '0968889999', 'andres@example.com'),
('karina morales', '0953332211', 'karina@example.com'),
('roberto suarez', '0944445566', 'roberto@example.com');

-- tabla: formas_pago
insert into formas_pago (nombre_forma) values 
('efectivo'), ('tarjeta'), ('transferencia'), ('cheque');


-- tabla: mesas
insert into mesas (capacidad, ubicacion, estado) values
(4, 'salon principal', 'disponible'),
(2, 'terraza', 'reservada'),
(6, 'vip', 'ocupada'),
(4, 'salon secundario', 'disponible'),
(8, 'zona familiar', 'ocupada');


-- tabla: categorias_plato
insert into categorias_plato (nombre_categoria) values
('entrada'), ('plato fuerte'), ('postre'), ('bebida'), ('especial');


-- tabla: platos
insert into platos (nombre, descripcion, precio, id_categoria) values
('ensalada mixta', 'ensalada con vegetales frescos', 4.50, 1),
('lomo saltado', 'carne con papas fritas y arroz', 8.90, 2),
('helado de vainilla', 'porción de helado con toppings', 3.20, 3),
('jugo natural', 'jugo de frutas de temporada', 2.00, 4),
('combo ejecutivo', 'plato completo con bebida', 10.00, 5);


-- tabla: ingredientes
insert into ingredientes (nombre, stock_actual, unidad) values
('lechuga', 100, 'unidades'),
('carne de res', 50, 'kg'),
('papas', 200, 'kg'),
('helado', 30, 'litros'),
('frutas mixtas', 60, 'kg');



-- tabla: plato_ingredientes
insert into plato_ingredientes (id_plato, id_ingrediente, cantidad, unidad) values
(1, 1, 1.00, 'unidad'),
(2, 2, 0.25, 'kg'),
(2, 3, 0.30, 'kg'),
(3, 4, 0.15, 'litros'),
(4, 5, 0.20, 'kg');


-- tabla: comandas
insert into comandas (id_mesa, id_empleado, estado) values
(1, 1, 'solicitado'),
(2, 1, 'en cocina'),
(3, 2, 'servido'),
(4, 1, 'cancelado'),
(5, 2, 'solicitado');


-- tabla: detalle_comanda
insert into detalle_comanda (id_comanda, id_plato, cantidad, observaciones) values
(1, 1, 2, 'sin cebolla'),
(1, 4, 2, null),
(2, 2, 1, 'sin picante'),
(3, 3, 3, 'extra dulce'),
(4, 5, 1, null);



-- tabla: promociones
insert into promociones (descripcion, descuento_porcentaje, fecha_inicio, fecha_fin) values
('descuento almuerzos', 10.00, '2025-07-01', '2025-07-31'),
('2x1 postres', 50.00, '2025-07-15', '2025-08-15'),
('jugo gratis por plato fuerte', 100.00, '2025-07-10', '2025-07-30'),
('martes de helado', 20.00, '2025-07-01', '2025-08-31'),
('combo ejecutivo promo', 15.00, '2025-07-20', '2025-08-20');


-- tabla: platos_promocion
insert into platos_promocion (id_plato, id_promocion) values
(2, 1),
(3, 2),
(4, 3),
(3, 4),
(5, 5);

-- tabla: facturas
insert into facturas (id_comanda, id_cliente, id_forma_pago, total, propina) values
(1, 1, 1, 13.00, 1.00),
(2, 2, 2, 8.90, 0.50),
(3, 3, 3, 9.60, 1.00),
(4, 4, 4, 10.00, 0.00),
(5, 5, 1, 11.00, 1.50);


-- tabla: turnos_empleados
insert into turnos_empleados (id_empleado, fecha, hora_inicio, hora_fin) values
(1, '2025-07-27', '08:00:00', '16:00:00'),
(2, '2025-07-27', '10:00:00', '18:00:00'),
(3, '2025-07-27', '09:00:00', '17:00:00'),
(4, '2025-07-27', '12:00:00', '20:00:00'),
(5, '2025-07-27', '08:00:00', '14:00:00');

-- tabla: historial_stock
insert into historial_stock (id_ingrediente, cantidad, tipo_movimiento) values
(1, 20, 'entrada'),
(2, 5, 'salida'),
(3, 10, 'entrada'),
(4, 3, 'salida'),
(5, 15, 'entrada');

-- Procedimientos almacenados: 
-- Procedimiento para agregar a detalle_comanda
delimiter //
create procedure sp_agregar_plato_a_comanda(
    in p_id_comanda int,
    in p_id_plato int,
    in p_cantidad int,
    in p_observaciones text
)
begin
    declare v_estado_comanda varchar(30);
    select estado into v_estado_comanda from comandas where id_comanda = p_id_comanda;
    if v_estado_comanda is null then
        signal sqlstate '45000' set message_text = 'error: la comanda especificada no existe.';
    elseif v_estado_comanda != 'solicitado' then
        signal sqlstate '45000' set message_text = 'error: no se pueden añadir platos. la comanda ya está en cocina o servida.';
    elseif not exists (select 1 from platos where id_plato = p_id_plato) then
        signal sqlstate '45000' set message_text = 'error: el plato especificado no existe.';
    else
        insert into detalle_comanda (id_comanda, id_plato, cantidad, observaciones)
        values (p_id_comanda, p_id_plato, p_cantidad, p_observaciones)
        on duplicate key update 
            cantidad = cantidad + p_cantidad,
            observaciones = concat(observaciones, ' | adición: ', p_observaciones);
        select 'plato agregado a la comanda correctamente.' as resultado;
    end if;
end //
delimiter ;

CALL sp_agregar_plato_a_comanda(1, 5, 2, 'Extra queso, sin cebolla.');

Select * from detalle_comanda;


-- Procedimiento para aplicar descuento a categoria
delimiter //
create procedure sp_aplicar_descuento_por_categoria (
    in p_id_categoria int,
    in p_porcentaje_descuento decimal(5,2)
)
begin
    declare v_error boolean default false;
    if p_porcentaje_descuento <= 0 or p_porcentaje_descuento > 100 then
        signal sqlstate '45000' set message_text = 'error: el porcentaje de descuento debe ser mayor que 0 y menor o igual a 100.';
    elseif not exists (select 1 from categorias_plato where id_categoria = p_id_categoria) then
        signal sqlstate '45000' set message_text = 'error: la categoría especificada no existe.';
    else
        update platos
        set precio_original = case
            when precio_original is null then precio
            else precio_original
        end
        where id_categoria = p_id_categoria;
        
        update platos
        set precio = precio_original - (precio_original * (p_porcentaje_descuento / 100))
        where id_categoria = p_id_categoria and precio_original is not null;
        select concat('descuento del ', p_porcentaje_descuento, '% aplicado a la categoría ', p_id_categoria) as resultado;
    end if;
end;
//
delimiter ;

-- Aplicar 10% de descuento a categoría 2
call sp_aplicar_descuento_por_categoria(2, 10.00);

Select * from platos;


-- Procedimiento para resturar a precio original
delimiter //
create procedure sp_restaurar_precios_por_categoria (
    in p_id_categoria int
)
begin
    if not exists (select 1 from categorias_plato where id_categoria = p_id_categoria) then
        signal sqlstate '45000' set message_text = 'error: la categoría especificada no existe.';
    end if;
    update platos
    set precio = precio_original
    where id_categoria = p_id_categoria
    and precio_original is not null;
    select concat('precios restaurados para la categoría ', p_id_categoria) as resultado;
end;
//
delimiter ;

-- Restaurar los precios originales
call sp_restaurar_precios_por_categoria(2);

select * from platos;



-- Procedimiento para eliminar promociones de forma segura
delimiter //
create procedure sp_cancelar_promocion_segura(
    in p_id_promocion int
)
begin
    if not exists (select 1 from promociones where id_promocion = p_id_promocion) then
        signal sqlstate '45000' set message_text = 'error: la promoción que intenta eliminar no existe.';
    else
        delete from platos_promocion where id_promocion = p_id_promocion;
        delete from promociones where id_promocion = p_id_promocion;
        select 'promoción eliminada correctamente.' as resultado;
    end if;
end //
delimiter ;

call sp_cancelar_promocion_segura(1);
select * from promociones;




-- Procedimiento para eliminar clientes de forma segura
delimiter //
create procedure sp_eliminar_cliente_seguro(
    in p_id_cliente int
)
begin
    declare facturas_count int;
    select count(*) into facturas_count from facturas where id_cliente = p_id_cliente;

    if facturas_count > 0 then
        signal sqlstate '45000' 
        set message_text = 'error: no se puede eliminar el cliente porque tiene facturas asociadas.';
    else
        delete from clientes where id_cliente = p_id_cliente;
        select 'cliente eliminado correctamente.' as 'resultado';
    end if;
end //
delimiter ;

call sp_eliminar_cliente_seguro(5); 
Select * from clientes;


-- Procedimiento para reportes por periodo
delimiter //
create procedure sp_reporte_ventas_periodo(
    in p_fecha_inicio date,
    in p_fecha_fin date)
begin
    select 
        p.nombre as plato,
        c.nombre_categoria as categoria,
        sum(dc.cantidad) as cantidad_vendida,
        sum(dc.cantidad * p.precio) as total_facturado
    from detalle_comanda dc
    inner join platos p on dc.id_plato = p.id_plato
    inner join categorias_plato c on p.id_categoria = c.id_categoria
    inner join comandas cmd on dc.id_comanda = cmd.id_comanda
    inner join facturas f on cmd.id_comanda = f.id_comanda
    where date(f.fecha) between p_fecha_inicio and p_fecha_fin
    group by p.nombre, c.nombre_categoria
    order by total_facturado desc;
end //
delimiter ;

call sp_reporte_ventas_periodo('2025-01-01', '2025-12-31');


-- Procedimiento reporte de productivida de empleados
delimiter //
create procedure sp_reporte_productividad_empleado(
    in p_fecha_inicio date,
    in p_fecha_fin date
)
begin
    select
        e.nombre as nombre_empleado,
        r.nombre_rol as rol,
        count(distinct c.id_comanda) as total_comandas_atendidas,
        count(distinct f.id_factura) as total_facturas_generadas,
        sum(f.total) as monto_total_facturado
    from empleados e
    join roles_empleado r on e.id_rol = r.id_rol
    left join comandas c on e.id_empleado = c.id_empleado and date(c.fecha_hora) between p_fecha_inicio and p_fecha_fin
    left join facturas f on c.id_comanda = f.id_comanda
    group by e.id_empleado, e.nombre, r.nombre_rol
    order by monto_total_facturado desc;
end //
delimiter ;

call sp_reporte_productividad_empleado('2025-01-01', '2025-12-30');


-- Procedimiento con transacciones
delimiter //
create procedure sp_registrar_entrada_stock(
    in p_id_ingrediente int,
    in p_cantidad_entrada int,
    in p_id_usuario_responsable int
)
begin
    declare exit handler for sqlexception
    begin
        rollback;
        resignal;
    end;
    start transaction;
    
    if not exists (select 1 from ingredientes where id_ingrediente = p_id_ingrediente) then
        signal sqlstate '45000' set message_text = 'error: el ingrediente no existe.';
    end if;

    if p_cantidad_entrada <= 0 then
        signal sqlstate '45000' set message_text = 'error: la cantidad de entrada debe ser un número positivo.';
    end if;

    savepoint sp_actualizacion_inventario;

    update ingredientes
    set 
        stock_actual = stock_actual + p_cantidad_entrada,
        fecha_actualizacion = current_timestamp
    where id_ingrediente = p_id_ingrediente;

    insert into historial_stock (id_ingrediente, cantidad, tipo_movimiento)
    values (p_id_ingrediente, p_cantidad_entrada, 'entrada');
    
    commit;
    select 'entrada de stock registrada correctamente.' as resultado;

end //
delimiter ;

call sp_registrar_entrada_stock(1, 25, 1);

Select * from historial_stock;


-- Funciones:
-- Funcion para ver porcentaje de mesas ocupadas
delimiter //
create function fn_porcentaje_mesas_ocupadas()
returns decimal(5,2)
deterministic
reads sql data
begin
    declare total int;
    declare ocupadas int;
    select count(*) into total from mesas;
    select count(*) into ocupadas from mesas where estado = 'ocupada';

    if total = 0 then
        return 0;
    else
        return round((ocupadas * 100.0) / total, 2);
    end if;
end;
//
delimiter ;

select fn_porcentaje_mesas_ocupadas();




-- Funcion para calcular los años de antiguedad de un empleado
delimiter $$
create function calcularantiguedadempleado(
    p_id_empleado int
)
returns int
deterministic
begin
    declare fecha_contrato date;
    
    select fecha_contratacion into fecha_contrato
    from empleados
    where id_empleado = p_id_empleado;

    if fecha_contrato is null then
        return 0;
    end if;
    return timestampdiff(year, fecha_contrato, curdate());
end$$
delimiter ;

select nombre, calcularantiguedadempleado(id_empleado) as años_de_servicio
from empleados;




-- Funcion para calcular el total de una comanda
delimiter $$
create function calculartotalcomanda(
    p_id_comanda int
)
returns decimal(10, 2)
reads sql data
begin
    declare total_comanda decimal(10, 2);
    select sum(dc.cantidad * p.precio)
    into total_comanda
    from detalle_comanda dc
    join platos p on dc.id_plato = p.id_plato
    where dc.id_comanda = p_id_comanda;

    return ifnull(total_comanda, 0.00);
end$$
delimiter ;


select id_comanda, calculartotalcomanda(id_comanda) as total_a_pagar
from comandas
where id_comanda = 1;


-- Funcion para verificar disponibilidad de platos
delimiter $$
create function verificardisponibilidadplato(
    p_id_plato int)
returns varchar(20)
reads sql data
begin
    declare ingredientes_faltantes int;
    select count(*)
    into ingredientes_faltantes
    from plato_ingredientes pi
    join ingredientes i on pi.id_ingrediente = i.id_ingrediente
    where pi.id_plato = p_id_plato
      and i.stock_actual < pi.cantidad;
      
    if ingredientes_faltantes = 0 then
        return 'disponible';
    else
        return 'agotado';
    end if;
end$$
delimiter ;


select nombre, precio, verificardisponibilidadplato(id_plato) as estado
from platos;


-- triggers:
-- TRIGGERS PARA EMPLEADOS --- 

-- 1.- Trigger para contratacion de empleados
delimiter $$
create trigger trg_log_cambios_empleados
after insert on empleados
for each row
begin
    insert into log_acciones (usuario, accion, tabla_afectada, id_afectado, descripcion)
    values (user(), 'insert', 'empleados', new.id_empleado, 
            concat('se ha contratado al nuevo empleado: ', new.nombre, 
                   ' con el rol id: ', new.id_rol, 
                   ' y un salario de: ', new.salario));
end$$
delimiter ;

-- Contratar un nuevo empleado (activará el trigger de INSERT)
insert into empleados (nombre, id_rol, fecha_contratacion, salario)
values ('diego castro', 1, '2025-08-01', 900.00);




-- 2.- Trigger para actualizaciones de empleados
delimiter $$
create trigger trg_log_actualizacion_empleados
after update on empleados
for each row
begin
    -- solo registra si hubo un cambio en el rol o el salario para evitar logs innecesarios
    if old.id_rol <> new.id_rol or old.salario <> new.salario then
        insert into log_acciones (usuario, accion, tabla_afectada, id_afectado, descripcion)
        values (user(), 'update', 'empleados', new.id_empleado, 
                concat('se actualizo el empleado ', new.nombre, 
                       '. rol anterior: ', old.id_rol, ', rol nuevo: ', new.id_rol,
                       '. salario anterior: ', old.salario, ', salario nuevo: ', new.salario));
    end if;
end$$
delimiter ;

-- Cambiar rol y salario del empleado con ID 1 (activará el trigger de UPDATE)
update empleados
set id_rol = 2, salario = 850.00
where id_empleado = 1;



-- 3.- Trigger para eliminacion de empleados
delimiter $$
create trigger trg_log_eliminacion_empleados
after delete on empleados
for each row
begin
    insert into log_acciones (usuario, accion, tabla_afectada, id_afectado, descripcion)
    values (user(), 'delete', 'empleados', old.id_empleado, 
            concat('se ha eliminado al empleado: ', old.nombre, 
                   ' (id: ', old.id_empleado, ')'));
end$$
delimiter ;


-- Eliminar al empleado recién insertado (activará el trigger de DELETE)
delete from empleados
where nombre = 'diego castro';

select * from log_acciones;

-- TRIGGERS PARA FACTURAS

-- 1.- Trigger para guardar facturas
delimiter //
create trigger trg_insert_factura_log
after insert on facturas
for each row
begin
    insert into log_acciones (usuario, ip_origen, accion, tabla_afectada, id_afectado, descripcion)
    values ('sistema', '127.0.0.1', 'inserción', 'facturas', new.id_factura, 
            concat('se registró la factura #', new.id_factura, ' para la comanda #', new.id_comanda));
end;
//
delimiter ;

-- Ejecución del trigger trg_insert_factura_log
insert into facturas (id_comanda, id_cliente, id_forma_pago, total, propina)
values (6, 2, 1, 15.50, 1.50);

Select * from log_acciones;



-- trigger para bajar stock al solicitar un plato "Detalle Comanda"
delimiter $$
create trigger trg_baja_stock_comanda
after insert on detalle_comanda
for each row
begin
    declare v_id_ingrediente int;
    declare v_cantidad_necesaria decimal(6,2);
    declare v_fin int default 0;

    declare cur_ingredientes cursor for
        select id_ingrediente, cantidad 
        from plato_ingredientes 
        where id_plato = new.id_plato;

    declare continue handler for not found set v_fin = 1;

    open cur_ingredientes;
    loop_ingredientes: loop
        fetch cur_ingredientes into v_id_ingrediente, v_cantidad_necesaria;
        
        if v_fin = 1 then
            leave loop_ingredientes;
        end if;

        update ingredientes
        set stock_actual = stock_actual - (v_cantidad_necesaria * new.cantidad)
        where id_ingrediente = v_id_ingrediente;

        insert into historial_stock (id_ingrediente, cantidad, tipo_movimiento)
        values (v_id_ingrediente, (v_cantidad_necesaria * new.cantidad), 'salida');

    end loop loop_ingredientes;

    close cur_ingredientes;
end$$
delimiter ;


insert into detalle_comanda (id_comanda, id_plato, cantidad) values (4, 1, 4);

Select * from detalle_comanda;
select * from ingredientes;
select * from historial_stock;



-- trigger eliminar promociones
delimiter //
create trigger trg_notif_eliminacion_promocion
before delete on promociones
for each row
begin
    insert into log_acciones (usuario, ip_origen, accion, tabla_afectada, id_afectado, descripcion)
    values ('admin', '127.0.0.1', 'eliminación', 'promociones', old.id_promocion, 
            concat('promoción "', left(old.descripcion, 50), '" eliminada.'));
end;
//
delimiter ;


delete from promociones
where id_promocion= 6;




-- Trigger para notificar cambio de precio
delimiter $$
create trigger trg_notificar_cambio_precio
after update on platos
for each row
begin
    if old.precio <> new.precio then
        insert into log_acciones (usuario, ip_origen, accion, tabla_afectada, id_afectado, descripcion)
        values (
            user(), 
            substring_index(user(), '@', -1),
            'notificacion_precio', 
            'platos', 
            new.id_plato,
            concat('cambio de precio para el plato "', new.nombre, 
                   '". precio anterior: ', old.precio, 
                   ', precio nuevo: ', new.precio)
        );
    end if;
end$$
delimiter ;

-- Actualizamos el precio de un plato específico (esto activará el trigger)
update platos
set precio = 13.90
where id_plato = 7;

Select * from log_acciones;



-- Indexs:

-- Index Simples
-- Índices para consultas frecuentes por cliente
CREATE INDEX idx_clientes_correo ON clientes(correo);

-- Índices para búsquedas en empleados por rol y nombre
CREATE INDEX idx_empleados_id_rol ON empleados(id_rol);
CREATE INDEX idx_empleados_nombre ON empleados(nombre);

-- Índices sobre campos que aparecen en JOIN y WHERE en comandas
CREATE INDEX idx_comandas_id_mesa ON comandas(id_mesa);
CREATE INDEX idx_comandas_id_empleado ON comandas(id_empleado);
CREATE INDEX idx_comandas_estado ON comandas(estado);
 

-- Índice para facturas por cliente y fecha
CREATE INDEX idx_facturas_id_cliente ON facturas(id_cliente);
CREATE INDEX idx_facturas_fecha ON facturas(fecha);

-- Índice para ingredientes por nombre (búsqueda rápida)
CREATE INDEX idx_ingredientes_nombre ON ingredientes(nombre);

-- Index para platos
-- Índice en id_categoria para optimizar JOINs y filtros por categoría
CREATE INDEX idx_platos_categoria ON platos(id_categoria);
-- Índice en nombre para búsquedas y ordenamientos
CREATE INDEX idx_platos_nombre ON platos(nombre);
-- Índice en precio para filtros y ordenamientos por precio
CREATE INDEX idx_platos_precio ON platos(precio);

show index from platos;
show index from clientes;
show index from empleados;
show index from comandas;
show index from ingredientes;

-- Index Compuestos -- 
-- Índice para historial_stock por tipo y fecha
CREATE INDEX idx_historial_tipo_fecha ON historial_stock(tipo_movimiento, fecha_movimiento);

-- Empleados en roles específicos por salario
CREATE INDEX idx_empleados_rol_salario ON empleados(id_rol, salario);

-- Comandas suele consultar por id_empleado + estado
CREATE INDEX idx_comandas_empleado_estado ON comandas(id_empleado, estado);

-- Facturas suele usar id_cliente y fecha (por filtros o reportes)
CREATE INDEX idx_facturas_cliente_fecha ON facturas(id_cliente, fecha);

-- Turnos empleados por empleado y fecha (para controlar asistencia diaria)
CREATE INDEX idx_turno_empleado_fecha ON turnos_empleados(id_empleado, fecha);

-- detalle_comanda usa mucho id_comanda + id_plato como PK, pero lo explicitamos para claridad de optimización
CREATE INDEX idx_detalle_comanda_compuesto ON detalle_comanda(id_comanda, id_plato);

-- Promociones vigentes por fechas
CREATE INDEX idx_promociones_fecha ON promociones(fecha_inicio, fecha_fin);

-- plato_ingredientes puede beneficiarse de una búsqueda compuesta
CREATE INDEX idx_plato_ingrediente_compuesto ON plato_ingredientes(id_plato, id_ingrediente);


SHOW INDEX FROM platos;


-- Explain "Rendimiento"
-- Antes de index
set profiling = 1;

select
id_plato, nombre, descripcion, precio
from platos
where id_categoria = 3  and precio < 8.00;

show profiles;

explain select
id_plato, nombre, descripcion, precio
from platos
where id_categoria = 3 and precio < 8.00;


show profiles;



-- Despues de index --- F2
-- Creamos un índice compuesto. El orden de las columnas es importante.
-- Ponemos primero la columna con la igualdad (=) y luego la del rango (<).
create index idx_platos_cat_precio ON platos(id_categoria, precio);

SET profiling = 1;

select 
id_plato, nombre, descripcion, precio
from platos
where id_categoria = 3 AND precio < 8.00;


show profiles;

explain select
id_plato, nombre, descripcion, precio
from platos
where id_categoria = 3 and precio < 8.00;


-- Consulta adicional

explain select id_plato, nombre, precio from platos where nombre like 'tarta%';


-- creamos el indice que tenias para el nombre
create index idx_platos_nombre on platos(nombre);

explain select id_plato, nombre, precio from platos where nombre like 'tarta%';




-- Parte 2  - JL

-- Creacion de Roles (Administrador,Auditor,Operador,Cliente,Proveedor,Usuario Final)
CREATE ROLE administrador;
CREATE ROLE auditor;
CREATE ROLE operador;
CREATE ROLE cliente;
CREATE ROLE proveedor;
CREATE ROLE usuario_final;

-- Asignacion de los roles
CREATE USER 'jimy_user'@'localhost' IDENTIFIED BY 'admin123';
CREATE USER 'auditor_user'@'localhost' IDENTIFIED BY 'auditor123';
CREATE USER 'david_user'@'localhost' IDENTIFIED BY 'david2004';
CREATE USER 'alisson_user'@'localhost' IDENTIFIED BY 'alisson2003';
CREATE USER 'proveedor_user'@'localhost' IDENTIFIED BY 'proveedor456';
CREATE USER 'comenzal_final_user'@'localhost' IDENTIFIED BY 'usuario_pass';

GRANT administrador TO 'jimy_user'@'localhost';
GRANT auditor TO 'auditor_user'@'localhost';
GRANT operador TO 'david_user'@'localhost';
GRANT cliente TO 'alisson_user'@'localhost';
GRANT proveedor TO 'proveedor_user'@'localhost';
GRANT usuario_final TO 'comenzal_final_user'@'localhost';

-- Otorgar privilegios a roles
-- Administrador
GRANT ALL PRIVILEGES ON restaurante_bd.* TO administrador;

-- Auditor
GRANT SELECT ON restaurante_bd.* TO auditor;

-- Operador
GRANT SELECT, INSERT, UPDATE ON restaurante_bd.comandas TO operador;

-- Cliente
GRANT SELECT ON restaurante_bd.platos TO cliente;

-- Proveedor
GRANT SELECT, INSERT ON restaurante_bd.historial_stock TO proveedor;
GRANT SELECT ON restaurante_bd.ingredientes TO proveedor;

-- Usuario Final
GRANT SELECT ON restaurante_bd.platos TO usuario_final;
GRANT SELECT ON restaurante_bd.promociones TO usuario_final;

-- Consultar que hace cada uno
SHOW GRANTS FOR 'jimy_user'@'localhost';
SHOW GRANTS FOR 'proveedor_user'@'localhost';
SHOW GRANTS FOR 'comenzal_final_user'@'localhost';

-- GRANT Y REVOKE

-- Otorgar DELETE sobre facturas
GRANT DELETE ON restaurante_bd.facturas TO administrador;

-- Revocar DELETE sobre facturas
REVOKE DELETE ON restaurante_bd.facturas FROM administrador;

-- Auditor
-- Otorgar SELECT sobre historial_stock
GRANT SELECT ON restaurante_bd.historial_stock TO auditor;

-- Revocar SELECT sobre historial_stock
REVOKE SELECT ON restaurante_bd.historial_stock FROM auditor;

-- Operador
-- Otorgar SELECT sobre platos
GRANT SELECT ON restaurante_bd.platos TO operador;

-- Revocar SELECT sobre platos
REVOKE SELECT ON restaurante_bd.platos FROM operador;

-- Cliente
-- Otorgar SELECT sobre promociones
GRANT SELECT ON restaurante_bd.promociones TO cliente;

-- Revocar SELECT sobre promociones
REVOKE SELECT ON restaurante_bd.promociones FROM cliente;

-- Proveedor
-- Otorgar UPDATE sobre ingredientes
GRANT UPDATE ON restaurante_bd.ingredientes TO proveedor;

-- Revocar UPDATE sobre ingredientes
REVOKE UPDATE ON restaurante_bd.ingredientes FROM proveedor;

-- Usuario Final
-- Otorgar SELECT sobre mesas
GRANT SELECT ON restaurante_bd.mesas TO usuario_final;

-- Revocar SELECT sobre mesas
REVOKE SELECT ON restaurante_bd.mesas FROM usuario_final;

-- Comprobacion de Cambios
SHOW GRANTS FOR 'david_user'@'localhost';
SHOW GRANTS FOR operador;

-- Proceso de Encriptacion SHA2
DESCRIBE restaurante_bd.clientes;

-- Cambiar el tipo de dato en correo a Correo (VarBinary255)
ALTER TABLE restaurante_bd.clientes
MODIFY correo VARBINARY(255);

INSERT INTO restaurante_bd.clientes(nombre, correo)
VALUES ('Sabrina', AES_ENCRYPT('sabrina@test.com', '123456'));

-- Consultar y descifrar
SELECT 
  id_cliente,
  nombre,
  AES_DECRYPT(correo, '123456') AS correo_visible
FROM restaurante_bd.clientes;

-- Demostracion con MD5 y SHA2 (Contraseña)
ALTER TABLE restaurante_bd.clientes
ADD password_hash CHAR(64);

-- Hash
UPDATE restaurante_bd.clientes
SET password_hash = SHA2('clave123', 256)
WHERE nombre = 'Carlos';

-- Comprobacion de Login
SELECT *
FROM restaurante_bd.clientes
WHERE nombre = 'Sabrina' AND password_hash = SHA2('123456', 256);

-- Conexion con SSL y que este cifrada
SHOW VARIABLES LIKE '%ssl%';
SHOW STATUS LIKE 'Ssl_version';

-- Conexion Cifrada
-- Captura de Pantalla
SHOW STATUS LIKE 'Ssl_cipher';

-- Registros de Intentos Fallidos
CREATE TABLE log_intentos_fallidos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  usuario VARCHAR(100),
  ip_origen VARCHAR(45),
  fecha_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
  motivo VARCHAR(255)
);

INSERT INTO log_intentos_fallidos (usuario, ip_origen, motivo)
VALUES ('jimy_user', '192.168.1.100', 'Contraseña incorrecta');

SELECT * FROM log_intentos_fallidos ORDER BY fecha_hora DESC LIMIT 50;

-- Validaciones de Entrada en la Base
-- Identificar los registros
SELECT nombre FROM clientes
WHERE nombre NOT REGEXP '^[A-Za-záéíóúÁÉÍÓÚñÑ ]+$';

-- Actualizacion
UPDATE clientes
SET nombre = 'Nombre Valido'
WHERE nombre NOT REGEXP '^[A-Za-záéíóúÁÉÍÓÚñÑ ]+$';

-- Aplicacion de Validacion
ALTER TABLE clientes
ADD CONSTRAINT chk_nombre_valido CHECK (nombre REGEXP '^[A-Za-záéíóúÁÉÍÓÚñÑ ]+$');

-- Revision de Roles Asignados
CREATE TABLE audit_roles_privilegios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  usuario VARCHAR(100),
  rol_privilegio VARCHAR(100),
  accion ENUM('GRANT', 'REVOKE'),
  fecha_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
  admin_responsable VARCHAR(100)
);

INSERT INTO audit_roles_privilegios (usuario, rol_privilegio, accion, admin_responsable)
VALUES ('jimy_user', 'administrador', 'GRANT', 'admin_root');

SELECT * FROM audit_roles_privilegios
WHERE usuario = 'jimy_user'
ORDER BY fecha_hora DESC;

-- Revision de Privilegios Activos
SHOW GRANTS FOR 'jimy_user'@'localhost';

-- Procedimiento para quede guardado en tabla de auditoria
DELIMITER //

CREATE PROCEDURE sp_asignar_rol (
    IN p_usuario VARCHAR(100),
    IN p_host VARCHAR(100),
    IN p_rol VARCHAR(100),
    IN p_admin VARCHAR(100)
)
BEGIN
    -- Ejecutar el GRANT de rol al usuario
    SET @sql := CONCAT('GRANT ', p_rol, ' TO \'', p_usuario, '\'@\'', p_host, '\'');
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

    -- Registrar en la tabla de auditoría
    INSERT INTO audit_roles_privilegios(usuario, rol_privilegio, accion, admin_responsable)
    VALUES (p_usuario, p_rol, 'GRANT', p_admin);
END;
//

DELIMITER ;

-- Uso del Procedimiento
CALL sp_asignar_rol('jimy_user', 'localhost', 'administrador', 'admin_root');

-- Revocacion de roll
DELIMITER //

CREATE PROCEDURE sp_revocar_rol (
    IN p_usuario VARCHAR(100),
    IN p_host VARCHAR(100),
    IN p_rol VARCHAR(100),
    IN p_admin VARCHAR(100)
)
BEGIN
    -- Ejecutar el REVOKE del rol al usuario
    SET @sql := CONCAT('REVOKE ', p_rol, ' FROM \'', p_usuario, '\'@\'', p_host, '\'');
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

    -- Registrar en la tabla de auditoría
    INSERT INTO audit_roles_privilegios(usuario, rol_privilegio, accion, admin_responsable)
    VALUES (p_usuario, p_rol, 'REVOKE', p_admin);
END;
//

DELIMITER ;

-- Llamada
CALL sp_revocar_rol('jimy_user', 'localhost', 'administrador', 'admin_root');

-- Auditoria
-- La Tabla ya fue creada

SET @ip_actual = '192.168.1.100';
SET @terminal_actual = 'PC-OFICINA-01';

-- Trigger sobre la tabla clientes
DELIMITER //

CREATE TRIGGER trg_clientes_insert
AFTER INSERT ON clientes
FOR EACH ROW
BEGIN
    INSERT INTO log_acciones (
        usuario,
        ip_origen,
        accion,
        tabla_afectada,
        id_afectado,
        terminal,
        rol_activo,
        transaccion
    ) VALUES (
        CURRENT_USER(),
        @ip_actual,
        'INSERT',
        'clientes',
        NEW.id_cliente,
        @terminal_actual,
        CURRENT_ROLE(),
        CONCAT('INSERT INTO clientes (nombre, correo) VALUES (', QUOTE(NEW.nombre), ', ', QUOTE(NEW.correo), ')')
    );
END;
//

CREATE TRIGGER trg_clientes_update
AFTER UPDATE ON clientes
FOR EACH ROW
BEGIN
    INSERT INTO log_acciones (
        usuario,
        ip_origen,
        accion,
        tabla_afectada,
        id_afectado,
        terminal,
        rol_activo,
        transaccion
    ) VALUES (
        CURRENT_USER(),
        @ip_actual,
        'UPDATE',
        'clientes',
        NEW.id_cliente,
        @terminal_actual,
        CURRENT_ROLE(),
        CONCAT('UPDATE clientes SET nombre=', QUOTE(NEW.nombre), ', correo=', QUOTE(NEW.correo), ' WHERE id_cliente=', NEW.id_cliente)
    );
END;
//

CREATE TRIGGER trg_clientes_delete
AFTER DELETE ON clientes
FOR EACH ROW
BEGIN
    INSERT INTO log_acciones (
        usuario,
        ip_origen,
        accion,
        tabla_afectada,
        id_afectado,
        terminal,
        rol_activo,
        transaccion
    ) VALUES (
        CURRENT_USER(),
        @ip_actual,
        'DELETE',
        'clientes',
        OLD.id_cliente,
        @terminal_actual,
        CURRENT_ROLE(),
        CONCAT('DELETE FROM clientes WHERE id_cliente=', OLD.id_cliente)
    );
END;
//

DELIMITER ;

ALTER TABLE log_acciones ADD COLUMN fecha_hora DATETIME DEFAULT CURRENT_TIMESTAMP;


-- Reportes de auditoria
SELECT * FROM log_acciones WHERE usuario = 'jimy_user' ORDER BY fecha_hora DESC;

SELECT * FROM log_acciones WHERE accion = 'DELETE' ORDER BY fecha_hora DESC;

SELECT * FROM log_acciones WHERE tabla_afectada = 'clientes' ORDER BY fecha_hora DESC;

SELECT * FROM log_acciones WHERE fecha_hora BETWEEN '2025-08-01' AND '2025-08-31' ORDER BY fecha_hora DESC;

-- Control de Versiones
ALTER TABLE clientes ADD COLUMN version_hash CHAR(64);

UPDATE clientes
SET version_hash = SHA2(CONCAT(nombre, correo), 256)
WHERE id_cliente = 1;

DELIMITER //
CREATE TRIGGER trg_clientes_update_hash
BEFORE UPDATE ON clientes
FOR EACH ROW
BEGIN
  SET NEW.version_hash = SHA2(CONCAT(NEW.nombre, NEW.correo), 256);
END;
//
DELIMITER ;

-- Respaldo y Actualizacion
-- Comandos
-- mysqldump -u root -p --single-transaction --routines --triggers restaurante_bd > backup_caliente.sql
-- Paso 2 Detener el servicio
-- sudo systemctl stop mysql
-- cp -r /var/lib/mysql/restaurante_bd /ruta/backup_frio/
-- sudo systemctl start mysql
-- Restauracion de Consola
-- mysql -u root -p restaurante_bd < backup_caliente.sql
-- Restauracion Parcial
-- mysqldump -u root -p restaurante_bd clientes > clientes_backup.sql
-- mysql -u root -p restaurante_bd < clientes_backup.sql
-- Log Del BackUP
-- mysqldump -u root -p restaurante_bd > backup.sql 2> backup_log.txt
-- mysql -u root -p restaurante_bd < backup.sql 2> restauracion_log.txt

CREATE TABLE usuarios (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  usuario VARCHAR(50) NOT NULL UNIQUE,
  clave VARCHAR(255) NOT NULL,
  rol VARCHAR(50)
);

INSERT INTO usuarios (usuario, clave, rol)
VALUES 
('admin', 'admin123', 'administrador'),
('juan', 'clave123', 'cliente'),
('ana', 'ana456', 'operador');

-- Seguridad ante SQL Injection
DELIMITER //
CREATE PROCEDURE login_vulnerable(IN user_input VARCHAR(100), IN pass_input VARCHAR(100))
BEGIN
  SET @sql = CONCAT("SELECT * FROM usuarios WHERE usuario = '", user_input, "' AND clave = '", pass_input, "'");
  PREPARE stmt FROM @sql;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;
END;
//
DELIMITER ;

CALL login_vulnerable("' OR '1'='1", "cualquier");
-- Validacion en vistas
CREATE VIEW vista_clientes_segura AS
SELECT id_cliente, nombre FROM clientes;

-- Documentacion del Ataque
CALL login_vulnerable("' OR '1'='1", "x");

-- Monitoreo y Rendimiento
SELECT 
    table_schema AS base_de_datos,
    table_name AS tabla,
    ROUND(data_length / 1024 / 1024, 2) AS tamaño_MB,
    ROUND(index_length / 1024 / 1024, 2) AS tamaño_indices_MB,
    ROUND((data_length + index_length) / 1024 / 1024, 2) AS tamaño_total_MB
FROM information_schema.tables
WHERE table_schema = 'restaurante_bd'
ORDER BY tamaño_total_MB DESC;

SELECT
    YEAR(fecha_hora) AS anio,
    WEEK(fecha_hora) AS semana,
    COUNT(*) AS total_registros
FROM comandas
GROUP BY anio, semana
ORDER BY anio DESC, semana DESC
LIMIT 10;

SET GLOBAL slow_query_log = 'ON';
SET GLOBAL slow_query_log_file = 'C:/mysql_logs/mysql-slow.log';
SET GLOBAL long_query_time = 1; -- en segundos, ajusta a lo que consideres lento

SELECT 
    routine_schema,
    routine_name,
    routine_type,
    routine_definition
FROM information_schema.routines
WHERE routine_schema = 'restaurante_bd'
LIMIT 1000;

select * from clientes;

-- Proteccion de la Informacion
SELECT id_cliente, nombre, correo FROM clientes LIMIT 10;

-- Simulacion de annimizacion y enmascaramiento
SELECT 
  id_cliente,
  nombre,
  CONCAT(
    LEFT(CAST(AES_DECRYPT(correo, 'clave_secreta') AS CHAR), 1),
    '*****@',
    SUBSTRING_INDEX(CAST(AES_DECRYPT(correo, 'clave_secreta') AS CHAR), '@', -1)
  ) AS correo_enmascarado
FROM clientes;

-- Implmentacion de Integridad Logica
-- Verificacion del Correo
DELIMITER //

CREATE FUNCTION correo_existe(p_correo VARBINARY(255))
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
  DECLARE existe INT;

  SELECT COUNT(*) INTO existe
  FROM clientes
  WHERE correo = p_correo;

  RETURN (existe > 0);
END;
//

DELIMITER ;

-- Procedimiento
DELIMITER //

CREATE PROCEDURE insertar_cliente_unico(
  IN p_nombre VARCHAR(100),
  IN p_correo TEXT
)
BEGIN
  DECLARE correo_cifrado VARBINARY(255);

  SET correo_cifrado = AES_ENCRYPT(p_correo, 'clave_secreta');

  IF correo_existe(correo_cifrado) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'El correo ya está registrado.';
  ELSE
    INSERT INTO clientes(nombre, correo)
    VALUES (p_nombre, correo_cifrado);
  END IF;
END;
//

DELIMITER ;

CALL insertar_cliente_unico('Nuevo Cliente', 'nuevo@test.com');

select * from usuarios;




