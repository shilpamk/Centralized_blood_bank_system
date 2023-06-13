/* ONE TIME EVENT SCHEDULER, THE DATA WILL APPEAR IN THE TABLE AFTER THE SPECIFIED TIME GAP. HERE USED 1 MINUTE */

USE centralized_blood_bank_system;

SELECT * FROM donor_info;
DROP EVENT IF EXISTS one_time_event;

CREATE EVENT one_time_event
ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 1 MINUTE
DO

INSERT INTO donor_info(Donor_id, First_name, Last_name, Gender, Age, Blood_id, Address, Postcode, Contact, City)

VALUES(12, 'Deepika', 'Bhoj', 'F', 38, 7, 'Bridge street', 'BT1 3BB', 2070199888, 'Bristol');
-- VALUES(14, 'Preeti', 'Patel', 'F', 40, 6, 'German Street', 'GB2 4EB', 2070108008, 'Manchester');
-- VALUES(16, 'Manish', 'Mane', 'M', 30, 1, 'Low Street', 'LA3 1EH', 2078188888, 'London');
-- VALUES(17, 'Shweta', 'Hugar', 'F', 30, 5, 'Hosur Lane', 'HT1 1AA', 2070188888, 'Bristol');


