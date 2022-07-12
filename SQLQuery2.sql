USE record

GO

CREATE OR ALTER PROCEDURE upsert_data
AS



BEGIN

-- a_stg co dulieu, a_core ko co du lieu ( id_card is null)
-- insert du lieu tu a_stg sang a_core
-- delete_flat = 0, insert_flat = 1

	INSERT INTO a_core (name_per, age, phone_number, id_card, insert_flat, delete_flat)
		SELECT
			s.name_per
		   ,s.age
		   ,s.phone_number
		   ,s.id_card
		   ,1
		   ,0
		FROM a_stg s
		LEFT JOIN a_core c
			ON s.id_card = c.id_card
		WHERE c.id_card IS NULL


-- update ban ghi cu voi insert_flat = 0 vaf delete_flat = 0
	UPDATE ac
	SET
		ac.delete_flat = 0
	   ,ac.insert_flat = 0
	   ,ac.updated_time = GETDATE()
	FROM a_core ac
	LEFT JOIN a_stg a
		ON a.id_card = ac.id_card
	WHERE (ac.name_per != a.name_per OR ac.age != a.age OR ac.phone_number != a.phone_number)
	AND ac.insert_flat = 1

--------------------------------------
-- update 1 ban ghi o bang a_stg voi truong sdt, khi do bang a_core se them 1 ban ghi moi
-- ban ghi moi se co insert_flat = 1, delete_flat = 0
-- va ban ghi cu trong a_core se dc update voi du lieu moi va insert_flat = 0, delete_flat = 0
	INSERT INTO a_core (name_per
	, age
	, phone_number
	, id_card, delete_flat, insert_flat)
		SELECT
			a.name_per
		   ,a.age
		   ,a.phone_number
		   ,a.id_card
		   ,0
		   ,1
		FROM a_core ac
		LEFT JOIN a_stg a
			ON a.id_card = ac.id_card
		WHERE (ac.name_per != a.name_per OR ac.age != a.age OR ac.phone_number != a.phone_number)
		AND NOT EXISTS (SELECT 1 FROM a_core acd WHERE ac.insert_flat = 1 AND a.id_card = acd.id_card)
		
			

	

------------------------

-- xoa 1 ban ghi o bang a_stg 
-- dong thoi ban ghi do dung se dc xoa o bang a_core
	
	
--DELETE a_core
--	FROM a_core  acr
--	LEFT JOIN a_stg ast
--		ON acr.id_card = ast.id_card
--WHERE ast.id_card IS NULL

END