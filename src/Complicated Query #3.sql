-- Query 3: Display the list of hospitals that have no patients checked-in on a given date, along with their locations.
-- uses a left join to include all hospitals in the result, and filters out the ones that have patients checked-in on a specific date.
-- It selects the hospital name and location, and uses the DISTINCT keyword to remove duplicates.

SELECT DISTINCT h.hospital_name, h.hospital_location
FROM Hospital h
LEFT JOIN Patient p ON h.hospital_ID = p.hospital_ID
WHERE p.patient_checkindate <> '2023-03-20' OR p.patient_checkindate IS NULL;