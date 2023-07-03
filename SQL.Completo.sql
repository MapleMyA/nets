create database miBaseDeDatos

/******************Parte******************/

create database PaginaWeb

GO

USE PaginaWeb

GO

CREATE TABLE CATEGORIA(
IdCategoria int primary key identity,
Descripcion varchar(100),
Activo bit default 1,
FechaRegistro datetime default getdate()
)

go

CREATE TABLE MARCA(
IdMarca int primary key identity,
Descripcion varchar(100),
Activo bit default 1,
FechaRegistro datetime default getdate()
)

go

CREATE TABLE PRODUCTO(
IdProducto int primary key identity,
Nombre varchar(500),
Descripcion varchar(500),
IdMarca int references Marca(IdMarca),
IdCategoria int references Categoria(IdCategoria),
Precio decimal(10,2) default 0,
Stock int,
RutaImagen varchar(100),
NombreImagen varchar(100),
Activo bit default 1,
FechaRegistro datetime default getdate()
)

go

CREATE TABLE CLIENTE(
IdCliente int primary key identity,
Nombres varchar(100),
Apellidos varchar(100),
Correo varchar(100),
Clave varchar(150),
Reestablecer bit default 0,
FechaRegistro datetime default getdate()
)

go

CREATE TABLE CARRITO(
IdCarrito int primary key identity,
IdCliente int references CLIENTE(IdCliente),
IdProducto int references PRODUCTO(IdProducto),
Cantidad int
)

go 

CREATE TABLE VENTA(
IdVenta int primary key identity,
IdCliente int references CLIENTE(IdCliente),
TotalProducto int,
MontoTotal decimal(10,2),
Contacto varchar(50),
IdDistrito varchar(10),
Telefono varchar(50),
Direccion varchar(500),
IdTransaccion varchar(50),
FechaVenta datetime default getdate()
)

go

CREATE TABLE DETALLE_VENTA(
IdDetalleVenta int primary key identity,
IdVenta int references Venta(IdVenta),
IdProducto int references PRODUCTO(IdProducto),
Cantidad int,
Total decimal (10,2)
)

go 

CREATE TABLE USUARIO(
IdUsuario int primary key identity,
Nombres varchar(100),
Apellidos varchar(100),
Correo varchar(100),
Clave varchar(150),
Reestablecer bit default 1,
Activo bit default 1,
FechaRegistro datetime default getdate()
)

go

CREATE TABLE DEPARTAMENTO(
IdDepartamento varchar(2) NOT NULL,
Descripcion varchar(45) NOT NULL
)

go

CREATE TABLE PROVINCIA(
	IdProvincia varchar(4) NOT NULL,
	Descripcion varchar(45) NOT NULL,
	IdDepartamento varchar(2) NOT NULL
)

go

CREATE TABLE DISTRITO(
IdDistrito varchar(6) NOT NULL,
Descripcion varchar(45) NOT NULL,
IdProvincia varchar(4) NOT NULL,
IdDepartamento varchar(2) NOT NULL
)
go

/******************Parte******************/

insert into USUARIO(Nombres,Apellidos,Correo,Clave) values 
('test nombre', 'test apellido', 'test@example.com','ecd71870d1963316a97e3ac3408c9835ad8cf0f3c1bc703527c30265534f75ae')


insert into CATEGORIA(Descripcion) values
('Zapatillas Urbanas'),
('Zapatillas Deportivas'),
('Mocasines'),
('Botas y Botines')




insert into MARCA(Descripcion) values
('ADIDAS'),
('NIKE'),
('PUMA'),
('REEBOK'),
('VANS'),
('ASICS')



insert into DEPARTAMENTO(IdDepartamento,Descripcion)
values
('01', 'Arequipa'),
('02', 'Ayacucho'),
('03', 'Cajamarca'),
('04', 'Callao'),
('05', 'Ica'),
('06', 'Lambayeque'),
('07', 'Lima')



