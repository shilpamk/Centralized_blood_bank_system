/* CREATE A STORED FUNCTION TO CHECK IF DONORS REQUIRED BASED ON THE BLOOD QUANTITY */

USE centralized_blood_bank_system;

DELIMITER //
DROP FUNCTION IF EXISTS is_donor_required;
CREATE FUNCTION is_donor_required(
    blood_quantity INT
) 
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE donor_required VARCHAR(20);
    IF blood_quantity <= 500 THEN
        SET donor_required = 'YES';
    ELSEIF (blood_quantity > 500 AND 
            blood_quantity < 1000) THEN
        SET donor_required = 'MAYBE';
    ELSEIF blood_quantity >= 1000 THEN
        SET donor_required = 'NO';
    END IF;
    RETURN (donor_required);
END//blood_quantity
DELIMITER ;

SELECT * FROM centralized_blood_bank_system.blood_banks;

SELECT 
    Blood_bank_id,
    Blood_id,
    Quantity,
    is_donor_required(Quantity)
FROM
    blood_banks;

