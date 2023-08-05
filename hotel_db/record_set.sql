USE hotel_db;

INSERT INTO Client(Client_ID, Last_Name, First_Name, Second_Name, Phone, Address)
	VALUES (1, 'Ivanov', 'Ivan', 'Ivanovich', '+79123456789', 'Srednii pr VO, 34-2');
INSERT INTO Client(Client_ID, Last_Name, First_Name, Phone, Address)
	VALUES (2, 'Petrov', 'Petr', '+79234567890', 'Sadovaia ul, 17\2-23');
INSERT INTO Client(Client_ID, Last_Name, First_Name, Second_Name, Phone, Address)
	VALUES (3, 'Vasiliev', 'Vasily', 'Vasilyevich', '+7345678901', 'Nevskii pr, 9-11');
INSERT INTO Client(Client_ID, Last_Name, First_Name, Phone, Address)
	VALUES (4, 'Orlov', 'Oleg', '+7456789012', 'Botanic street, 70k1');
INSERT INTO Client(Client_ID, Last_Name, First_Name, Phone, Address)
	VALUES (5, 'Galkina', 'Galina', '+7567890123', 'Botanic street, 70k3');
INSERT INTO Client(Client_ID, Last_Name, First_Name, Second_Name, Phone, Address)
	VALUES (6, 'Sokolova', 'Svetlana', 'Ivanovna', '234-56-78', 'Peterhof highway, 8');
INSERT INTO Client(Client_ID, Last_Name, First_Name, Second_Name, Phone, Address)
	VALUES (7, 'Sokolov', 'Sergey', 'Sergeevich', '+7678901234', 'Srednii pr VO, 27-1');
INSERT INTO Client(Client_ID, Last_Name, First_Name, Second_Name, Phone)
	VALUES (8, 'Ivanov', 'Ivan', 'Andreevich', '+7789012345');
INSERT INTO Client(Client_ID, Last_Name, First_Name, Phone)
	VALUES (9, 'Zotov', 'Mikhail', '111-56-22');
INSERT INTO Client(Client_ID, Last_Name, First_Name, Second_Name, Phone, Address)
	VALUES (10, 'Anonimov', 'Anonim', 'Anonimovich', '+79220000000', 'Peterhof highway, 15');
INSERT INTO Client(Client_ID, Last_Name, First_Name, Second_Name, Phone, Address, Is_Blocked)
	VALUES (11, 'Anonimov', 'Ivan', 'Ivanovich', '+79220880000', 'Peterhof highway, 56', 1);

INSERT INTO Employee(Employee_ID, Last_Name, First_Name, Second_Name, Phone, Salary)
	VALUES (1, 'Antipov', 'Oleg', 'Olegovich', '+79236754329', 20000);
INSERT INTO Employee(Employee_ID, Last_Name, First_Name, Phone, Salary)
	VALUES (2, 'Orlov', 'Yurii', '+79246754329', 0);
INSERT INTO Employee(Employee_ID, Last_Name, First_Name, Second_Name, Phone, Salary)
	VALUES (3, 'Astakhov', 'Sergey', 'Sergeevich', '+79246754000', 0);
INSERT INTO Employee(Employee_ID, Last_Name, First_Name, Phone, Salary)
	VALUES (4, 'Efimov', 'Efim', '+79246788000', 150000.99);
INSERT INTO Employee(Employee_ID, Last_Name, First_Name, Second_Name, Phone, Salary)
	VALUES (5, 'Ivanova', 'Daria', 'Olegovna', '+79796788000', 99000.15);
INSERT INTO Employee(Employee_ID, Last_Name, First_Name, Second_Name, Phone, Salary)
	VALUES (6, 'Erofeeva', 'Olga', 'Andreyevna', '+79246788230', 25000.78);
INSERT INTO Employee(Employee_ID, Last_Name, First_Name, Phone, Salary)
	VALUES (7, 'Antipova', 'Elena', '+79246786200', 27000);

INSERT INTO Room_Type(Room_Type_ID, Room_Type_Name, Price_Per_Night, Number_Of_Rooms)
	VALUES (1, 'Economy', 10000.5, 1);
INSERT INTO Room_Type(Room_Type_ID, Room_Type_Name, Price_Per_Night, Number_Of_Rooms)
	VALUES (2, 'Standard', 15000, 2);
INSERT INTO Room_Type(Room_Type_ID, Room_Type_Name, Price_Per_Night, Number_Of_Rooms)
	VALUES (3, 'StandardPlus', 25000.55, 3);
INSERT INTO Room_Type(Room_Type_ID, Room_Type_Name, Price_Per_Night, Number_Of_Rooms)
	VALUES (4, 'Junior_Suite', 44500.9, 4);
INSERT INTO Room_Type(Room_Type_ID, Room_Type_Name, Price_Per_Night, Number_Of_Rooms)
	VALUES (5, 'Luxury', 50000, 5);

INSERT INTO Room(Room_Number, Room_Type_ID, Condition)
	VALUES (100, 1, 'Ready');
INSERT INTO Room(Room_Number, Room_Type_ID, Condition)
	VALUES (101, 1, 'Ready');
