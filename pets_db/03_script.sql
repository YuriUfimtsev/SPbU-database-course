SELECT Pet.*, Pet_Type.Name FROM Pet JOIN Pet_Type ON Pet.Pet_Type_ID = Pet_Type.Pet_Type_ID
													WHERE Pet.Nick = 'Partizan';
SELECT Pet.Nick, Pet.Age, Pet.Breed, Pet_Type.Name FROM Pet JOIN Pet_Type ON Pet.Pet_Type_ID = Pet_Type.Pet_Type_ID 
																			AND Pet_Type.Name = 'DOG';
SELECT AVG(convert(decimal, Pet.Age)) FROM Pet, Pet_Type WHERE Pet.Pet_Type_ID = Pet_Type.Pet_Type_ID
																			AND Pet_Type.Name = 'CAT';
SELECT Person.Last_Name, Order1.Time_Order, Order1.Is_Done FROM Order1 JOIN Employee ON Order1.Employee_ID = Employee.Employee_ID
																		JOIN Person ON Employee.Person_ID = Person.Person_ID
																		WHERE Order1.Is_Done = 0;
SELECT Person.Last_Name, Person.First_Name, Person.Phone, Pet.Nick FROM Person, Owner, Pet, Pet_Type
																		WHERE Pet.Pet_Type_ID = Pet_Type.Pet_Type_ID
																		AND Pet_Type.Name = 'DOG'
																		AND Pet.Owner_ID = Owner.Owner_ID
																		AND Owner.Person_ID = Person.Person_ID;
SELECT Pet_Type.Pet_Type_ID, Pet_Type.Name, Pet.Nick FROM Pet_Type LEFT JOIN Pet ON Pet.Pet_Type_ID = Pet_Type.Pet_Type_ID;

-- Найти все заказы, которые проводились с животными, привитными от Coronavirus-V
SELECT Order1.Order_ID, Pet.Nick, Order1.Time_Order, Vaccine_Type.Name, Vaccine.FileScan, Vaccine.Date
													FROM Order1
													JOIN Pet ON Order1.Pet_ID = Pet.Pet_ID
													JOIN Vaccine ON Pet.Pet_ID = Vaccine.Pet_ID
													JOIN Vaccine_Type ON Vaccine.Vaccine_Type_ID = Vaccine_Type.Vaccine_Type_ID
													WHERE Vaccine_Type.Name = 'Coronavirus-V';