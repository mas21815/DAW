use Fabrica
exec test_entity_remove;
exec test_entity_add
exec test_clear_database

exec test_fill_entities @pattern ='nico',@count =20;
select * from Entities
exec ap