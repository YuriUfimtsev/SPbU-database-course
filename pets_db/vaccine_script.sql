CREATE TABLE Vaccine_Type(
	Vaccine_Type_ID					INTEGER		NOT NULL,
	Name					VARCHAR(15)
CONSTRAINT Vaccine_Type_PK PRIMARY KEY (Vaccine_Type_ID)
)
;

CREATE TABLE Vaccine(
	Date					DATETIME		DEFAULT GETDATE()    NOT NULL,
	FileScan				VARCHAR(15),					
	Pet_ID					INTEGER		NOT NULL,
	Vaccine_Type_ID				INTEGER		NOT NULL
)
;

ALTER TABLE Vaccine ADD CONSTRAINT FK_Vaccine_Pet
	FOREIGN KEY (Pet_ID)
	REFERENCES Pet(Pet_ID)
;

ALTER TABLE Vaccine ADD CONSTRAINT FK_Vaccine_Vaccine_Type
	FOREIGN KEY (Vaccine_Type_ID)
	REFERENCES Vaccine_Type(Vaccine_Type_ID)
;

INSERT INTO Vaccine_Type(Vaccine_Type_ID, Name) VALUES (1, 'Coronavirus-V')
INSERT INTO Vaccine_Type(Vaccine_Type_ID, Name) VALUES (2, 'Coronavirus-S')
INSERT INTO Vaccine_Type(Vaccine_Type_ID, Name) VALUES (3, 'Coronavirus-T')

INSERT INTO Vaccine(Date, FileScan, Pet_ID, Vaccine_Type_ID) VALUES ('2023-01-05 00:00', 'Report1.txt', 1, 1)
INSERT INTO Vaccine(Date, FileScan, Pet_ID, Vaccine_Type_ID) VALUES ('2023-01-06 00:00', 'Report1.txt', 2, 2)
INSERT INTO Vaccine(Date, FileScan,  Pet_ID, Vaccine_Type_ID) VALUES ('2023-01-07 00:00', 'Report1.txt', 3, 3)

DROP TABLE Vaccine;
DROP TABLE Vaccine_Type;