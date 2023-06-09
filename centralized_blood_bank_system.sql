DROP DATABASE IF EXISTS `centralized_blood_bank_system`;
CREATE DATABASE `centralized_blood_bank_system`; 
USE `centralized_blood_bank_system`;


CREATE TABLE bloods (
Blood_id INT NOT NULL,
Blood_group VARCHAR(255), 
PRIMARY KEY(Blood_id)
);

INSERT INTO bloods VALUES 
(1,'A+'),
(2,'B+'),
(3,'AB+'),
(4,'O+'),
(5,'A-'),
(6,'B-'),
(7,'AB-'),
(8,'O-');


CREATE TABLE main_blood_banks(
Id INT,
Blood_bank_name VARCHAR(30),
Location VARCHAR(255),
Contact BIGINT,
Email VARCHAR(255),
PRIMARY KEY(Id));

INSERT INTO main_blood_banks VALUES
(1, 'BLOOD_BANK_A', 'London', 7701900472, 'bbalondon@gmail.com'),
(2, 'BLOOD_BANK_B', 'Bristol', 7720900462, 'bbbbristol@gmail.com'),
(3, 'BLOOD_BANK_C', 'Manchester', 7700933489,'bbcmanchester@gmail.com'),
(4, 'BLOOD_BANK_D', 'Leeds', 7700900455, 'bbdleeds@gmail.com');


CREATE TABLE blood_banks (
Id INT,
Blood_bank_id INT,
Blood_id INT,
Quantity INT,
Blood_status VARCHAR(255),
FOREIGN KEY (Blood_id) REFERENCES bloods(Blood_id),
FOREIGN KEY(Blood_bank_id) REFERENCES main_blood_banks(Id)
);

INSERT INTO blood_banks VALUES
(1,1, 1, 1000,'Good'), 
(2,1, 2, 100,'Low'),
(3,1, 3, 1000,'Good'),
(4,1, 4, 1000,'Good'),
(5,1, 5, 600,'Good'),
(6,1, 6, 200,'Low'),
(7,1, 7, 200,'Good'),
(8,1, 8, 1000,'Good'),
(9,2, 1, 500,'Good'),
(10,2, 2, 1000,'Good'), 
(11,2, 3, 100,'Low'),
(12,2, 4, 100,'Low'),
(13,2, 5, 1000,'Good'),
(14,2, 6, 1000,'Good'),
(15,2, 7, 1000,'Good'),
(16,2, 8, 500,'Good'),
(17,3, 1, 1000,'Good'),
(18,3, 2, 1000,'Good'),
(19,3, 3, 1000,'Good'),
(20,3, 4, 300,'Low'),
(21,3, 5, 1000,'Good'),
(22,3, 6, 100,'Low'),
(23,3, 7, 1000,'Good'),
(24,3, 8, 200,'Low'),
(25,3, 1, 1000,'Good'),
(26, 4, 2, 1000,'Good'),
(27, 4, 3, 1000,'Good'),
(28, 4, 4, 300,'Low'),
(29, 4, 5, 1000,'Good'),
(30, 4, 6, 200,'Low'),
(31, 4, 7, 200,'Low'),
(32, 4, 8, 1000,'Good');


CREATE TABLE Hospital_info (
Hospital_id INT NOT NULL,
Hospital_name VARCHAR(255),
Address VARCHAR(255),
Postcode VARCHAR(255),
Contact INT,
Location VARCHAR(255),
blood_bank_id INT,
PRIMARY KEY(Hospital_id),
FOREIGN KEY(blood_bank_id) REFERENCES main_blood_banks(id)
);

INSERT INTO Hospital_info VALUES
(1,'Northwick Park Hospital', 'Watford Rd,Harrow', 'HA1 3UJ', 02088643232,'London', 1),
(2,'Mount Vernon Hospital', 'Rickmansworth Rd,Northwood', 'HA6 2RN', 01923826111,'London', 1),
(3,'Watford General Hospital', 'Vicarage Rd, Watford', 'WD18 0HB', 01923244366,'London', 1),
(4,'Southmead Hospital', 'Southmead Rd, Bristol', 'BS10 5NB', 01179505050,'Bristol', 2);


