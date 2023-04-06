-- Query 7: retrieves the total amount of money paid by each patient in a particular hospital, along with their primary doctor's name
-- start with the Patient table and join to the Billing and Payment tables to get the total amount of money paid by each patient.
-- join to the Patients_Doctors and Doctor tables to get the name of each patient's primary doctor.
-- use a GROUP BY clause to group the results by patient ID
-- use the SUM function to calculate the total payment amount for each patient

SELECT p.patient_ID, p.patient_firstname, p.patient_lastname, SUM(pm.payment_amount) AS total_payment_amount, d.doctor_firstname || ' ' || d.doctor_lastname AS primary_doctor_name
FROM Patient p
INNER JOIN Billing b ON p.patient_ID = b.patient_ID
INNER JOIN Payment pm ON b.billing_ID = pm.billing_ID
INNER JOIN Patients_Doctors pd ON p.patient_ID = pd.patient_ID AND pd.is_primary = 1
INNER JOIN Doctor d ON pd.doctor_ID = d.doctor_ID
WHERE p.hospital_ID = 001
GROUP BY p.patient_ID;