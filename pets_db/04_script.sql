SELECT Age, COUNT(*) FROM Pet GROUP BY Age;
SELECT Name, Age, COUNT(*) FROM Pet LEFT JOIN Pet_Type ON Pet.Pet_Type_ID = Pet_Type.Pet_Type_ID
													GROUP BY Pet_Type.Name, Pet.Age;
SELECT Name, AVG(convert(decimal, Pet.Age)) FROM Pet LEFT JOIN Pet_Type ON Pet.Pet_Type_ID = Pet_Type.Pet_Type_ID
											GROUP BY Pet_Type.Name HAVING AVG(convert(decimal, Pet.Age)) < 6;
SELECT Last_Name, COUNT(*) FROM Order1 LEFT JOIN Employee ON Order1.Employee_ID = Employee.Employee_ID
										LEFT JOIN Person ON Employee.Person_ID = Person.Person_ID
										WHERE Order1.Is_Done = 1
										GROUP BY Person.Last_Name
										HAVING COUNT(*) > 5;
-- ¬ывести количество заказов, выполненное работниками в сент€бре.
SELECT Last_Name, COUNT(*) AS Orders_Per_Month, MONTH(Time_Order) AS Month FROM Order1
										LEFT JOIN Employee ON Order1.Employee_ID = Employee.Employee_ID
										LEFT JOIN Person ON Employee.Person_ID = Person.Person_ID
										GROUP BY MONTH(Order1.Time_Order), Person.Last_Name
										HAVING MONTH(Order1.Time_Order) = 9;
-- ¬ывести всех животных (с названи€ми типов), в кличках которых содержитс€ буква 'a'.
-- лички выводить в инвертированном формате.
SELECT REVERSE(Nick), Age, Name FROM Pet LEFT JOIN Pet_Type ON Pet.Pet_Type_ID = Pet_Type.Pet_Type_ID
										WHERE CHARINDEX('a', Nick) <> 0;