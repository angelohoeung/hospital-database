-- Query 1: Each hospital location's total amount in billing 
-- Retrieves the total billing amount for each hospital via joining the Hospital and Billing tables first (through hospital_ID)
-- It calculates the sum total value of billing_amount based on each hospital (uses SUM()) 
-- Then it joins the Patient table on hospital_ID
-- It groups the result by hospital_name (which is then displays the sum calculation and/or the function SUM())

SELECT hospital.hospital_name, SUM(billing.billing_amount) as sum_billingamount
FROM Hospital hospital
INNER JOIN Billing billing ON patient.patient_ID = billing.patient_ID
INNER JOIN Patient patient ON hospital.hospital_ID = patient.hospital_ID
GROUP BY hospital.hospital_name;