-- Query 6: patients who have been treated by a specific doctor and the nurses who have assisted in their treatment
-- several JOIN statements to connect different tables in the database
-- use the WHERE clause to filter the results based on the doctor's first and last name

SELECT p.patient_ID, p.patient_firstname, p.patient_lastname, d.doctor_firstname, d.doctor_lastname, n.nurse_firstname, n.nurse_lastname
FROM Patients_Doctors pd
JOIN Patient p ON pd.patient_ID = p.patient_ID
JOIN Doctor d ON pd.doctor_ID = d.doctor_ID
JOIN Patients_Nurses pn ON pn.patient_ID = p.patient_ID
JOIN Nurse n ON pn.nurse_ID = n.nurse_ID
WHERE d.doctor_lastname = 'Smith' AND d.doctor_firstname = 'John';