USE [hotel_db]
GO

 -- (01) ������ � ������, ������� �������� ����� ������� � ������� �����������, ���������� �����.

SELECT Booking.Booking_ID, Employee.Last_Name AS EmployeeSurname, Booking.Check_IN_Date, Booking.Check_OUT_Date,
	Client.Last_Name AS ClientSurname, Booking.Room_ID, Room_Type.Room_Type_Name, Booking.Total_Price
		FROM Booking LEFT JOIN Employee ON Booking.Employee_ID = Employee.Employee_ID
					 LEFT JOIN Client ON Booking.Client_ID = Client.Client_ID
					 LEFT JOIN Room ON Booking.Room_ID = Room.Room_Number
					 LEFT JOIN Room_Type ON Room.Room_Type_ID = Room_Type.Room_Type_ID
		ORDER BY Booking.Check_IN_Date;

 -- (02) ���������� ��������� ��� ����������� ������ �� ���������� ���� ������: �����/���/�� ������

SELECT Booking.Payment_Option, Booking.Booking_Status, COUNT (*) AS BookingsCount
		FROM Booking
			GROUP BY Booking.Payment_Option, Booking.Booking_Status
			HAVING Booking.Booking_Status = 'Issued' OR Booking.Booking_Status = 'Completed';

-- (03) �������, ������������������ �� ����� ����� ������

SELECT Client.Client_ID, Client.Last_Name, Client.First_Name, Client.Phone
		FROM Client
		WHERE EXISTS (SELECT * FROM Booking WHERE Booking.Client_ID = Client.Client_ID)
		ORDER BY Last_Name, First_Name;

-- (04) ���� ������� �� ���������� ����� 30000 �� ����

SELECT Room_Type.Room_Type_Name, Room_Type.Price_Per_Night
		FROM Room_Type,
		(SELECT Room_Type.Room_Type_ID FROM Room_Type WHERE Price_Per_Night < 30000) RoomTypeSubquery
		WHERE Room_Type.Room_Type_ID = RoomTypeSubquery.Room_Type_ID;

-- (05) ��������� ������� ������� ���� � ���������� �����������
--			(����� ������� � ��������� ������ �������/����� ����� ������� ������� ����)

SELECT Room_Type.Room_Type_ID, Room_Type.Room_Type_Name,
		((CAST ((SELECT COUNT (*) FROM Room WHERE Room.Room_Type_ID = Room_Type.Room_Type_ID AND Room.Condition = 'Ready') AS FLOAT))
		/
		(SELECT COUNT (*) FROM Room WHERE Room.Room_Type_ID = Room_Type.Room_Type_ID) * 100.0)
		AS StatePercentage
		FROM Room_Type
		ORDER BY StatePercentage DESC;

-- (06) ������� ����������� ��������������� + ����� ��������� ������ + �����

SELECT Employee.Employee_ID, Employee.Last_Name, Employee.First_Name, COUNT (*) AS BookingsCount, Employee.Salary
		FROM Employee
			RIGHT JOIN Booking ON Employee.Employee_ID = Booking.Employee_ID
			GROUP BY Employee.Last_Name, Employee.First_Name, Employee.Employee_ID, Employee.Salary
			ORDER BY BookingsCount DESC;

-- (07) ������� ����������, ���������� �� ���. ������ + ���������� ������ ������ ��������� � ������ + �����

SELECT Employee.Employee_ID, Employee.Last_Name, Employee.First_Name, COUNT (*) AS ServiceSelectionCount, Employee.Salary
		FROM Employee
			RIGHT JOIN Service ON Employee.Employee_ID = Service.Service_ID
			LEFT JOIN Booking_Service ON Service.Service_ID = Booking_Service.Service_ID
			GROUP BY Employee.Last_Name, Employee.First_Name, Employee.Employee_ID, Employee.Salary
			ORDER BY ServiceSelectionCount DESC;

-- (08) ����������, ������ ������� ���� �� ��� ���� ������� ���������

SELECT Employee.Last_Name, Employee.First_Name, Employee.Phone, Employee.Is_Fired
		FROM Employee
		WHERE Employee.Employee_ID IN
			(SELECT DISTINCT Employee.Employee_ID FROM Employee, Service, Booking_Service
				WHERE Employee.Employee_ID = Service.Employee_ID
					AND Service.Service_ID = Booking_Service.Service_ID);

-- (09) ������ � �������������� �������: ��������, ����, ��� �������������� ����������

SELECT Service.Name, Service.Price, Employee.Last_Name, Employee.First_Name, Employee.Second_Name
		FROM Service, Employee
		WHERE Service.Employee_ID = Employee.Employee_ID;

-- (10) ������ ��������� �����: �����, ���������, �������� ����, ���������� ������, ���� �� ����

SELECT Room.Room_Number, Room.Condition, Room_Type.Room_Type_Name, Room_Type.Number_Of_Rooms, Room_Type.Price_Per_Night
		FROM Room
		LEFT JOIN Room_Type ON Room.Room_Type_ID = Room_Type.Room_Type_ID
		ORDER BY Room.Room_Number;

-- (11) ������ ��� ���� ��������������� ��������

SELECT Client.Last_Name, Client.First_Name, Client.Second_Name, Client.Phone, Client.Address, Client.Is_Blocked
		FROM Client
		WHERE Client.Is_Blocked= 1
		ORDER BY Client.Last_Name;

-- (12) ����� ������ ���� �� ��������������� ����� � ���������, �������� ��� ��� ������

SELECT Employee.Last_Name, Employee.First_Name, '��������'
		FROM Employee
		WHERE Employee.Is_Fired = 0
		UNION ALL
SELECT Client.Last_Name, Client.First_Name, '������'
		FROM Client
		WHERE Client.Is_Blocked = 0
		ORDER BY Employee.Last_Name;