INSERT INTO Room(Room_Number, Room_Type_ID, Condition)
	VALUES (102, 1, 'Closed_For_Repairs');
INSERT INTO Room(Room_Number, Room_Type_ID, Condition)
	VALUES (103, 2, 'Ready');
INSERT INTO Room(Room_Number, Room_Type_ID, Condition)
	VALUES (104, 2, 'Closed_For_Repairs');
INSERT INTO Room(Room_Number, Room_Type_ID, Condition)
	VALUES (105, 2, 'Ready');
INSERT INTO Room(Room_Number, Room_Type_ID, Condition)
	VALUES (106, 2, 'Ready');
INSERT INTO Room(Room_Number, Room_Type_ID, Condition)
	VALUES (107, 1, 'Ready');
INSERT INTO Room(Room_Number, Room_Type_ID, Condition)
	VALUES (108, 2, 'Closed_For_Repairs');
INSERT INTO Room(Room_Number, Room_Type_ID, Condition)
	VALUES (200, 4, 'Ready');
INSERT INTO Room(Room_Number, Room_Type_ID, Condition)
	VALUES (201, 4, 'Ready');
INSERT INTO Room(Room_Number, Room_Type_ID, Condition)
	VALUES (202, 4, 'Closed_For_Repairs');
INSERT INTO Room(Room_Number, Room_Type_ID, Condition)
	VALUES (203, 3, 'Ready');
INSERT INTO Room(Room_Number, Room_Type_ID, Condition)
	VALUES (204, 3, 'Ready');
INSERT INTO Room(Room_Number, Room_Type_ID, Condition)
	VALUES (205, 4, 'Ready');
INSERT INTO Room(Room_Number, Room_Type_ID, Condition)
	VALUES (300, 5, 'Ready');
INSERT INTO Room(Room_Number, Room_Type_ID, Condition)
	VALUES (301, 5, 'Ready');
INSERT INTO Room(Room_Number, Room_Type_ID, Condition)
	VALUES (302, 5, 'Ready');
INSERT INTO Room(Room_Number, Room_Type_ID, Condition)
	VALUES (303, 5, 'Closed_For_Repairs');

INSERT INTO Service(Service_ID, Name, Price, Employee_ID)
	VALUES (1, 'Breakfast', 1000, 7);
INSERT INTO Service(Service_ID, Name, Price, Employee_ID)
	VALUES (2, 'Lunch', 1000, 7);
INSERT INTO Service(Service_ID, Name, Price, Employee_ID)
	VALUES (3, 'Dinner', 1500, 7);
INSERT INTO Service(Service_ID, Name, Price, Employee_ID)
	VALUES (4, 'Room_Cleaning', 0, 2);
INSERT INTO Service(Service_ID, Name, Price, Employee_ID)
	VALUES (5, 'Internet', 0, 4);
INSERT INTO Service(Service_ID, Name, Price, Employee_ID)
	VALUES (6, 'Car_Parking', 200, 3);

INSERT INTO Booking(Booking_ID, Booking_Date, Room_ID, Client_ID, Employee_ID,
	Check_IN_Date, Check_OUT_Date, Booking_Status, Total_Price, Payment_Option)
		VALUES (1, '2023-04-08 10:00', 100, 1, 6, '2023-07-01 12:00', '2023-07-15 12:00', 'Issued', 168007, 'Cash');
INSERT INTO Booking(Booking_ID, Booking_Date, Room_ID, Client_ID, Employee_ID,
	Check_IN_Date, Check_OUT_Date, Booking_Status, Total_Price, Payment_Option)
		VALUES (2, '2023-03-08 12:00', 101, 2, 1, '2023-06-01 12:00', '2023-06-08 12:00', 'Issued', 87503.5, 'Card');
INSERT INTO Booking(Booking_ID, Booking_Date, Room_ID, Client_ID, Employee_ID,
	Check_IN_Date, Check_OUT_Date, Booking_Status, Total_Price)
		VALUES (3, '2023-03-15 19:20', 302, 3, 1, '2023-09-01 12:00', '2023-10-01 12:00', 'Issued', 1500000);
INSERT INTO Booking(Booking_ID, Booking_Date, Room_ID, Client_ID, Employee_ID,
	Check_IN_Date, Check_OUT_Date, Booking_Status, Total_Price)
		VALUES (4, '2023-01-01 08:20', 203, 4, 1, '2023-03-01 12:00', '2023-03-10 12:00', 'Completed', 225004.95);
INSERT INTO Booking(Booking_ID, Booking_Date, Room_ID, Client_ID, Employee_ID,
	Check_IN_Date, Check_OUT_Date, Booking_Status, Total_Price, Payment_Option)
		VALUES (5, '2023-01-10 19:25', 205, 4, 6, '2023-02-01 12:00', '2023-02-10 12:00', 'Cancelled', 400508.1, 'Cash');
INSERT INTO Booking(Booking_ID, Booking_Date, Room_ID, Client_ID, Employee_ID,
	Check_IN_Date, Check_OUT_Date, Booking_Status, Total_Price, Payment_Option)
		VALUES (6, '2023-02-15 20:00', 204, 5, 6, '2023-02-16 12:00', '2023-02-17 12:00', 'Completed', 25000.55, 'Card');
