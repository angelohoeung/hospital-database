--SQL Schema for Hospital Database Management System – PM2
--Database Definitions
CREATE TABLE Hospital (
hospital_ID INT NOT NULL PRIMARY KEY,
hospital_name VARCHAR(40) NOT NULL,
hospital_location VARCHAR(40) NOT NULL
);

CREATE TABLE Pharmacy (
pharmacy_ID INT NOT NULL PRIMARY KEY,
pharmacy_name VARCHAR(40) NOT NULL,
pharmacy_location VARCHAR(40) NOT NULL
);

CREATE TABLE Patient (
patient_ID INT NOT NULL PRIMARY KEY,
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
doctor_ID INT NOT NULL PRIMARY KEY,
doctor_firstname VARCHAR(25) NOT NULL,
doctor_lastname VARCHAR(25) NOT NULL,
hospital_ID INT NOT NULL,
FOREIGN KEY (hospital_ID) REFERENCES Hospital(hospital_ID)
);

CREATE TABLE Nurse (
nurse_ID INT NOT NULL PRIMARY KEY,
nurse_firstname VARCHAR(25) NOT NULL,
nurse_lastname VARCHAR(25) NOT NULL,
hospital_ID INT NOT NULL,
FOREIGN KEY (hospital_ID) REFERENCES Hospital(hospital_ID)
);

CREATE TABLE Billing (
billing_ID INT NOT NULL PRIMARY KEY,
billing_amount INT NOT NULL,
billing_date DATE NOT NULL,
patient_ID INT NOT NULL,
FOREIGN KEY (patient_ID) REFERENCES Patient(patient_ID)
);

CREATE TABLE Payment (
payment_ID INT NOT NULL PRIMARY KEY,
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

--test
SELECT * FROM Hospital;
