

GO
CREATE OR ALTER PROCEDURE A_B
AS
BEGIN

	INSERT INTO B (name, age, phone_number, id_card, created, updated)
		SELECT
			ac.*
		   ,+GETDATE()
		   ,GETDATE()
		FROM A AS ac
		LEFT JOIN B AS bc
			ON ac.id_card = bc.id_card
		WHERE bc.id_card IS NULL



	UPDATE ab
	SET ab.name = ac.name
	   ,ab.age = ac.age
	   ,ab.phone_number = ac.phone_number
	   ,ab.updated = GETDATE()
	FROM A ac
	JOIN B ab
		ON ac.id_card = ab.id_card
	WHERE ac.name != ab.name
	OR ac.age != ab.age
	OR ac.phone_number != ab.phone_number




	DELETE B
		FROM B
		LEFT JOIN A
			ON B.id_card = A.id_card
	WHERE A.id_card IS NULL


END