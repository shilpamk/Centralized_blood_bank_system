/* STORED PROCEDURE TO GET TOTAL QUANTITY OF BLOOD FOR ANY BLOOD ID */

USE centralized_blood_bank_system;

DELIMITER //
DROP PROCEDURE IF EXISTS spTotalBloodQuantity;
CREATE PROCEDURE spTotalBloodQuantity(IN bloodID INT)
BEGIN 
SELECT Blood_bank_id, Blood_id, Quantity, Blood_status FROM blood_banks 
WHERE blood_banks.Blood_id = bloodID
;
END //
DELIMITER ;

/* EXAMPLE QUERY */
 CALL spTotalBloodQuantity(1);