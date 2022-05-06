create database test1;

use test1;

create table demo(

id int primary key,
name varchar(100),
description varchar(100)
);

create procedure testIterator ()
as
begin
declare c CURSOR for select name from demo;
declare @name varchar(100);
open c;
fetch next from c into @name;
while @@FETCH_STATUS = 0
begin

print(@name);
fetch next from c into @name;
end

close c;

deallocate c

end;




nuevo coche c
nueva rueda r
c.rueda = r
r.car= c -- memory leak

arc = 2 y 2 y si haces 2 nulls pasa a arc = 1 y 1  en vez de o y 0

weak references

-- meter 10 reg en demo con un bucle