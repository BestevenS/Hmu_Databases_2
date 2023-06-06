-- 1
SELECT gender, COUNT(*) 
FROM patients 
GROUP BY gender;

-- 2
SELECT COUNT(*), array_agg(id) 
FROM patients 
WHERE address.region = 'Κρήτη';

-- 3
SELECT doctor_specialty, COUNT(distinct patient_id) 
FROM patient_doctor_specialties
GROUP BY doctor_specialty
ORDER BY COUNT(distinct patient_id) DESC
LIMIT 1;


-- 4
SELECT COUNT(*)
FROM (
    SELECT patient_id
    FROM patient_doctor_specialties
    WHERE doctor_specialty IN ('surgeon', 'pathologist')
    GROUP BY patient_id
    HAVING COUNT(distinct doctor_specialty) = 2
) as subquery;

-- 5
SELECT employee_id, COUNT(*) as appointment_count
FROM appointments a
JOIN doctors d ON a.doctor_id = d.id
WHERE d.specialty = 'pathologist'
GROUP BY employee_id
ORDER BY appointment_count DESC
LIMIT 1;

-- 6
SELECT d.id, COUNT(a.id) as appointments_count
FROM doctors d 
JOIN appointments a ON d.id = a.doctor_id
JOIN patients p ON a.patient_id = p.id
WHERE p.gender = 'female'
GROUP BY d.id
ORDER BY appointments_count DESC
LIMIT 1;
