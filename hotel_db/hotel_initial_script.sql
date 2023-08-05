--CREATE DATABASE hotel_db;
--GO

USE hotel_db;

CREATE TABLE Client(
	Client_ID		INTEGER			NOT NULL,
	Last_Name		VARCHAR(20)		NOT NULL,
	First_Name		VARCHAR(20)		NOT NULL,
	Second_Name		VARCHAR(20),
	Phone			VARCHAR(15)		NOT NULL,
	Address			VARCHAR(20),
	Is_Blocked		BIT				DEFAULT 0		NOT NULL,
CONSTRAINT Client_Phone_Unique UNIQUE (Phone),
CONSTRAINT Client_PK PRIMARY KEY (Client_ID)
);

CREATE TABLE Employee(
	Employee_ID		INTEGER			NOT NULL,
	Last_Name		VARCHAR(20)		NOT NULL,
	First_Name		VARCHAR(20)		NOT NULL,
	Second_Name		VARCHAR(20),
	Phone			VARCHAR(15)		NOT NULL,
	Salary			MONEY			NOT NULL,
	Is_Fired		BIT				DEFAULT 0		NOT NULL,
CONSTRAINT Employee_Phone_Unique UNIQUE (Phone),
CONSTRAINT Employee_Salary_Is_Not_Negative CHECK (Salary >= 0),
CONSTRAINT Employee_PK PRIMARY KEY (Employee_ID)
);

CREATE TABLE Room(
	Room_Number		INTEGER			NOT NULL,
	Room_Type_ID	INTEGER			NOT NULL,
	Condition		VARCHAR(20)		NOT NULL,
CONSTRAINT Room_Condition CHECK (Condition IN ('Closed_For_Repairs', 'Ready')),
CONSTRAINT Room_PK PRIMARY KEY (Room_Number)
);

CREATE TABLE Room_Type(
	Room_Type_ID	INTEGER			NOT NULL,
	Room_Type_Name	VARCHAR(30)		NOT NULL,
	Price_Per_Night	MONEY			NOT NULL,
	Number_Of_Rooms	INTEGER			NOT NULL,
CONSTRAINT Price_Per_Night_Is_Not_Negative CHECK (Price_Per_Night >= 0),
CONSTRAINT Number_Of_Rooms_Is_Positive CHECK (Number_Of_Rooms > 0),
CONSTRAINT Room_Type_PK PRIMARY KEY (Room_Type_ID)
);

CREATE TABLE Service(
	Service_ID		INTEGER			NOT NULL,
	Name			VARCHAR(30)		NOT NULL,
	Price			MONEY			NOT NULL,
	Employee_ID		INTEGER			DEFAULT 0		NOT NULL,
	Demand			INTEGER			DEFAULT 0		NOT NULL,
CONSTRAINT Service_Price_Is_Not_Negative CHECK (Price >= 0),
CONSTRAINT Service_PK PRIMARY KEY (Service_ID)
);

CREATE TABLE Booking(
	Booking_ID		INTEGER			NOT NULL,
	Booking_Date	DATETIME		DEFAULT GETDATE()		NOT NULL,
	Room_ID			INTEGER			NOT NULL,
	Client_ID		INTEGER			NOT NULL,
	Employee_ID		INTEGER			NOT NULL,
	Check_IN_Date	DATETIME		NOT NULL,
	Check_OUT_Date	DATETIME		NOT NULL,
	Booking_Status	VARCHAR(30)		NOT NULL,
	Total_Price		MONEY			NOT NULL,
	Payment_Option	VARCHAR(20),
	Additional_Info	VARCHAR(50),
CONSTRAINT Booking_Status_Option CHECK (Booking_Status IN ('Issued', 'Cancelled', 'Completed')),
CONSTRAINT Payment_Option_Constraint CHECK (Payment_Option IN ('Cash', 'Card')),
CONSTRAINT Booking_Total_Price_Is_Not_Negative CHECK (Total_Price >= 0), 
CONSTRAINT Booking_PK PRIMARY KEY (Booking_ID)
);

CREATE TABLE Booking_Service(
	Booking_ID		INTEGER			NOT NULL,
	Service_ID		INTEGER			NOT NULL,
);

----------------------------------------------------------------------------

ALTER TABLE Room ADD CONSTRAINT FK_Room_Type 
    FOREIGN KEY (Room_Type_ID)
    REFERENCES Room_Type(Room_Type_ID)
;

ALTER TABLE Service ADD CONSTRAINT FK_Service_Employee 
    FOREIGN KEY (Employee_ID)
    REFERENCES Employee(Employee_ID)
;

ALTER TABLE Booking ADD CONSTRAINT FK_Booking_Room 
    FOREIGN KEY (Room_ID)
    REFERENCES Room(Room_Number) ON UPDATE CASCADE
;

ALTER TABLE Booking ADD CONSTRAINT FK_Booking_Client 
    FOREIGN KEY (Client_ID)
    REFERENCES Client(Client_ID) ON DELETE CASCADE
;

ALTER TABLE Booking ADD CONSTRAINT FK_Booking_Employee 
    FOREIGN KEY (Employee_ID)
    REFERENCES Employee(Employee_ID)
;

ALTER TABLE Booking_Service ADD CONSTRAINT FK_Booking_Service_Booking 
    FOREIGN KEY (Booking_ID)
    REFERENCES Booking(Booking_ID)
;

ALTER TABLE Booking_Service ADD CONSTRAINT FK_Booking_Service_Service 
    FOREIGN KEY (Service_ID)
    REFERENCES Service(Service_ID)
;

-------------------------------------------------------------------------------

--CREATE INDEX index_client_full_name ON Client (First_Name, Last_Name, Second_Name);
--CREATE INDEX index_employee_full_name ON Employee (First_Name, Last_Name, Second_Name);
--CREATE UNIQUE INDEX index_booking_service ON Booking_Service (Booking_ID, Service_ID);
--CREATE INDEX index_room_is_ready ON Room (Condition);

-------------------------------------------------------------------------------------

--DROP TABLE Booking_Service;
--DROP TABLE Booking;
--DROP TABLE Service;
--DROP TABLE Room;
--DROP TABLE Room_Type;
--DROP TABLE Client;
--DROP TABLE Employee;