insert into PROVINCIA(IdProvincia,Descripcion,IdDepartamento)
values
('0101', 'Arequipa', '01'),
('0102', 'Camaná', '01'),
--AYACUCHO PROVINCIA
('0201', 'Ayacucho', '02'),
('0202', 'Camaná', '02'),
--CAJAMARCA PROVINCIA
('0301', 'Cajamarca', '03'),
('0302', 'Cajabamba', '03'),
--CALLAO PROVINCIA
('0401', 'Callao', '04'),
('0402', 'Callao', '04'),
--ICA PROVINCIA
('0501', 'Ica', '05'),
('0502', 'Chincha', '05'),
--LAMBAYEQUE PROVINCIA
('0601', 'Lambayeque', '06'),
('0602', 'Chiclayo', '06'),
--LIMA PROVINCIA
('0701', 'Lima', '07'),
('0702', 'Barranca', '07')


insert into DISTRITO(IdDistrito,Descripcion,IdProvincia,IdDepartamento)values
('010101', 'Nieva', '0101', '01'),
('010102', 'El Cenepa', '0101', '01'),
('010201', 'Camaná', '0102', '01'),
('010202', 'José María Qimper', '0102', '01'),

--AYACUCHO PROVINCIA
('020101', 'Ayacucho', '0201', '02'),
('020102', 'Huanta', '0201', '02'),
('020201', 'Sucre', '0202', '02'),
('020202', 'Parinacochas', '0202', '02'),

--CAJAMARCA PROVINCIA
('030101', 'Cajamarca', '0301', '03'),
('030102', 'Jaen', '0301', '03'),
('030201', 'Chota', '0302', '03'),
('030202', 'Celendin', '0302', '03'),

--CALLAO PROVINCIA
('040101', 'Callao', '0401', '04'),
('040102', 'La Punta', '0401', '04'),
('040201', 'La Perla', '0402', '04'),
('040202', 'Bellavista', '0402', '04'),

--ICA PROVINCIA
('050101', 'Ica', '0501', '05'),
('050102', 'La Tringuiña', '0501', '05'),
('050201', 'Chincha Alta', '0502', '05'),
('050202', 'Alto Laran', '0502', '05'),

--LAMBAYEQUE PROVINCIA
('060101', 'Lambayeque', '0601', '06'),
('060102', 'Chiclayo', '0601', '06'),
('060201', 'Pucala', '0602', '06'),
('060202', 'Patapo', '0602', '06'),

--LIMA PROVINCIA
('070101', 'Los Olivos', '0701', '07'),
('070102', 'Comas', '0701', '07'),
('070201', 'Chorrillos', '0702', '07'),
('070202', 'Ate', '0702', '07')

/******************Parte******************/

select IdUsuario,Nombres,Apellidos,Correo,Clave,Reestablecer,Activo from USUARIO

/******************Parte******************/

select IdUsuario,Nombres,Apellidos,Correo,Clave,Reestablecer,Activo from USUARIO

insert into USUARIO(Nombres,Apellidos,Correo,Clave)values('test 02','user 02','user02@example.com','ecd71870d1963316a97e3ac3408c9835ad8cf0f3c1bc703527c30265534f75ae')

update USUARIO set activo = 0 where IdUsuario = 2
go

/******************Parte******************/

create proc sp_RegistrarUsuario(
@Nombres varchar(100),
@Apellidos varchar(100),
@Correo varchar(100),
@Clave varchar(100),
@Activo varchar(100),
@Mensaje varchar(500) output,
@Resultado int output
)
as
begin
	SET @Resultado = 0
	IF NOT EXISTS (SELECT * FROM USUARIO WHERE Correo = @Correo)
	begin
		insert into USUARIO(Nombres,Apellidos,Correo,Clave,Activo) Values
		(@Nombres,@Apellidos,@Correo,@Clave,@Activo)

		SET @Resultado = scope_identity()
	end
	else
	set @Mensaje = 'El correo del usuario ya existe'
