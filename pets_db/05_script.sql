SELECT Order_ID, Is_Done, Mark FROM Order1 WHERE Order1.Order_ID IN (SELECT Order_ID FROM Order1 JOIN Employee
												ON Order1.Employee_ID = Employee.Employee_ID
												WHERE Employee.Spec = 'student'
												AND Order1.Is_Done = 1);
SELECT Last_Name FROM Employee LEFT JOIN Person ON Employee.Person_ID = Person.Person_ID
												WHERE Employee.Employee_ID NOT IN (SELECT Employee.Employee_ID FROM Employee
												 ÿœ–≈ JOIN Order1 ON Employee.Employee_ID = Order1.Employee_ID);
SELECT Service.Name, Time_Order, Employee1.Last_Name, Nick,Owner1.Last_Name FROM Order1
												LEFT JOIN Service ON Order1.Service_ID = Service.Service_ID
												LEFT JOIN Employee ON Order1.Employee_ID = Employee.Employee_ID
												LEFT JOIN Person AS Employee1 ON Employee.Person_ID = Employee1.Person_ID
												LEFT JOIN Pet ON Order1.Pet_ID = Pet.Pet_ID
												LEFT JOIN Owner ON Order1.Owner_ID = Owner.Owner_ID
												LEFT JOIN Person AS Owner1 ON Owner.Person_ID = Owner1.Person_ID;
SELECT Comments FROM Order1 WHERE Comments <> ''
UNION ALL
SELECT Description FROM Owner WHERE Description <> ''
UNION ALL
SELECT Description FROM Pet WHERE Description <> '';

SELECT Last_Name, First_Name FROM Person JOIN Employee ON Person.Person_ID = Employee.Employee_ID
												WHERE EXISTS (SELECT * FROM Order1
												WHERE Employee.Employee_ID = Order1.Employee_ID AND Mark = 5);
