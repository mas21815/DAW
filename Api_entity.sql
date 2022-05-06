use Fabrica;


-- Api_entity_add
create procedure api_entity_add(@name varchar(100),@IsProvider BIT,@IsConsumer BIT,@IsPerson bit, @entity_id int OUTPUT)
AS
BEGIN
	SET NOCOUNT ON
	insert into Entities(name,IsProvider,IsConsumer,IsPerson) values (@name,@IsProvider,@IsConsumer,@IsPerson)
    SET @entity_id = scope_identity();
END;


-- Api_entity_remove
create procedure api_entity_remove(@id INT)
AS
BEGIN
	SET NOCOUNT ON
	delete FROM Entities WHERE IdEntitie = @id;
    
END;


-- Api_entity_update
--
-- EXEC api_entity_update @id = 2,@name='Andrea',@IsProvider=false,@IsConsumer=true,@IsPerson=true,@CIF='123',@GCIF='321'
--
--


-- Api_entity_get_id
create function api_entity_get_id(@name varchar(100)) RETURNS int
AS
BEGIN
   
	DECLARE @ret INT;
   	SELECT @ret = IdEntitie FROM Entities WHERE name LIKE @name;
   
   	return @ret;
END;


-- Api_entity_get_ids
create function api_entity_get_ids(@name varchar(100)) RETURNS TABLE
AS
   	return SELECT IdEntitie FROM Entities WHERE name LIKE @name;


-- Api_entity_exist
create function api_entity_exist(@id int) returns bit
as
begin
declare @ret bit;

	if exists(select 1 from Entities where IdEntitie=@id)
	begin
		set @ret = 1
	end
	else
	begin
		set @ret = 0;
	end;

return @ret
end;


-- Api_entity_id_get_name
create function api_entity_id_get_name(@id int) RETURNS varchar(100)
as
begin
	declare @name varchar(100)
	SELECT @name = Entities.name FROM Entities WHERE Entities.IdEntitie LIKE @id;
return @name;
end;


-- Api_entity_set_name ***
Create Procedure api_entity_set_name(@id INT,name varchar(100))
as
begin

end;


-- Api_entity_get_json **?
create function api_entity_get_json(@id int, RETURNS nvarchar(2000) )
as

SELECT  * FROM Entities WHERE Entities.IdEntitie = @id FOR JSON AUTO, without_array_wrapper;


-- Api_entity_add_json
create procedure api_entity_add_json(@content Nvarchar(2000), out int created_id)
as
begin
declare @name text;
set @name = JSON_VALUE (@content,'$.name')
declare @IsProvider bit;
set @IsProvider = JSON_VALUE get_json_value(content,'name')
end;














use Fabrica

drop function api_entity_get_ids;
create function api_entity_get_ids(@name varchar(100)) RETURNS TABLE
AS
   	return SELECT IdEntitie FROM Entities WHERE name LIKE @name;

   	
create function api_entity_get_id(@name varchar(100)) RETURNS int
AS
BEGIN
   
	DECLARE @ret INT;
   	SELECT @ret = IdEntitie FROM Entities WHERE name LIKE @name;
   
   	return @ret;
END;

-- Para casa
drop function api_entity_get_name;
create function api_entity_id_get_name(@id int) RETURNS varchar(100)
as
begin
	declare @name varchar(100)
	SELECT @name = Entities.name FROM Entities WHERE Entities.IdEntitie LIKE @id;
return @name;
end;


create function api_entity_get(@id int, RETURNS nvarchar(2000) )
as

SELECT  * FROM Entities WHERE Entities.IdEntitie = 110 FOR JSON AUTO, without_array_wrapper;


api_entity_set_name(id,name)

--
create procedure api_entity_add_json(@content Nvarchar(2000), out int created_id)
as
begin
declare @name text;
set @name = JSON_VALUE (@content,'$.name')
declare @IsProvider bit;
set @IsProvider = JSON_VALUE get_json_value(content,'name')
end;


