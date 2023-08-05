INSERT INTO Person (Person_ID, Last_Name, First_Name, Phone, Address)
								SELECT MAX(Person_ID) + 1, 'Ufimtsev', 'Yuri', '+79998887770', 'Peterhof' FROM Person;
UPDATE Order1 SET Comments = CONCAT('(s)', Comments) WHERE Employee_ID IN
								(SELECT Employee_ID FROM Employee WHERE Spec = 'student');

CREATE TABLE Document(
		Person_ID	INTEGER		NOT NULL,
		Number		INTEGER		NOT NULL,
		Type	VARCHAR(20)		NOT NULL
);

ALTER TABLE Document ADD CONSTRAINT FK_Document_Person 
    FOREIGN KEY (Person_ID)
    REFERENCES Person(Person_ID)
	ON DELETE CASCADE;
INSERT INTO Document (Person_ID, Number, Type)
						VALUES((SELECT MAX(Person_ID) FROM Person), 1, 'passport');
INSERT INTO Document (Person_ID, Number, Type)
						VALUES((SELECT MAX(Person_ID) FROM Person), 2, 'birth certificate');
DELETE FROM Person WHERE Person_ID = (SELECT MAX(Person_ID) FROM Person);