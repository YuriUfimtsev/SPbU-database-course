CREATE VIEW dogs
	AS SELECT Nick, Breed, Age, Last_Name, First_Name FROM Pet
		LEFT JOIN Pet_Type ON Pet.Pet_Type_ID = Pet_Type.Pet_Type_ID
		LEFT JOIN Owner ON Pet.Owner_ID = Owner.Owner_ID
		LEFT JOIN Person ON Owner.Person_ID = Person.Person_ID
		WHERE Pet_Type.Name = 'dog';
GO
CREATE VIEW employee_rating
	AS SELECT Last_Name, First_Name, COUNT(*) AS comleted_orders_number, AVG(convert(decimal, Mark)) AS average FROM Employee
		LEFT JOIN Person ON Employee.Person_ID = Person.Person_ID
		LEFT JOIN Order1 ON Employee.Employee_ID = Order1.Employee_ID
GO
CREATE VIEW customers
	AS SELECT Last_Name, First_Name, Phone, Address FROM Owner
		LEFT JOIN Person ON Owner.Person_ID = Person.Person_ID;
GO
SELECT Nick, Last_Name FROM dogs WHERE Breed = 'poodle';

SELECT * FROM employee_rating ORDER BY average DESC;

UPDATE customers SET Address = '?'
	WHERE Address IS NULL OR Address LIKE '';
SELECT * from customers;