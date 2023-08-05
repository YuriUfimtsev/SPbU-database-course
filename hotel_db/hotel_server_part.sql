USE [hotel_db]
GO

----------------------------------------------------------------------------------
-- ���������� ������ � ����� � ���������� �������� ��������� ������������ �����
----------------------------------------------------------------------------------

CREATE PROCEDURE AddNewService
@var_booking_id AS INTEGER,
@var_service_name AS VARCHAR(30)
AS
BEGIN
	DECLARE @var_service_id INTEGER;
	DECLARE @var_service_duration INTEGER;
	DECLARE @var_check_in_date DATETIME;
	DECLARE @var_check_out_date DATETIME;
	DECLARE @var_previous_price MONEY;
	DECLARE @var_services_count INTEGER;
	DECLARE @var_service_price MONEY;
	DECLARE @var_service_total_price MONEY;
	SELECT @var_services_count = COUNT(*) FROM Service WHERE Name = @var_service_name;
	IF @var_services_count = 1
		SELECT @var_check_in_date = Check_IN_Date FROM Booking WHERE Booking_ID = @var_booking_id;
		SELECT @var_check_out_date = Check_OUT_Date FROM Booking WHERE Booking_ID = @var_booking_id;
		SELECT @var_service_id = Service_ID FROM Service WHERE Name = @var_service_name;
		SELECT @var_service_duration = DATEDIFF ( d, @var_check_in_date, @var_check_out_date);
		INSERT INTO Booking_Service (Booking_ID, Service_ID)
			VALUES (@var_booking_id, @var_service_id);
		SELECT @var_previous_price = Total_Price FROM Booking WHERE Booking_ID = @var_booking_id;
		SELECT @var_service_price = Price FROM Service WHERE Service_ID = @var_service_id;
		SET @var_service_total_price = @var_service_duration * @var_service_price;
		UPDATE Booking SET Total_Price = (@var_previous_price + @var_service_total_price);
END;

-- ������ ������ ���������:
--EXECUTE AddNewService @var_booking_id=1, @var_service_name = 'Dinner';

--DROP PROCEDURE AddNewService;

GO

-------------------------------------------------------------------------------------------
-- ����� ������ ����������� ������ �� ������ ���������� ���������� ����� ������ ���� �����
-------------------------------------------------------------------------------------------
CREATE FUNCTION GetTheMostPopularRoomNumber ()
RETURNS INTEGER
BEGIN
	DECLARE @var_most_popular_room INTEGER;
	DECLARE @var_most_popular_room_count INTEGER;
	DECLARE @table_var_rooms_with_count TABLE (Room_Number INTEGER, Cnt INTEGER);
	INSERT INTO @table_var_rooms_with_count
		SELECT Room_Number, COUNT (*) FROM Room
			RIGHT JOIN Booking ON Room.Room_Number = Booking.Room_ID
			GROUP BY Room.Room_Number;
	SELECT @var_most_popular_room_count = MAX (Cnt) FROM @table_var_rooms_with_count;
	RETURN
		(SELECT Room_Number FROM @table_var_rooms_with_count
			WHERE Cnt = @var_most_popular_room_count);
END;

GO

-- ������ ������ �������:
--SELECT dbo.GetTheMostPopularRoomNumber();

--DROP FUNCTION GetTheMostPopularRoomNumber;

GO

-------------------------------------------------------------------------------------------
-- ���������� ������������� ������ ��������������
-------------------------------------------------------------------------------------------
CREATE FUNCTION GetAdministratorPerformanceIndicator (@var_employee_id INTEGER)
RETURNS FLOAT
BEGIN
	DECLARE @var_total_completed_bookings_number INTEGER;
	DECLARE @var_employee_completed_bookings_number INTEGER;
	DECLARE @var_employee_efficiency FLOAT;
	SELECT @var_total_completed_bookings_number = COUNT (*) FROM Booking
		WHERE Booking_Status = 'Completed';
	SELECT @var_employee_completed_bookings_number = COUNT (*) FROM Booking
		WHERE Booking_Status = 'Completed' AND Employee_ID = @var_employee_id;
	SET @var_employee_efficiency = (@var_employee_completed_bookings_number / CAST(@var_total_completed_bookings_number AS FLOAT)) * 100;
	RETURN @var_employee_efficiency;
END;

GO

-- ������ ������ �������:
 --SELECT dbo.GetAdministratorPerformanceIndicator (1);

 --DROP FUNCTION GetAdministratorPerformanceIndicator;