end
go
create proc sp_EditarUsuario(
@IdUsuario int,
@Nombres varchar(100),
@Apellidos varchar(100),
@Correo varchar(100),
@Activo bit,
@Mensaje varchar(500) output,
@Resultado bit output
)
as
begin
	SET @Resultado = 0
	IF NOT EXISTS (SELECT * FROM USUARIO WHERE Correo = @Correo and IdUsuario != @IdUsuario)
	begin
		update top (1) USUARIO set
		Nombres = @Nombres,
		Apellidos = @Apellidos,
		Correo = @Correo,
		Activo = @Activo
		where IdUsuario = @IdUsuario

		SET @Resultado = 1
	end
	else
	set @Mensaje = 'El correo del usuario ya existe'
end
go


/******************Parte******************/

create proc sp_RegistrarCategoria(
@Descripcion varchar(100),
@Activo bit,
@Mensaje varchar(500) output,
@Resultado int output
)
as
begin
	set @Resultado = 0
	if not exists (select * from CATEGORIA where Descripcion = @Descripcion)
	begin
		insert into CATEGORIA(Descripcion, Activo) values
		(@Descripcion, @Activo)

		set @Resultado = SCOPE_IDENTITY()
	end
	else
	set @Mensaje = 'La categoría ya existe'
end
go


go
create proc sp_EditarCategoria(
@IdCategoria int,
@Descripcion varchar(100),
@Activo bit,
@Mensaje varchar(500) output,
@Resultado int output
)
as
begin 
	set @Resultado = 0
	if not exists (select * from CATEGORIA where Descripcion = @Descripcion and IdCategoria != @IdCategoria)
	begin

		update top (1) CATEGORIA set
		Descripcion = @Descripcion,
		Activo = @Activo
		where IdCategoria = @IdCategoria

		set @Resultado = 1
	end
	else
	 set @Mensaje = 'La categoría ya existe'
end

go
create proc sp_EliminarCategoria(
@IdCategoria int,
@Mensaje varchar(500) output,
@Resultado int output
)
as
begin
	set @Resultado = 0
	if not exists (select * from PRODUCTO p
	inner join CATEGORIA c on c.IdCategoria = P.IdCategoria
	where p.IdCategoria = @IdCategoria)
	begin
		delete top (1) from CATEGORIA where IdCategoria = @IdCategoria
		set @Resultado = 1
	end
	else
	 set @Mensaje = 'La categoría se encuentra relacionada a un producto'
end
go

/******************Parte******************/


create proc sp_RegistrarMarca(
@Descripcion varchar(100),
@Activo bit,
@Mensaje varchar(500) output,
@Resultado int output
)
as
begin
	set @Resultado = 0
	if not exists (select * from MARCA where Descripcion = @Descripcion)
	begin
		insert into MARCA(Descripcion, Activo) values
		(@Descripcion, @Activo)

		set @Resultado = SCOPE_IDENTITY()
	end
	else
	set @Mensaje = 'La marca ya existe'
end
go


go
create proc sp_EditarMarca(
@IdMarca int,
@Descripcion varchar(100),
@Activo bit,
@Mensaje varchar(500) output,
@Resultado int output
)
as
begin 
	set @Resultado = 0
	if not exists (select * from MARCA where Descripcion = @Descripcion and IdMarca != @IdMarca)
	begin

		update top (1) MARCA set
		Descripcion = @Descripcion,
		Activo = @Activo
		where IdMarca = @IdMarca

		set @Resultado = 1
	end
	else
	 set @Mensaje = 'La marca ya existe'
end

go
create proc sp_EliminarMarca(
@IdMarca int,
@Mensaje varchar(500) output,
@Resultado int output
)
as
begin
	set @Resultado = 0
	if not exists (select * from PRODUCTO p
	inner join MARCA m on m.IdMarca = P.IdMarca
	where p.IdMarca = @IdMarca)
	begin
		delete top (1) from MARCA where IdMarca = @IdMarca
		set @Resultado = 1
	end
	else
	 set @Mensaje = 'La marca se encuentra relacionada a un producto'
end
go

/******************Parte******************/


