/* SUBQUERIES */
                         
/* FIND ALL THE BLOOD BANKS WHERE THE BLOOD QUANTITY IS LESS THAN 500 UNITS */
USE centralized_blood_bank_system;

WITH results AS
(
SELECT bb.Blood_bank_id, bb.Blood_id, bb.Quantity
FROM blood_banks AS bb
WHERE bb.Quantity IN (SELECT Quantity FROM blood_banks WHERE Quantity = 200)
) 
SELECT res.Blood_bank_id, b.*, res.Quantity FROM results AS res
JOIN bloods AS b
WHERE res.Blood_id = b.Blood_id
;


