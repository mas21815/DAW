use Fabrica;
create procedure test_clear_database
as
begin
	
	--delete from phones;
	-- delete from sings;
	--delete from FactoriesProducts;
	--delete from Provides;
	--delete from Materials;
	--delete from Lines;
	delete from Entities;
	--delete from Factories;

end;
drop procedure test_Entity_add;
create procedure test_Entity_add
as
begin
print 'Pasando el test test_Entity_add ...'
	declare @count_0 int;
	select @count_0 = COUNT(*) from Entities;
	print 'count_0 vale'+ cast(@count_0 as varchar(100))
	declare @Created_id int;
	exec api_entity_add @name = 'Tomas',@IsProvider = TRUE,@IsConsumer = TRUE,@IsPerson = TRUE, @entity_id = @Created_id output;
	declare @count_1 int;
	select @count_1 = COUNT(*) from Entities;
	print 'count_0 vale'+ cast(@count_1 as varchar(100))
	if (@count_1 - @count_0) <> 1
	begin
		raiserror ('test_entity_add ha fallado',18,1)
	END;
	declare @name varchar(100);
	declare @IsProvider BIT;
	declare @IsConsumer BIT;
	declare @IsPerson BIT;

	select @name = name,@IsProvider = IsProvider,@IsConsumer= IsConsumer,@IsPerson = IsPerson from Entities where IdEntitie = @Created_id;
	print 'name vale'+ cast(@name as varchar(100))
	if @name not like 'Tomas'
	begin
		raiserror ('test_entity_add-Los nombres no coinciden',18,1)
	end;
	if @IsProvider = 0
	begin
		raiserror ('test_entity_add-Los valores:@IsProvider no coinciden',18,1)
	end;
	if @IsConsumer = 0
	begin
		raiserror ('test_entity_add-Los valores:@IsConsumer no coinciden',18,1)
	end;
	if @IsPerson = 0
	begin
		raiserror ('test_entity_add-Los valores:@IsPerson no coinciden',18,1)
	end;
end;

-- Return exist (select * from entities where id= 35)

create procedure test_entity_remove
as
begin
 declare @created_id INT;
 exec api_entity_add @name = 'Tomas',@IsProvider = TRUE,@IsConsumer = TRUE,@IsPerson = TRUE, @entity_id = @Created_id;
 exec api_entity_remove @created_id ;
 declare @exist bit;

 set @exist = dbo.api_entity_exist(@created_id)

 if @exist = 1
 begin
  raiserror ('test_entity_remove - entidad no borrada',18,1)
 end
 else
 begin
 print 'entidad borrada'
 end;


end;

drop procedure test_fill_entities
create procedure test_fill_entities(@pattern varchar(100), @count int)
as
begin

declare @i INT;
declare @Created_id int;
    SET @i = 0;
    while @i < @count
    BEGIN
    	DECLARE @current_name varchar(100);
		set @current_name = CONCAT(@pattern,@i)
		EXEC api_entity_add @name = @current_name,@IsProvider = TRUE,@IsConsumer = TRUE,@IsPerson = TRUE, @entity_id = @Created_id;
    
    	set @i =@i+1  -- sql server cat string name
    END

end;

create procedure test_entity_get_id
as
begin
	declare @id0 int;
	declare @name varchar(100);
	set @name = dbo.test_get_entity_unused_name();
	set @id0 = dbo.api_entity_get_id(@name);
	declare @id1 int;
	exec api_entity_add @name, @IsProvider=true,@IsConsumer=true,@IsPerson=false,@entity_id=@id1 OUTPUT;
	declare @id2 int;
	set @id2 = dbo.api_entity_get_id(@name);

	if @id0 <> null
		raiserror('test_entity_get_id',18,1);
	if @id1 <> @id2
		raiserror('test_entity_get_id',18,1);
	if @id2 = null
		raiserror('test_entity_get_id',18,1);

end;

drop procedure test_get_entity_unused_name
create procedure test_get_entity_unused_name
as
begin
	declare @name varchar(100);
	declare @tryname varchar(100) = 'pwpw';
	while @name is null
	begin
		if not exists (select * from Entities where name like @tryname)
			begin
				set @name = @tryname;
			end;
	end; 
	return @name
end;