drop table demo_actions
CREATE TABLE demo_actions(
id int PRIMARY KEY,
name varchar(100),
action varchar(100),
moment DATETIME, 
)
drop TRIGGER on_demo_inserted;
create TRIGGER on_demo_inserted on demo AFTER INSERT
AS
BEGIN
INSERT INTO demo_actions (id,name,action) VALUES (1,'Juan','hola',)

END;

create TRIGGER on_demo_inserted2 on demo AFTER INSERT
AS
BEGIN
INSERT INTO demo_actions (id,name,action,moment) SELECT i.id,i.name,'insert',GETDATE() FROM inserted i;

END;

create TRIGGER on_demo_deleted on demo AFTER DELETE
AS
BEGIN
INSERT INTO demo_actions (id,name,action,moment) SELECT d.id,d.name,'DELETE',GETDATE() FROM deleted d;

DROP TRIGGER on_demo_begin_inserted2
create TRIGGER on_demo_beign_inserted on demo instead of insert
AS
BEGIN

INSERT INTO demo (name,hint) SELECT CONCAT(i.name,'-'),hint FROM inserted i;

END;

create TRIGGER on_demo_begin_inserted2 on demo instead of insert
AS
BEGIN

INSERT INTO demo (name,hint) SELECT CONCAT(i.name,'-'),hint FROM inserted i WHERE i.name not like '%er%';

END;

insert into demo(demo.name,demo.hint) values ('holera','adios')

SELECT * from demo_actions

