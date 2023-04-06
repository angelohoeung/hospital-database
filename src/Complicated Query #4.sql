-- Query 4: retrieves information about patients who have the condition "Diabetes", including their ID, name, condition, treatment, their assigned doctor's ID and name, as well as the name and location of the hospital they're staying in.
-- The query achieves this by joining the Patient, Patients_Doctors, Doctor, and Hospital tables using their foreign keys.
-- Uses '||' to concatenate

SELECT 
    p.patient_ID, 
    p.patient_firstname || ' ' || p.patient_lastname AS patient_name, 
    p.patient_condition, 
    p.patient_treatment, 
    d.doctor_ID, 
    d.doctor_firstname || ' ' || d.doctor_lastname AS doctor_name, 
    h.hospital_name, 
    h.hospital_location 
FROM 
    Patient p 
    INNER JOIN Patients_Doctors pd ON p.patient_ID = pd.patient_ID 
    INNER JOIN Doctor d ON pd.doctor_ID = d.doctor_ID 
    INNER JOIN Hospital h ON p.hospital_ID = h.hospital_ID 
WHERE 
    p.patient_condition = 'Diabetes';