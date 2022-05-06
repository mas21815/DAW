-- Api_state_add
create procedure api_state_add(@IdState int,@name varchar(100))
AS
BEGIN
	SET NOCOUNT ON
	insert into States(IdState,name) values (@IdState, @name)
    
END;


-- Api_state_remove
create procedure api_state_remove(@id INT)
AS
BEGIN
	SET NOCOUNT ON
	delete FROM States WHERE IdState = @id;
    
END;

-- Api_state_update
--
-- EXEC api_state_update @id = 2,@name='spain'


-- Api_state_get_id
create function api_state_get_id(@name varchar(100)) RETURNS int
AS
BEGIN
   
	DECLARE @ret INT;
   	SELECT @ret = IdState FROM States WHERE name LIKE @name;
   
   	return @ret;
END;


-- Api_state_get_ids
create function api_state_get_ids(@name varchar(100)) RETURNS TABLE
AS
   	return SELECT IdState FROM States WHERE name LIKE @name;



-- Api_state_exist
create function api_state_exist(@id int) returns bit
as
begin
declare @ret bit;

	if exists(select 1 from States where IdState=@id)
	begin
		set @ret = 1
	end
	else
	begin
		set @ret = 0;
	end;

return @ret
end;

-- Api_state_id_get_name
create function api_state_id_get_name(@id int) RETURNS varchar(100)
as
begin
	declare @name varchar(100)
	SELECT @name = States.name FROM States WHERE States.IdState LIKE @id;
return @name;
end;


-- Api_state_set_name **
Create Procedure api_state_set_name(@id INT,@name varchar(100))
as
begin
	update States
	set name = @name where IdState = @id

end;


-- Api_state_get_json **?
create function api_state_get_json(@id int, RETURNS nvarchar(2000) )
as

SELECT  * FROM States WHERE States.IdState = @id FOR JSON AUTO, without_array_wrapper;


-- Api_state_add_json
create procedure api_state_add_json(@content Nvarchar(2000), out int created_id)
as
begin
declare @Id bit;
set @Id = JSON_VALUE get_json_value(content,'id')
declare @name text;
set @name = JSON_VALUE (@content,'$.name')
end;