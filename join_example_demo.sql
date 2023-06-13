/*
USING JOIN - CREATED A VIEW ABOUT PATIENT FETCHING 4 TABLES
*/

USE centralized_blood_bank_system;
/*
SELECT * FROM patient_info;
SELECT * FROM patient_request;
SELECT * FROM bloods;
SELECT * FROM hospital_info;
*/


SELECT pi.First_name,
		pi.Last_name, 
        pi.Age, 
        b.Blood_group,
        pr.Quantity,
        hi.Hospital_name
        
FROM patient_info AS pi
RIGHT JOIN patient_request AS pr
ON
pr.Patient_request_id = pi.Patient_id

LEFT JOIN bloods AS b
ON
pr.Blood_id = b.Blood_id

LEFT JOIN hospital_info AS hi
ON
pr.Hospital_id = hi.Hospital_id