------------------------------------------------------------------------------------------------------------------------------------------------------
-- ������� �� ���������� ������ �������� ����������
-----------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TRIGGER TR_Delete_Employee ON Employee INSTEAD OF DELETE 
AS    
   UPDATE Employee SET Is_Fired = 1
       WHERE Employee_ID = (SELECT Employee_ID FROM DELETED);

-- ��������: 
DELETE FROM Employee WHERE Employee_ID = 2;
SELECT * FROM Service;

GO


-----------------------------------------------------------------------------------------------------------------------------------------------------
-- ����� ������ 50-�� ����������� ����� ����� ��������������, ���������� ��� �����, ���������� �� 10 ���������
-----------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TRIGGER TR_Insert_Booking_Super ON Booking FOR INSERT 
AS
   BEGIN
   IF ((SELECT COUNT(*) FROM Booking 
		WHERE Booking.Employee_ID = (SELECT Employee_ID FROM INSERTED) AND Booking_Status = 'Completed') % 50 = 0)
			UPDATE Employee SET Salary = (Salary * 1.1) WHERE Employee.Employee_ID = (SELECT Employee_ID FROM INSERTED);
   END;

-- ��������
-- INSERT INTO Booking (Booking_ID, Booking_Date, Room_ID, Client_ID, Employee_ID, Check_IN_Date, Check_OUT_Date, Booking_Status, Total_Price, Payment_Option)
--	VALUES ((SELECT MAX (Booking_ID) + 1 FROM Booking), '2023-04-15 20:00', 300, 7, 1, '2023-05-15 12:00', '2023-05-17 12:00', 'Completed', 100000, 'Cash');

GO

-----------------------------------------------------------------------------------------------------------------------------------------------------
-- ���������� ������������� �� ������� ���������� ����� ���������� ���������������� ����������
-----------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TRIGGER TR_Update_Service_Employee ON Employee FOR UPDATE 
AS
   BEGIN
   IF (UPDATE (Is_Fired))
		IF (SELECT Is_Fired FROM INSERTED) = 1
			UPDATE Service SET Service.Employee_ID = 1 WHERE Service.Employee_ID = (SELECT Employee_ID FROM INSERTED)
	END;

-- ��������
-- INSERT INTO Booking
-- UPDATE Employee SET Is_Fired = 1 WHERE Employee.Employee_ID = 2;
GO


-----------------------------------------------------------------------------------------------------------------------------------------------------
-- ������ �������� (������� �������, ��� �������, �������, �����, ���������� ������)
-----------------------------------------------------------------------------------------------------------------------------------------------------
CREATE VIEW V_Clients(Last_Name, First_Name, Phone, Address, Booking_Count)
AS
  SELECT Last_Name, First_Name, Phone, Address, COUNT (*)
    FROM Client LEFT JOIN Booking ON Client.Client_ID = Booking.Client_ID
		WHERE Client.Is_Blocked = 0
			GROUP BY Client.Client_ID, Client.Last_Name, Client.First_Name, Client.Phone, Client.Address;

GO

 --SELECT * FROM V_Clients;

 --DROP VIEW V_OrderList;
GO


--------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ������ ����� ������� (��������, ���������� ������, ���� �� ����, ���������� ������� ������� ���� � ����� ���������)
---------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE VIEW V_RoomTypes(Room_Type_Name, Number_Of_Rooms, Price_Per_Night, Room_Fund)
AS
  SELECT Room_Type_Name, Number_Of_Rooms, Price_Per_Night, COUNT (*)
    FROM Room_Type
		LEFT JOIN Room ON Room_Type.Room_Type_ID = Room.Room_Type_ID
			GROUP BY Room_Type.Room_Type_Name, Room_Type.Number_Of_Rooms, Room_Type.Price_Per_Night;

GO

 --SELECT * FROM V_Employees;

 -- DROP VIEW V_RoomTypes;

GO

--------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ������ ���������� (���, �������, �����, �������������� ������, ����� ������ ���� ������ ���������)
---------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE VIEW V_Employees(Last_Name, First_Name, Second_Name, Phone, Salary, Service_Name, Service_Count)
AS
  SELECT Last_Name, First_Name, Second_Name, Phone, Salary, Service.Name, COUNT (*)
    FROM Employee
		LEFT JOIN Service ON Employee.Employee_ID = Service.Employee_ID
		LEFT JOIN Booking_Service ON Service.Service_ID = Booking_Service.Service_ID
			GROUP BY Employee.Last_Name, Employee.First_Name, Employee.Second_Name, Employee.Phone, Employee.Salary, Service.Name;

GO