create proc sp_RegistrarProducto(
@Nombre varchar(100),
@Descripcion varchar(100),
@IdMarca varchar(100),
@IdCategoria varchar(100),
@Precio decimal(10,2),
@Stock int,
@Activo bit,
@Mensaje varchar(500) output,
@Resultado int output
)
as
begin
	set @Resultado = 0
	if not exists (select * from PRODUCTO where Nombre = @Nombre)
	begin
		insert into PRODUCTO(Nombre, Descripcion, IdMarca, IdCategoria, Precio, Stock, Activo)
		values(@Nombre,@Descripcion,@IdMarca,@IdCategoria,@Precio,@Stock,@Activo)

		set @Resultado = SCOPE_IDENTITY()
	end
	else
	 set @Mensaje = 'El producto ya existe'
end
go


create proc sp_EditarProducto(
@IdProducto int,
@Nombre varchar(100),
@Descripcion varchar(100),
@IdMarca varchar(100),
@IdCategoria varchar(100),
@Precio decimal(10,2),
@Stock int,
@Activo bit,
@Mensaje varchar(500) output,
@Resultado int output
)
as
begin 
	set @Resultado = 0
	if not exists (select * from PRODUCTO where Nombre = @Nombre
	and IdProducto != @IdProducto)
	begin
	
		update PRODUCTO set
		Nombre = @Nombre,
		Descripcion = @Descripcion,
		IdMarca = @IdMarca,
		IdCategoria = @IdCategoria,
		Precio = @Precio,
		Stock = @Stock,
		Activo = @Activo
		where IdProducto = @IdProducto

		set @Resultado = 1
	end
	else
	 set @Mensaje = 'El producto ya existe'
end
go


create proc sp_EliminarProducto(
@IdProducto int,
@Mensaje varchar(500) output,
@Resultado bit output
)
as
begin
	set @Resultado = 0
	if not exists (select * from DETALLE_VENTA dv
	inner join PRODUCTO p on p.IdProducto = dv.IdProducto
	where p.IdProducto = @IdProducto)
	begin
		delete top (1) from PRODUCTO where IdProducto = @IdProducto
		set @Resultado = 1
	end
	else
	 set @Mensaje = 'El producto se encuentra relacionado a una venta'
end
go
/******************Parte******************/

create proc sp_ReporteDashboard
as
begin
select
	
	(select COUNT(*) from CLIENTE) [TotalCliente],
	(select ISNULL(sum(cantidad),0) from DETALLE_VENTA) [TotalVenta],
	(select COUNT(*) from PRODUCTO) [TotalProducto]
end

exec sp_ReporteDashboard

/******************Parte******************/

go

create proc sp_ReporteVentas(
@fechainicio varchar(10),
@fechafin varchar(10),
@idtransaccion varchar(50)
)
as
begin

	set dateformat dmy;

	select  convert(char(10),v.FechaVenta,103)[FechaVenta],CONCAT(c.Nombres,' ',c.Apellidos)[Cliente],
	p.Nombre[Producto], p.Precio, dv.Cantidad, dv.Total, v.IdTransaccion
	from DETALLE_VENTA dv
	inner join PRODUCTO p on p.IdProducto = dv.IdProducto
	inner join VENTA v on v.IdVenta = dv.IdVenta
	inner join CLIENTE c on c.IdCliente = v.IdCliente
	where convert (date, v.FechaVenta) between @fechainicio and @fechafin
	and v.IdTransaccion = iif(@idtransaccion = ' ', v.IdTransaccion,@idtransaccion)

end

go
/******************Parte******************/

create proc sp_RegistrarCliente(
@Nombres varchar(100),
@Apellidos varchar(100),
@Correo varchar(100),
@Clave varchar(100),
@Mensaje varchar(500) output,
@Resultado int output
)
as
begin
	SET @Resultado = 0
	If NOT EXISTS (SELECT * FROM CLIENTE WHERE Correo = @Correo)
	begin
		insert into CLIENTE(Nombres,Apellidos,Correo,Clave,Reestablecer) values
		(@Nombres,@Apellidos,@Correo,@Clave,0)

		SET @Resultado = scope_identity()
	end
	else
		set @Mensaje = 'El correo del usuario ya existe'
end

/******************NuevaParte******************/
go
declare @idcategoria int=0