INSERT INTO Booking(Booking_ID, Booking_Date, Room_ID, Client_ID, Employee_ID,
	Check_IN_Date, Check_OUT_Date, Booking_Status, Total_Price)
		VALUES (7, '2023-02-20 16:02', 302, 6, 6, '2023-02-25 12:00', '2023-02-27 12:00', 'Completed', 100000);
INSERT INTO Booking(Booking_ID, Booking_Date, Room_ID, Client_ID, Employee_ID,
	Check_IN_Date, Check_OUT_Date, Booking_Status, Total_Price, Payment_Option)
		VALUES (8, '2023-03-18 19:27', 101, 7, 1, '2023-04-01 12:00', '2023-04-15 12:00', 'Completed', 142807, 'Cash');
INSERT INTO Booking(Booking_ID, Booking_Date, Room_ID, Client_ID, Employee_ID,
	Check_IN_Date, Check_OUT_Date, Booking_Status, Total_Price, Payment_Option)
		VALUES (9, '2023-02-12 13:27', 101, 8, 6, '2023-05-01 12:00', '2023-05-08 12:00', 'Completed', 71403.5, 'Cash');
INSERT INTO Booking(Booking_ID, Booking_Date, Room_ID, Client_ID, Employee_ID,
	Check_IN_Date, Check_OUT_Date, Booking_Status, Total_Price)
		VALUES (10, '2023-01-11 18:25', 300, 9, 1, '2023-01-12 12:00', '2023-01-15 12:00', 'Completed', 153000);
INSERT INTO Booking(Booking_ID, Booking_Date, Room_ID, Client_ID, Employee_ID,
	Check_IN_Date, Check_OUT_Date, Booking_Status, Total_Price)
		VALUES (11, '2023-02-11 19:05', 203, 10, 6, '2023-03-12 12:00', '2023-03-15 12:00', 'Cancelled', 77001.65);
INSERT INTO Booking(Booking_ID, Booking_Date, Room_ID, Client_ID, Employee_ID,
	Check_IN_Date, Check_OUT_Date, Booking_Status, Total_Price)
		VALUES (12, '2023-04-11 19:55', 203, 10, 6, '2023-07-12 12:00', '2023-07-15 12:00', 'Issued', 75001.65);
INSERT INTO Booking(Booking_ID, Booking_Date, Room_ID, Client_ID, Employee_ID,
	Check_IN_Date, Check_OUT_Date, Booking_Status, Total_Price)
		VALUES (13, '2023-04-12 20:55', 203, 8, 6, '2023-01-11 12:00', '2023-01-12 12:00', 'Completed', 25000.55);

INSERT INTO Booking_Service(Booking_ID, Service_ID)
	VALUES (1, 4);
INSERT INTO Booking_Service(Booking_ID, Service_ID)
	VALUES (1, 5);
INSERT INTO Booking_Service(Booking_ID, Service_ID)
	VALUES (1, 1);
INSERT INTO Booking_Service(Booking_ID, Service_ID)
	VALUES (1, 2);
INSERT INTO Booking_Service(Booking_ID, Service_ID)
	VALUES (2, 4);
INSERT INTO Booking_Service(Booking_ID, Service_ID)
	VALUES (2, 5);
INSERT INTO Booking_Service(Booking_ID, Service_ID)
	VALUES (2, 1);
INSERT INTO Booking_Service(Booking_ID, Service_ID)
	VALUES (2, 3);
INSERT INTO Booking_Service(Booking_ID, Service_ID)
	VALUES (3, 4);
INSERT INTO Booking_Service(Booking_ID, Service_ID)
	VALUES (3, 5);
INSERT INTO Booking_Service(Booking_ID, Service_ID)
	VALUES (6, 4);
INSERT INTO Booking_Service(Booking_ID, Service_ID)
	VALUES (6, 5);
INSERT INTO Booking_Service(Booking_ID, Service_ID)
	VALUES (8, 4);
INSERT INTO Booking_Service(Booking_ID, Service_ID)
	VALUES (8, 5);
INSERT INTO Booking_Service(Booking_ID, Service_ID)
	VALUES (8, 6);
INSERT INTO Booking_Service(Booking_ID, Service_ID)
	VALUES (9, 4);
INSERT INTO Booking_Service(Booking_ID, Service_ID)
	VALUES (9, 6);
INSERT INTO Booking_Service(Booking_ID, Service_ID)
	VALUES (10, 5);
INSERT INTO Booking_Service(Booking_ID, Service_ID)
	VALUES (10, 1);
INSERT INTO Booking_Service(Booking_ID, Service_ID)
	VALUES (11, 4);
INSERT INTO Booking_Service(Booking_ID, Service_ID)
	VALUES (11, 5);
INSERT INTO Booking_Service(Booking_ID, Service_ID)
	VALUES (12, 4);
INSERT INTO Booking_Service(Booking_ID, Service_ID)
	VALUES (12, 5);