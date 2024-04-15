-- Database: SQL Practice

-- DROP DATABASE IF EXISTS "SQL Practice";

CREATE DATABASE "SQL Practice"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'C'
    LC_CTYPE = 'C'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
	
CREATE TABLE Members (
    MemberID serial PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(100),
    DateOfBirth DATE,
    RegistrationDate DATE,
    MembershipType VARCHAR(50)
);

CREATE TABLE Classes (
    ClassID serial PRIMARY KEY,
    ClassName VARCHAR(100),
    InstructorID INT,
    StartTime Timestamp,
    Duration INT,  -- Duration in minutes
    MaxParticipants INT,
    FOREIGN KEY (InstructorID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE Registrations (
    RegistrationID serial PRIMARY KEY,
    ClassID INT,
    MemberID INT,
    RegistrationTime timestamp,
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

CREATE TABLE Equipment (
    EquipmentID serial PRIMARY KEY,
    EquipmentName VARCHAR(100),
    PurchaseDate DATE,
    ConditionStatus VARCHAR(50)
);

CREATE TABLE Employees (
    EmployeeID serial PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Position VARCHAR(100),
    HireDate DATE
);

INSERT INTO Employees (FirstName, LastName, Position, HireDate)
VALUES ('John', 'Doe', 'Fitness Instructor', '2022-01-10');

INSERT INTO Members (FirstName, LastName, Email, DateOfBirth, RegistrationDate, MembershipType)
VALUES ('Jane', 'Smith', 'jane.smith@example.com', '1990-05-15', '2023-04-01', 'Annual');

INSERT INTO Classes (ClassName, InstructorID, StartTime, Duration, MaxParticipants)
VALUES ('Yoga Beginners', 1, '2023-04-15 08:00:00', 60, 20);

INSERT INTO Registrations (ClassID, MemberID, RegistrationTime)
VALUES (1, 1, '2023-04-14 12:34:56');

INSERT INTO Equipment (EquipmentName, PurchaseDate, ConditionStatus)
VALUES ('Treadmill', '2022-05-01', 'Good');

SELECT * FROM Members;

SELECT Classes.ClassName, Employees.FirstName, Employees.LastName
FROM Classes
JOIN Employees ON Classes.InstructorID = Employees.EmployeeID;

SELECT ClassName, COUNT(Registrations.ClassID) AS RegistrationsCount
FROM Classes
JOIN Registrations ON Classes.ClassID = Registrations.ClassID
GROUP BY Classes.ClassName;

UPDATE Members
SET Email = 'new.jane.smith@example.com'
WHERE MemberID = 1;

UPDATE Equipment
SET ConditionStatus = 'Needs Maintenance'
WHERE EquipmentID = 1;


DELETE FROM Registrations
WHERE RegistrationID = 1;

SELECT Members.FirstName, Members.LastName, Classes.ClassName, Registrations.RegistrationTime
FROM Members
JOIN Registrations ON Members.MemberID = Registrations.MemberID
JOIN Classes ON Registrations.ClassID = Classes.ClassID;

SELECT * FROM Employes;


INSERT INTO Members (FirstName, LastName, Email, DateOfBirth, RegistrationDate, MembershipType)
VALUES
('Alex', 'Johnson', 'alex.johnson@example.com', '1986-02-20', '2023-03-15', 'Monthly'),
('Linda', 'White', 'linda.white@example.com', '1979-08-31', '2023-04-01', 'Annual');

INSERT INTO Classes (ClassName, InstructorID, StartTime, Duration, MaxParticipants)
VALUES
('Cardio Kickboxing', 1, '2023-04-16 10:00:00', 45, 25),
('Strength Training', 1, '2023-04-17 18:00:00', 90, 15);

INSERT INTO Equipment (EquipmentName, PurchaseDate, ConditionStatus)
VALUES
('Elliptical Machine', '2023-01-12', 'Excellent'),
('Dumbbell Set', '2022-12-25', 'Good');

UPDATE Members
SET MembershipType = 'Monthly'
WHERE MemberID = 1;

DELETE FROM Members
WHERE MemberID = 2;

SELECT EquipmentName, PurchaseDate, ConditionStatus
FROM Equipment
WHERE ConditionStatus = 'Needs Maintenance';


















