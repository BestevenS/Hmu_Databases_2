-- DROP DATABASE IF EXISTS assignment1;
DROP TABLE IF EXISTS USERS CASCADE;
DROP TABLE IF EXISTS MESSAGES CASCADE;
DROP TABLE IF EXISTS COMENTS CASCADE;
DROP TABLE IF EXISTS LIKES CASCADE;
DROP TABLE IF EXISTS GRUPS CASCADE;
DROP TABLE IF EXISTS MEMBERS CASCADE;
DROP TABLE IF EXISTS MANAGES CASCADE;
DROP TABLE IF EXISTS FOLOWS CASCADE;

/* Δημιουργία Πίνακα {ΧΡΗΣΤΗΣ} */
CREATE TABLE USERS (
    ONOMAXEIRISTH   VARCHAR(30) NOT NULL,
    ONOMA           VARCHAR (60) NOT NULL,
    EPONYMO         VARCHAR(120) NOT NULL,
    GENOS           VARCHAR (20) NOT NULL,
    POLH            VARCHAR(60) NOT NULL,
    XORA            VARCHAR (60) NOT NULL,
	PRIMARY KEY (ONOMAXEIRISTH)
);

/* Δημιουργία Πίνακα {ΜΗΝΥΜΑ} */
CREATE TABLE MESSAGES (
    SYG_MHNYMATOS       VARCHAR(30) NOT NULL,
    KOD_MHNYMATOS       INT NOT NULL,
    IDIOKTHTHS_TOIXOY   VARCHAR (30) NOT NULL,
    PERIEXOMENO         VARCHAR (4000) NOT NULL,
    HMEROMHNIA          DATE NOT NULL,
    CHECK       (KOD_MHNYMATOS > 0),
	PRIMARY KEY (KOD_MHNYMATOS),
    FOREIGN KEY (IDIOKTHTHS_TOIXOY) REFERENCES USERS (ONOMAXEIRISTH) ON DELETE CASCADE
);

/* Δημιουργία Πίνακα {ΣΧΟΛΙΟ} */
CREATE TABLE COMENTS(
    SYG_MHNYMATOS       VARCHAR(30) NOT NULL,
    KOD_MHNYMATOS       INT NOT NULL,
    KOD_SXOLIOU         INT NOT NULL,
    SUGGRAFEAS_SXOLIOU  VARCHAR(30) NOT NULL,
    KEIMENO_SXOLIOU     VARCHAR(4000) NOT NULL,
    HMEROMHNIA          DATE NOT NULL,
    CHECK       (KOD_MHNYMATOS > 0),
    CHECK       (KOD_SXOLIOU > 0),
	PRIMARY KEY (KOD_SXOLIOU),
    FOREIGN KEY (KOD_MHNYMATOS)      REFERENCES MESSAGES (KOD_MHNYMATOS) ON DELETE CASCADE,
	FOREIGN KEY (SUGGRAFEAS_SXOLIOU) REFERENCES USERS    (ONOMAXEIRISTH) ON DELETE CASCADE
);


/* Δημιουργία Πίνακα {ΑΡΕΣΕΙ} */
CREATE TABLE LIKES (
    ONOMAXEIRISTH       VARCHAR(30) NOT NULL,
    SYG_MHNYMATOS       VARCHAR (30) NOT NULL,
    KOD_MHNYMATOS       INT NOT NULL,
    CHECK       (KOD_MHNYMATOS > 0),
	PRIMARY KEY (ONOMAXEIRISTH, KOD_MHNYMATOS),
    FOREIGN KEY (ONOMAXEIRISTH) REFERENCES USERS     (ONOMAXEIRISTH) ON DELETE CASCADE,
    FOREIGN KEY (KOD_MHNYMATOS) REFERENCES MESSAGES  (KOD_MHNYMATOS) ON DELETE CASCADE
);

/* Δημιουργία Πίνακα {Ομάδες} */
CREATE TABLE GRUPS (
    ONOMA_OMADAS    VARCHAR(30) NOT NULL,
    MEMBERS         INT NOT NULL,
    PRIMARY KEY (ONOMA_OMADAS),
    CHECK       (MEMBERS > 0)
);

/* Δημιουργία Πίνακα {Μέλη} */
CREATE TABLE MEMBERS (
    ONOMAXEIRISTH   VARCHAR(30) NOT NULL,
    ONOMA_OMADAS    VARCHAR(30) NOT NULL,
    PRIMARY KEY (ONOMAXEIRISTH, ONOMA_OMADAS),
    FOREIGN KEY (ONOMAXEIRISTH)  REFERENCES USERS (ONOMAXEIRISTH)    ON DELETE CASCADE,
    FOREIGN KEY (ONOMA_OMADAS)   REFERENCES GRUPS (ONOMA_OMADAS)     ON DELETE CASCADE
);

/* Δημιουργία Πίνακα {Ακολουθεί} */
CREATE TABLE FOLOWS (
    ONOMAXEIRISTH   VARCHAR(30) NOT NULL,
    FOLOWING        VARCHAR(30) NOT NULL,
    HMEROMHNIA      DATE NOT NULL,
    PRIMARY KEY (ONOMAXEIRISTH, FOLOWING),
    FOREIGN KEY (ONOMAXEIRISTH)  REFERENCES USERS (ONOMAXEIRISTH) ON DELETE CASCADE,
    FOREIGN KEY (FOLOWING)       REFERENCES USERS (ONOMAXEIRISTH) ON DELETE CASCADE
);