select distinct m.IdMarca,m.Descripcion from PRODUCTO p
inner join CATEGORIA c on c.IdCategoria = p.IdCategoria
inner join MARCA m on m.IdMarca = p.idmarca and m.Activo = 1
where c.IdCategoria = iif(@idcategoria = 0, c.IdCategoria,@idcategoria)

/******************NuevaParte 1******************/

create proc sp_ExisteCarrito(
@IdCliente int,
@IdProducto int,
@Resultado bit output
)
as
begin
	if exists(select * from carrito where idcliente = @IdCliente and idproducto = @IdProducto)
		set @Resultado = 1
	else
		set @Resultado = 0
end

go


create proc sp_OperacionCarrito(
@IdCliente int,
@IdProducto int,
@Sumar bit,
@Mensaje varchar(500) output,
@Resultado bit output
)
as
begin
	set @Resultado = 1
	set @Resultado = ''

	declare @existecarrito bit = iif(exists(select * from carrito where idcliente = @IdCliente and idproducto = @IdProducto),1,0)
	declare @stockproducto int = (select stock from PRODUCTO where IdProducto = @IdProducto)

	BEGIN TRY

		BEGIN TRANSACTION OPERACION

		if(@Sumar = 1)
		begin
			if(@stockproducto > 0)
			begin
				if(@existecarrito = 1)
					update CARRITO set Cantidad = Cantidad + 1 where idcliente = @IdCliente and idproducto = @IdProducto
				else
					insert into CARRITO(IdCliente,IdProducto,Cantidad) values(@IdCliente,@IdProducto,1)

					update PRODUCTO set Stock = Stock - 1 where IdProducto = @IdProducto
				end
				else
				begin
					set @Resultado = 0
					set @Mensaje = 'El producto no cuenta con stock disponible'
				end
			end
			else
			begin
				update CARRITO set Cantidad = Cantidad - 1 where idcliente = @IdCliente and idproducto = @IdProducto
				update PRODUCTO set Stock = Stock + 1 where IdProducto = @IdProducto
			end

			COMMIT TRANSACTION OPERACION

		END TRY
		BEGIN CATCH
			set @Resultado = 0
			set @Mensaje = ERROR_MESSAGE()
			ROLLBACK TRANSACTION OPERACION
		END CATCH

end



/******************NuevaParte 2******************/
create function fn_obtenerCarritoCliente(
@idcliente int
)
returns table
as
return(
	select p.IdProducto,m.Descripcion[DesMarca],p.Nombre,p.Precio,c.Cantidad,p.RutaImagen,p.NombreImagen

	from CARRITO c
	inner join PRODUCTO p on p.IdProducto = c.IdProducto
	inner join MARCA m on m.IdMarca = p.IdMarca
	where c.IdCliente = @idcliente
)
select * from fn_obtenerCarritoCliente(2)
go

create proc sp_EliminarCarrito(
@IdCliente int,
@IdProducto int,
@Resultado bit output
)
as
begin
	set @Resultado = 1
	declare @cantidadproducto int = (select Cantidad from CARRITO where IdCliente = @IdCliente and IdProducto = @IdProducto)

	BEGIN TRY
		BEGIN TRANSACTION OPERACION
		update PRODUCTO set Stock = Stock + @cantidadproducto where IdProducto = @IdProducto
		delete  top (1) from CARRITO where IdCliente = @IdCliente and IdProducto = @IdProducto

		COMMIT TRANSACTION OPERACION
		END TRY
		BEGIN CATCH
			set @Resultado = 0
			ROLLBACK TRANSACTION OPERACION
		END CATCH
	END


/******************NuevaParte 3******************/



/******************NuevaParte 4******************/
go
use PaginaWeb
select * from USUARIO
select * from CLIENTE
select * from PRODUCTO
select * from CATEGORIA
select * from MARCA
select * from CARRITO
select count(*) from carrito where idcliente = 1
select * from fn_obtenerCarritoCliente(1)

drop proc sp_OperacionCarrito

TRUNCATE TABLE PRODUCTO;

DELETE FROM PRODUCTO
WHERE IdProducto = 4;

use paginaweb
select * from DEPARTAMENTO
select * from provincia