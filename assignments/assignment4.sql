-- Δημιουργούμε τους απαραίτητους τύπους
CREATE TYPE gender AS ENUM ('male', 'female');
CREATE TYPE specialty AS ENUM ('pathologist', 'urologist', 'microbiologist', 'dermatologist', 'ophthalmologist', 'surgeon');

-- Δημιουργούμε τον τύπο της διεύθυνσης
CREATE TYPE address AS (
    region VARCHAR(100),
    city VARCHAR(100),
    street VARCHAR(255)
);

-- Δημιουργούμε τους πίνακες
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone TEXT[] NOT NULL
);

CREATE TABLE doctors (
    id INTEGER PRIMARY KEY REFERENCES users(id),
    specialty specialty NOT NULL
);

CREATE TABLE patients (
    id INTEGER PRIMARY KEY REFERENCES users(id),
    afm VARCHAR(9) UNIQUE NOT NULL,
    age INTEGER NOT NULL,
    occupation VARCHAR(100),
    gender gender NOT NULL,
    address address NOT NULL
);

CREATE TABLE employees (
    id INTEGER PRIMARY KEY REFERENCES users(id),
    afm VARCHAR(9) UNIQUE NOT NULL,
    hiring_year INTEGER NOT NULL,
    salary NUMERIC(10, 2) NOT NULL
);

CREATE TABLE appointments (
    id SERIAL PRIMARY KEY,
    patient_id INTEGER REFERENCES patients(id),
    doctor_id INTEGER REFERENCES doctors(id),
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL
);

CREATE TABLE patient_doctor_specialties (
    patient_id INTEGER REFERENCES patients(id),
    doctor_specialty specialty
);

-- Εισαγωγή δεδομένων στον πίνακα 'users'
INSERT INTO users (id, first_name, last_name, email, phone) VALUES
(1, 'Γιώργος', 'Παπαδόπουλος', 'giorgos@example.com', ARRAY['6912345678']),
(2, 'Μαρία', 'Κωνσταντίνου', 'maria@example.com', ARRAY['6923456789']),
(3, 'Ελένη', 'Σταυροπούλου', 'eleni@example.com', ARRAY['6934567890']),
(4, 'Σταύρος', 'Ιωαννίδης', 'stavros@example.com', ARRAY['6945678901']);

-- Εισαγωγή δεδομένων στον πίνακα 'doctors'
INSERT INTO doctors (id, specialty) VALUES
(1, 'pathologist'),
(2, 'urologist');

-- Εισαγωγή δεδομένων στον πίνακα 'patients'
INSERT INTO patients (id, afm, age, occupation, gender, address) VALUES
(3, '123456789', 35, 'Δικηγόρος', 'female', ('Αττική', 'Αθήνα', 'Ερμού 1')),
(4, '987654321', 40, 'Μηχανικός', 'male', ('Αττική', 'Αθήνα', 'Πανεπιστημίου 2'));

-- Εισαγωγή δεδομένων στον πίνακα 'employees'
INSERT INTO employees (id, afm, hiring_year, salary) VALUES
(1, '234567890', 2015, 2500.00),
(2, '876543219', 2017, 2000.00);

-- Εισαγωγή δεδομένων στον πίνακα 'appointments'
INSERT INTO appointments (patient_id, doctor_id, appointment_date, appointment_time) VALUES
(3, 1, '2023-04-25', '09:00:00'),
(3, 2, '2023-04-25', '11:00:00'),
(4, 1, '2023-04-26', '10:00:00'),
(4, 2, '2023-04-26', '12:00:00');

INSERT INTO patient_doctor_specialties (patient_id, doctor_specialty) VALUES
(3, 'pathologist'),
(3, 'urologist'),
(4, 'pathologist'),
(4, 'urologist');
