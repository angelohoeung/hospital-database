--SQL Schema for Hospital Database Management System – PM2
--Database Definitions
CREATE TABLE Hospital (
hospital_ID INT NOT NULL PRIMARY KEY,
hospital_name VARCHAR(40) NOT NULL,
hospital_location VARCHAR(40) NOT NULL
);

CREATE TABLE Pharmacy (
pharmacy_ID VARCHAR(10) NOT NULL PRIMARY KEY,
pharmacy_name VARCHAR(40) NOT NULL,
pharmacy_location VARCHAR(40) NOT NULL
);

CREATE TABLE Patient (
patient_ID VARCHAR(10) NOT NULL PRIMARY KEY,
patient_firstname VARCHAR(25) NOT NULL,
patient_lastname VARCHAR(25) NOT NULL,
patient_address VARCHAR(40) NOT NULL,
patient_DOB DATE NOT NULL, -- ‘DATE’ is a function in SQL, didnt realize
patient_phonenumber VARCHAR(15) NOT NULL,
patient_condition VARCHAR(40) NOT NULL,
patient_treatment VARCHAR(40) NOT NULL,
patient_checkindate DATE NOT NULL,
patient_checkoutdate DATE NOT NULL,
hospital_ID INT NOT NULL,
FOREIGN KEY (hospital_ID) REFERENCES Hospital(hospital_ID)
);

CREATE TABLE Doctor (
doctor_ID VARCHAR(10) NOT NULL PRIMARY KEY,
doctor_firstname VARCHAR(25) NOT NULL,
doctor_lastname VARCHAR(25) NOT NULL,
hospital_ID INT NOT NULL,
FOREIGN KEY (hospital_ID) REFERENCES Hospital(hospital_ID)
);

CREATE TABLE Nurse (
nurse_ID VARCHAR(10) NOT NULL PRIMARY KEY,
nurse_firstname VARCHAR(25) NOT NULL,
nurse_lastname VARCHAR(25) NOT NULL,
hospital_ID INT NOT NULL,
FOREIGN KEY (hospital_ID) REFERENCES Hospital(hospital_ID)
);

CREATE TABLE Billing (
billing_ID VARCHAR(10) NOT NULL PRIMARY KEY,
billing_amount INT NOT NULL,
billing_date DATE NOT NULL,
patient_ID INT NOT NULL,
FOREIGN KEY (patient_ID) REFERENCES Patient(patient_ID)
);

CREATE TABLE Payment (
payment_ID VARCHAR(10) NOT NULL PRIMARY KEY,
payment_amount INT NOT NULL,
payment_date DATE NOT NULL,
billing_ID INT NOT NULL,
FOREIGN KEY (billing_ID) REFERENCES Billing(billing_ID)
);

-- Insert Queries
INSERT INTO Hospital (hospital_ID, hospital_name, hospital_location)
VALUES (001, 'Windsor Central Hospital ', '110 Ouellette Ave.'),
(002, 'Windsor East Hospital', '150 Wyandotte Rd.'),
(003, 'Windsor West Hospital', '950 Wyandotte Rd.');

INSERT INTO Pharmacy (pharmacy_ID, pharmacy_name, pharmacy_location)
VALUES ('PH001', 'Windsor Central Pharmacy', '112 Ouellette Ave.'),
('PH002', 'Windsor East Pharmacy', '152 Wyandotte Rd.'),
('PH003', 'Windsor West Pharmacy', '952 Wyandotte Rd.'); 

INSERT INTO Patient (patient_ID, patient_firstname, patient_lastname, patient_address, patient_DOB, patient_phonenumber, patient_condition, patient_treatment, patient_checkindate, patient_checkoutdate, hospital_ID)
VALUES ('PT001', 'Joe', 'Douglas', '110 Abbott St.', '1994-05-21', '519-456-2094', 'Flu', 'Take Tylenol and Rest', '2023-01-15', '2023-01-20', 001),
('PT002', 'Jane', 'Wong', '220 Oak Ave.', '2005-06-30', '519-654-2005', 'Diabetes', 'Take Insulin', '2023-02-25', '2023-02-26', 002),
('PT003', 'Derek', 'Hopper', '330 Kennedy Rd.', '1987-12-17', '519-580-2087', 'Laryngitis', 'Drink Fluids and Rest', '2023-03-20', '2023-03-23', 003);

INSERT INTO Doctor (doctor_ID, doctor_firstname, doctor_lastname, hospital_ID)
VALUES ('D001', 'John', 'Smith', 001),
('D002', 'Sarah', 'Lopez', 002),
('D003', 'Mike', 'Jones', 003);

INSERT INTO Nurse (nurse_ID, nurse_firstname, nurse_lastname, hospital_ID)
VALUES ('N001', 'Jessica', 'Adams', 001),
('N002', 'Larry', 'Bond', 002),
('N003', 'Emily', 'Curry', 003);

INSERT INTO Billing (billing_ID, billing_amount, billing_date, patient_ID)
VALUES ('B001', 300, '2023-01-21', 001),
('B002', 500, '2023-02-27', 002),
('B003', 200, '2023-03-24', 003);

INSERT INTO Payment (payment_ID, payment_amount, payment_date, billing_ID)
VALUES ('PY001', 300, '2023-01-25', 001),
('PY002', 500, '2023-02-28', 002),
('PY003', 200, '2023-03-29', 003);

--test
SELECT * FROM Hospital;
