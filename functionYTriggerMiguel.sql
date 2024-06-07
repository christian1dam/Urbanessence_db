/*** FUNCTION: Obtener el número de productos en una tienda***/

create or alter function StockProductosEnTienda (@idTienda int)
returns int
as
begin
    declare @stock int

    select @stock = SUM(cantidad) from productoTienda where tiendaID = @idTienda

    -- Si la tienda no tiene productos, se devolverá 0
    if @stock is null
    begin
        set @stock = 0
    end

    return @stock
end

declare @stockT int
set @stockT = dbo.StockProductosEnTienda(3) -- id de la tienda
select @stockT as 'Stock Total'



/*** TRIGGER: Mantener un historial de cambios de la tabla pedido***/

-- Tabla para el historial de cambios
create table historialPedido (
    id int identity(1,1) primary key,
    idPedido int,
    fechaCambio date,
    campoModificado nvarchar(50),
    valorAnterior nvarchar(100),
    valorNuevo nvarchar(100)
);

-- Trigger
create or alter trigger HistorialPedido
on pedido
after update
as
begin
    declare @idPedido int, @fechaCambio date

    select @idPedido = id, @fechaCambio = GETDATE()
    from inserted -- es una tabla virtual la cual contienen contiene las filas insertadas o actualizadas durante la operación

    -- Insertar registros en la tabla historial para el campo fecha
    if update(fecha) 
    begin
        INSERT INTO historialPedido (idPedido, fechaCambio, campoModificado, valorAnterior, valorNuevo)
        select @idPedido, @fechaCambio, 'fecha', deleted.fecha, inserted.fecha
        from inserted
        inner join deleted on inserted.id = deleted.id
    end

	-- Insertar registros en la tabla historial para el campo totalPedido
    if update(totalPedido) 
    begin
        INSERT INTO historialPedido (idPedido, fechaCambio, campoModificado, valorAnterior, valorNuevo)
        select @idPedido, @fechaCambio, 'totalPedido', deleted.totalPedido, inserted.totalPedido
        from inserted
        inner join deleted on inserted.id = deleted.id
    end

	-- Insertar registros en la tabla historial para el campo estado
    if update(estado) 
    begin
        INSERT INTO historialPedido (idPedido, fechaCambio, campoModificado, valorAnterior, valorNuevo)
        select @idPedido, @fechaCambio, 'estado', deleted.estado, inserted.estado
        from inserted
        inner join deleted on inserted.id = deleted.id
    end

	-- Insertar registros en la tabla historial para el campo idCliente
    if update(idCliente) 
    begin
        INSERT INTO historialPedido (idPedido, fechaCambio, campoModificado, valorAnterior, valorNuevo)
        select @idPedido, @fechaCambio, 'idCliente', deleted.idCliente, inserted.idCliente
        from inserted
        inner join deleted on inserted.id = deleted.id
    end

	-- Insertar registros en la tabla historial para el campo idEmpleado
    if update(idEmpleado) 
    begin
        INSERT INTO historialPedido (idPedido, fechaCambio, campoModificado, valorAnterior, valorNuevo)
        select @idPedido, @fechaCambio, 'idEmpleado', deleted.idEmpleado, inserted.idEmpleado
        from inserted
        inner join deleted on inserted.id = deleted.id
    end
end