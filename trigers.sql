CREATE TABLE demo_actions(
id int PRIMARY KEY,
name varchar(100),
action varchar(100),
)
drop TRIGGER on_demo_inserted;
create TRIGGER on_demo_inserted on demo AFTER INSERT
AS
BEGIN
INSERT INTO demo_actions (id,name,action) VALUES (1,'Juan','hola')

END;

create TRIGGER on_demo_inserted2 on demo AFTER INSERT
AS
BEGIN
INSERT INTO demo_actions (id,name,action) SELECT i.id,i.name,'insert' FROM inserted i;

END;

insert into demo(demo.name,demo.hint) values ('hola','adios')

SELECT * from demo_actions

