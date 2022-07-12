


declare @i int = 0;

declare @temp int;

declare @tbl table (id int, phone varchar(10))

if (@i = 0) 
begin
	select @temp = 1
end 

set @i = 0 ;

while(@i < 100)
begin
	print @i;
	set @i = @i + 1;

end

print '----------------'

print @temp


CREATE DATABASE record
USE record
CREATE TABLE A_core (
name varchar(30),
age int,
phone_number char(11),
id_card char(12),
created datetime,
updated datetime,
delete_flat bit,
insert_flat bit
)
create table a_stg
(
name varchar(30),
age int,
phone_number char(11),
id_card char(12)
)
insert into a_stg values 
('Hằng',21,'92748324','8274876'),
('Hằng1',211,'9274832','8274876476'),
('Hằng2',212,'927483247','827487678'),
('Hằng3',213,'927483249','82748768'),
('Hằng4',214,'927483244','82748769'),
('Hằng5',215,'927483241','82748760'),
('Hằng6',216,'927483243','82748761'),
('Hằng7',217,'927483240','82748762'),
('Hằng8',218,'927483242','82748763'),
('Hằng9',219,'9274832420','8274876311')

select * from a_stg
select * from A_core 

delete from a_stg
delete from A_core 

insert into A_core values ('Hằng',21,'92748324','82748762','2002/01/02','2021/04/23',null,null),
					('Hằng1',21,'092748324','82748761','2002/02/12','2021/08/25',null,null),
					('Hương',21,'192748327','82748767','2002/08/01','2021/07/09',null,null),
					('Hoa',21,'292748329','82748769','2002/02/10','2021/06/15',null,null)
insert into A_core values ('Hằng',21,'92748324','82748762','2002/01/02','2021/06/23',null,1)
-- neu chua co ban ghi

insert into A_core (name, age, phone_number, id_card)
select a_stg.*
from a_stg left join A_core
on a_stg.name = A_core.name
and a_stg.name is null


-- neu thieu ban ghi



update A_core
set A_core.name = a_stg.name, A_core.age = a_stg.age, A_core.phone_number = a_stg.phone_number, A_core.id_card = a_stg.id_card
from a_stg right join A_core
on a_stg.name = A_core.name
and a_stg.name is null


-- neu co roi 


insert into A_core (name, age, phone_number, id_card)
select a_stg.*
from a_stg join A_core 
on a_stg.name = A_core.name
and (a_stg.name != A_core.name or a_stg.age != A_core.age or a_stg.phone_number != A_core.phone_number or a_stg.id_card != A_core.id_card)




update A_core
set A_core.name = a_stg.name, A_core.age = a_stg.age, A_core.phone_number = a_stg.phone_number, A_core.id_card = a_stg.id_card
from a_stg inner join A_core 
on a_stg.name = A_core.name
and (a_stg.name != A_core.name or a_stg.age != A_core.age or a_stg.phone_number != A_core.phone_number or a_stg.id_card != A_core.id_card)
and A_core.insert_flat = 1



insert into A_core (name, age, phone_number, id_card)
select a_stg.*
from a_stg left join A_core
on a_stg.name = A_core.name
and a_stg.name is null


create procedure insert_record

	@name varchar(30),
	@age int,
	@phone_number char(11),
	@id_card char(12),
	@StatementType nvarchar(20)

AS
IF @StatementType = 'INSERT'
BEGIN
INSERT INTO a_stg( name, age, phone_number, id_card )
VALUES (@name, @age, @phone_number, @id_card)
END
GO


DROP PROCEDURE insert_record


SELECT * FROM A_core
create procedure insert_A_core

	@name varchar(30),
	@age int,
	@phone_number char(11),
	@id_card char(12),
	@created datetime,
	@updated datetime,
	@delete_flat bit,
	@insert_flat bit,
	@StatementType nvarchar(20)

AS
IF @StatementType = 'INSERT'
BEGIN
INSERT INTO A_core( name, age, phone_number, id_card, created, updated, delete_flat, insert_flat)
VALUES (@name, @age, @phone_number, @id_card, @created, @updated, @delete_flat, @insert_flat)
END
GO