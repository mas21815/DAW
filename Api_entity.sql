use Fabrica;
drop function api_entity_exist
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

use Fabrica

drop function api_entity_get_ids;
create function api_entity_get_ids(@name varchar(100)) RETURNS TABLE
AS
   	return SELECT IdEntitie FROM Entities WHERE name LIKE @name;

   	
