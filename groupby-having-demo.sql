/* QUERY TO FETCH DONORS BY GENDER AND GENDER HAVING MAX COUNT */
USE centralized_blood_bank_system;

SELECT Gender, COUNT(Gender) AS Count FROM donor_info
GROUP BY Gender
HAVING COUNT(Gender)  > 4;


/* QUERY TO GET TOTAL BLOOD QUANTITY FOR EACH BLOOD ID HAVING QUANTITY LESS THAN 2000 UNITS */

SELECT Blood_id, sum(Quantity) AS Total_quantity FROM centralized_blood_bank_system.blood_banks
GROUP BY Blood_id
HAVING sum(Quantity) < 2000;