/* Δημιουργία Πίνακα {Διαχειριστές} */
CREATE TABLE MANAGES (
    ONOMAXEIRISTH   VARCHAR(30) NOT NULL,
    ONOMA_OMADAS    VARCHAR(30) NOT NULL,
    PRIMARY KEY (ONOMAXEIRISTH, ONOMA_OMADAS),
    FOREIGN KEY (ONOMAXEIRISTH) REFERENCES USERS (ONOMAXEIRISTH)    ON DELETE CASCADE,
    FOREIGN KEY (ONOMA_OMADAS)  REFERENCES GRUPS (ONOMA_OMADAS)     ON DELETE CASCADE
);


-- Εγγραφή στη βάση
INSERT INTO USERS(ONOMAXEIRISTH, ONOMA, EPONYMO, GENOS, POLH, XORA)
VALUES ('Santuri_eyme', 'Iwannis',  'papas',        'Male',     'Athens',           'Greece'),
	   ('zebra_kurda',  'Zebra',    'Kurdi',        'Female',   'Chios',            'Greece'),
	   ('Michos',       'Mixalis',  'Euzdanoglou',  'Male',     'Bolos',            'Greece'),
	   ('GianniMark',   'Iwannis',  'markou',       'Male',     'Thassaloniki',     'Greece'),
	   ('Giorgosmple',  'Gewrgios', 'Mapakis',      'Male',     'Heraklieon',       'Greece');

INSERT INTO MESSAGES(SYG_MHNYMATOS, KOD_MHNYMATOS, IDIOKTHTHS_TOIXOY, PERIEXOMENO, HMEROMHNIA)
VALUES ('Santuri_eyme',     00001, 'zebra_kurda',   'What is your real name?',   CURRENT_TIMESTAMP),
	   ('Michos',           00002, 'GianniMark',    'How are you?',             CURRENT_TIMESTAMP),
	   ('Giorgosmple',      00003, 'GianniMark',    'What is your problem?',     CURRENT_TIMESTAMP),
	   ('GianniMark',       00004, 'Michos',        'I am too busy',            CURRENT_TIMESTAMP),
	   ('zebra_kurda',      00005, 'Giorgosmple',   'Achou!!!',                 CURRENT_TIMESTAMP);

INSERT INTO COMENTS(SYG_MHNYMATOS, KOD_MHNYMATOS, KOD_SXOLIOU, SUGGRAFEAS_SXOLIOU, KEIMENO_SXOLIOU, HMEROMHNIA)
VALUES  ('Michos',          00002,  '00001', 'GianniMark',      '<3',                   CURRENT_TIMESTAMP),
        ('GianniMark',      00004,  '00002', 'Michos',          'You liar',             CURRENT_TIMESTAMP),
        ('zebra_kurda',     00005,  '00003', 'Giorgosmple',     'Bless you!',           CURRENT_TIMESTAMP),
        ('zebra_kurda',     00005,  '00004', 'Michos',          'You look too pretty',  CURRENT_TIMESTAMP);

INSERT INTO LIKES(ONOMAXEIRISTH, SYG_MHNYMATOS, KOD_MHNYMATOS)
VALUES  ('Michos',      'zebra_kurda',  00005),
        ('GianniMark',  'zebra_kurda',  00005),
        ('GianniMark',  'Santuri_eyme', 00001),
        ('GianniMark',  'Giorgosmple',  00003);

INSERT INTO GRUPS(ONOMA_OMADAS, MEMBERS)
VALUES  ('Teletambies',     15),
        ('Kairos',          12),
        ('FlatEarthers',    10);

INSERT INTO MEMBERS(ONOMAXEIRISTH, ONOMA_OMADAS)
VALUES  ('zebra_kurda', 'FlatEarthers'),
        ('GianniMark',  'Teletambies'),
        ('GianniMark',  'Kairos'),
        ('GianniMark',  'FlatEarthers'),
        ('Giorgosmple', 'Kairos'),
        ('Giorgosmple', 'FlatEarthers'),
        ('Santuri_eyme','Teletambies'),
        ('Santuri_eyme','Kairos'),
        ('Santuri_eyme','FlatEarthers'),
        ('Michos',       'Teletambies'),
        ('Michos',       'Kairos');

INSERT INTO FOLOWS(ONOMAXEIRISTH, FOLOWING, HMEROMHNIA)
VALUES  ('Santuri_eyme',    'zebra_kurda',  CURRENT_TIMESTAMP),
        ('GianniMark',      'zebra_kurda',  CURRENT_TIMESTAMP),
        ('Giorgosmple',     'Michos',       CURRENT_TIMESTAMP),
        ('Giorgosmple',     'zebra_kurda',  CURRENT_TIMESTAMP),
        ('Michos',          'zebra_kurda',  CURRENT_TIMESTAMP),
        ('zebra_kurda',     'GianniMark',   CURRENT_TIMESTAMP),
        ('zebra_kurda',     'Giorgosmple',  CURRENT_TIMESTAMP),
        ('zebra_kurda',     'Michos',       CURRENT_TIMESTAMP),
        ('zebra_kurda',     'Santuri_eyme', CURRENT_TIMESTAMP);

INSERT INTO MANAGES(ONOMAXEIRISTH, ONOMA_OMADAS)
VALUES ('zebra_kurda',  'FlatEarthers'),
       ('GianniMark',   'Teletambies'),
       ('GianniMark',   'Kairos'),
       ('Giorgosmple',  'Kairos'),
       ('Giorgosmple',  'FlatEarthers'),
       ('Santuri_eyme', 'Teletambies'),
       ('Santuri_eyme', 'FlatEarthers'),
       ('Michos',       'Teletambies'),
       ('Michos',       'Kairos');