
SELECT
	*
FROM a_stg

SELECT
	*
FROM a_core



DELETE a_core
DELETE a_stg

DELETE FROM a_core
WHERE name_per = 'Hoa'



DELETE a_core
--	FROM a_core
--	LEFT JOIN a_stg
--		ON a_core.id_card = a_stg.id_card
--WHERE a_stg.id_card IS NULL

--DELETE B
--	FROM B
--	LEFT JOIN A
--		ON B.id_card = A.id_card
--WHERE A.id_card IS NULL



UPDATE a_stg SET name_per = 'Hoa' WHERE id_card = '8274876' 





		

EXEC upsert_data



SELECT
			ac.name_per
		   ,ac.age
		   ,ac.phone_number
		   ,ac.id_card
		   ,0
		   ,1
		FROM a_core ac
		LEFT JOIN a_stg a
			ON a.id_card = ac.id_card
		WHERE a.id_card IS NULL
		AND NOT EXISTS (SELECT 1 FROM a_core acd WHERE ac.insert_flat = 0 AND a.id_card = acd.id_card)
		



DELETE FROM a_core WHERE id_card IS NULL

DELETE FROM a_stg WHERE id_card = '827487678'

		
-------------------------------------------------------
INSERT INTO a_stg
	VALUES ('Hang0', 21, '92748324', '8274876'),
	('Hang1', 211, '9274832', '8274876476'),
	('Hang2', 212, '927483247', '827487678'),
	('Hang3', 213, '927483249', '82748768'),
	('Hang4', 214, '927483244', '82748769'),
	('Hang5', 215, '927483241', '82748760'),
	('Hang6', 216, '927483243', '82748761'),
	('Hang7', 217, '927483240', '82748762'),
	('Hang8', 218, '927483242', '82748763'),
	('Hang9', 219, '9274832420', '8274876311')

