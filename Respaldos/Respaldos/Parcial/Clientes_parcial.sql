create table clientes (
    id_cliente int primary key auto_increment,
    nombre varchar(100) not null,
    telefono varchar(20),
    correo varchar(100) unique,
    fecha_registro timestamp default current_timestamp
);

insert into clientes (nombre, telefono, correo) values
('pedro salazar', '0987654321', 'pedro@example.com'),
('lucia vallejo', '0971234567', 'lucia@example.com'),
('andres almeida', '0968889999', 'andres@example.com'),
('karina morales', '0953332211', 'karina@example.com'),
('roberto suarez', '0944445566', 'roberto@example.com');