CREATE TABLE Donor_info (
Donor_id INT NOT NULL,
First_name VARCHAR(255),
Last_name VARCHAR(255),
Gender VARCHAR(255),
Age INT,
Blood_id INT,
Address VARCHAR(255),
Postcode VARCHAR(255),
Contact INT,
City VARCHAR(255),
PRIMARY KEY(Donor_id),
FOREIGN KEY (Blood_id) REFERENCES bloods(Blood_id)
);

INSERT INTO Donor_info VALUES
(1,'John', 'Smith', 'M', 35, 1,'Love Lane', 'HA2 3ED',02070184133,'London'),
(2,'Sam', 'Oakes', 'F', 30, 6,'Marsh Road', 'HA4 2DA',02070182130,'London'),
(3,'Tony', 'Wolf', 'M', 32, 4,'Preston Road', 'KA4 1DH',02070182122,'Bristol'),
(4,'Robin', 'Brown', 'M', 40, 3,'Tower Lane', 'TK4 2BA',02070182143,'Bristol'),
(5,'Thomas', 'Hardy', 'M', 35, 2,'Love Lane2', 'HA1 3ED',02070187133,'London'),
(6,'Elizabeth', 'Brown', 'F', 32, 6,'Marsh Road2', 'HB4 5DA',02072182130,'London'),
(7,'Anna', 'Devon', 'F', 31, 4,'Preston Road', 'KA1 1DH',02072182122,'Bristol'),
(8,'Maria', 'Larsson', 'F', 40, 3,'Tower Lane', 'TA2 2BA',02070182243,'Bristol'),
(9,'Yang', 'Wang', 'M', 28, 3,'Tower Lane', 'PA2 2BA',02070182223,'Manchester');


CREATE TABLE Donor_Donation_info (
Donor_Donation_info_id INT NOT NULL,
Donor_id INT,
Donation_Date VARCHAR(255),
Quantity INT,
Hospital_id INT,
PRIMARY KEY(Donor_Donation_info_id),
FOREIGN KEY (Donor_id) REFERENCES Donor_info(Donor_id),
FOREIGN KEY (Hospital_id) REFERENCES Hospital_info(Hospital_id)
);

INSERT INTO Donor_Donation_info VALUES
(1, 1,'2023-01-01', 2, 4),
(2, 2,'2023-01-01', 2, 4),
(3, 3,'2020-04-22', 3, 3),
(4, 4,'2021-05-30', 1, 2),
(5, 5,'2023-02-20', 2, 1),
(6, 6,'2023-03-11', 1, 1),
(7, 7,'2020-07-02', 3, 3),
(8,8,'2021-03-13', 1, 2);


CREATE TABLE Patient_info(
Patient_id INT NOT NULL,
First_name VARCHAR(255),
Last_name VARCHAR(255),
Age INT,
Address VARCHAR(255),
Postcode VARCHAR(255),
Contact INT,
Location VARCHAR(255),
PRIMARY KEY(Patient_id)
);

INSERT INTO Patient_info VALUES
(1,'Nick','Baily', 38,'Oxford Street', 'OX2 3BA',02070184133,'London'),
(2,'Joe','Mac', 45,'Love Lane', 'BA4 2EX',02070184133,'Bristol'),
(3,'Tom','Ness', 40,'Preston Road', 'HA5 1AD',02070184133,'London'),
(4,'Ben','Hog', 70,'Marsh Road', 'BA9 3EN',0217018413,'Bristol'),
(5,'Rosy','Max', 46,'Pinner Wood', 'HA5 1AB',0227018413,'London'),
(6,'Bob','Den', 58,'Village Way', 'BA1 12D',0237018413,'Bristol'),
(7,'Sunny','Leo', 68,'Park Way', 'HA3 2EG',0247018413,'London');


CREATE TABLE Patient_Request(
Patient_request_id INT NOT NULL,
P_id INT,
Blood_id INT,
Quantity INT,
Hospital_id INT,
Primary KEY(Patient_request_id),
FOREIGN KEY (P_id) REFERENCES Patient_info(Patient_id),
FOREIGN KEY (Blood_id) REFERENCES bloods(Blood_id),
FOREIGN KEY (Hospital_id) REFERENCES Hospital_info(Hospital_id)

);
INSERT INTO Patient_Request VALUES
(1, 1, 1, 20, 2),
(2, 2, 2, 30, 3),
(3, 3, 7, 20, 3),
(4, 4, 3, 20, 4),
(5, 4, 3, 20, 4),
(6, 4, 3, 20, 4),
(7, 1, 1, 20, 2);