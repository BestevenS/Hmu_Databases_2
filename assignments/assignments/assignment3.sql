CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) NOT NULL
);

CREATE TABLE doctors (
    id INTEGER PRIMARY KEY REFERENCES users(id),
    specialty VARCHAR(100) NOT NULL
);

CREATE TABLE patients (
    id INTEGER PRIMARY KEY REFERENCES users(id),
    afm VARCHAR(9) UNIQUE NOT NULL,
    age INTEGER NOT NULL,
    occupation VARCHAR(100),
    gender CHAR(1) NOT NULL,
    address VARCHAR(255) NOT NULL
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

INSERT INTO users (first_name, last_name, email, phone) VALUES
('Γιώργος', 'Παπαδόπουλος', 'giorgos@example.com', '6912345678'),
('Μαρία', 'Κωνσταντίνου', 'maria@example.com', '6923456789'),
('Ελένη', 'Σταυροπούλου', 'eleni@example.com', '6934567890'),
('Σταύρος', 'Ιωαννίδης', 'stavros@example.com', '6945678901');

INSERT INTO doctors (id, specialty) VALUES
(1, 'Οδοντίατρος'),
(2, 'Ορθοπεδικός');

INSERT INTO patients (id, afm, age, occupation, gender, address) VALUES
(3, '123456789', 35, 'Δικηγόρος', 'Γ', 'Ερμού 1, Αθήνα'),
(4, '987654321', 40, 'Μηχανικός', 'Α', 'Πανεπιστημίου 2, Αθήνα');

INSERT INTO employees (id, afm, hiring_year, salary) VALUES
(1, '234567890', 2015, 2500.00),
(2, '876543219', 2017, 2000.00);

INSERT INTO appointments (patient_id, doctor_id, appointment_date, appointment_time) VALUES
(3, 1, '2023-04-25', '09:00:00'),
(3, 2, '2023-04-25', '11:00:00'),
(4, 1, '2023-04-26', '10:00:00'),
(4, 2, '2023-04-26', '12:00:00');