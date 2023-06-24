CREATE TABLE NameBasics (
    nconst VARCHAR(255) PRIMARY KEY,
    primaryName VARCHAR(255),
    birthYear INT,
    deathYear INT
);

CREATE TABLE PrimaryProfession (
    nconst VARCHAR(255),
    profession VARCHAR(255),
    FOREIGN KEY (nconst) REFERENCES NameBasics(nconst)
);

CREATE TABLE KnownForTitles (
    nconst VARCHAR(255),
    titleId VARCHAR(255),
    FOREIGN KEY (nconst) REFERENCES NameBasics(nconst)
);