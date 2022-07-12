CREATE DATABASE abc

CREATE TABLE A (
	name VARCHAR(30)
   ,age INT
   ,phone_number CHAR(11)
   ,id_card CHAR(12)
)

CREATE TABLE B (
	name VARCHAR(30)
   ,age INT
   ,phone_number CHAR(11)
   ,id_card CHAR(12)
   ,created DATETIME
   ,updated DATETIME
)


SELECT GETDATE()
DELETE A
DELETE B


SELECT * FROM A 
SELECT * FROM B

SELECT ac.* , bc.*
	FROM A AS ac LEFT JOIN B AS bc ON ac.id_card = bc.id_card
	WHERE bc.id_card IS null



DELETE  FROM A 
WHERE A.id_card = '8274876'


DELETE B
FROM B LEFT JOIN A ON B.id_card = A.id_card
WHERE A.id_card IS null



UPDATE ab SET ab.name = ac.name, ab.age = ac.age , ab.phone_number = ac.phone_number, ab.updated = GETDATE()
FROM A ac JOIN B ab ON ac.id_card = ab.id_card
WHERE ac.name != ab.name OR ac.age != ab.age OR ac.phone_number != ab.phone_number




SELECT ac.*, ab.*
FROM A ac LEFT JOIN B ab ON ac.id_card = ab.id_card
WHERE ac.name != ab.name OR ac.age != ab.age OR ac.phone_number != ab.phone_number




EXEC A_B

INSERT INTO A
	VALUES
	('Hang0',21,'92748324','8274876'),
	('Hang1', 211, '9274832', '8274876476'),
	('Hang2', 212, '927483247', '827487678'),
	('Hang3', 213, '927483249', '82748768'),
	('Hang4', 214, '927483244', '82748769'),
	('Hang5', 215, '927483241', '82748760'),
	('Hang6', 216, '927483243', '82748761'),
	('Hang7', 217, '927483240', '82748762'),
	('Hang8', 218, '927483242', '82748763'),
	('Hang9', 219, '9274832420', '8274876311')

UPDATE a SET NAME = 'HANG123454' WHERE id_card = '8274876'
