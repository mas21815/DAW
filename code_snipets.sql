use Fabrica;

exec test_clear_database

exec test_Entity_add

declare @content nvarchar(2000);
set @content =N'{
	"n":"juan",
	"IsProvider":true,
	"IsConsumer":true,
	"IsPerson":true,
	"CIF":"123",
	"GCIF":"321",

}';


-- api_entity_add
-- api_entity_remove
-- api_entity_update
-- api_entity_get_id
-- api_entity_get_ids
-- api_entity_exists
-- api_entity_get_name
-- api_entity_set_name
-- api_entity_get_json
{
create function api_entity_get_json(@id int, RETURNS nvarchar(2000) )
as

SELECT  * FROM Entities WHERE Entities.IdEntitie = @id FOR JSON AUTO, without_array_wrapper;
}
-- api_entity_create_json ?

-- y == en state