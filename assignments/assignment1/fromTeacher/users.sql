/* Δημιουργία Πίνακα {ΧΡΗΣΤΗΣ} */

CREATE TABLE USERS (
    USERID INT PRIMARY KEY,
    ONOMAXEIRISTH VARCHAR(30) NOT NULL,
    ONOMA VARCHAR (60) NOT NULL,
    EPONYMO VARCHAR(120),
    GENOS VARCHAR (20) NOT NULL,
    POLH VARCHAR(60),
    XORA VARCHAR (60) NOT NULL
);