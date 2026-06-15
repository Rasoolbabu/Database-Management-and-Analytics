create database students;
use students;
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DormName VARCHAR(50),
    RoomNumber INT,
    Major VARCHAR(50)
);
INSERT INTO Students (StudentID, FirstName, LastName, DormName, RoomNumber, Major)
VALUES 
(1, 'John', 'Doe', 'Dorm A', 101, 'Computer Science'),
    (2, 'Jane', 'Smith', 'Dorm B', 201, 'Engineering'),
    (3, 'Michael', 'Johnson', 'Dorm A', 102, 'Biology'),
    (4, 'Emily', 'Davis', 'Dorm B', 202, 'Psychology'),
    (5, 'Andrew', 'Wilson', 'Dorm C', 301, 'Business'),
    (6, 'Sophia', 'Martinez', 'Dorm A', 103, 'History'),
    (7, 'Ethan', 'Anderson', 'Dorm B', 203, 'Mathematics'),
    (8, 'Olivia', 'Garcia', 'Dorm C', 302, 'English'),
    (9, 'Daniel', 'Taylor', 'Dorm A', 104, 'Chemistry'),
    (10, 'Isabella', 'Lopez', 'Dorm C', 303, 'Physics')
    ;


CREATE TABLE Classes (
    ClassID INT PRIMARY KEY,
    ClassName VARCHAR(100),
    Location VARCHAR(100),
    StartDate DATE,
    EndDate DATE
);


INSERT INTO Classes (ClassID, ClassName, Location, StartDate, EndDate)
VALUES 
    (1, 'Introduction to Programming', 'Room 101', '2024-01-15', '2024-05-15'),
    (2, 'Database Management', 'Room 202', '2024-02-10', '2024-06-10'),
    (3, 'Advanced Programming', 'Room 103', '2024-02-20', '2024-06-20'),
    (4, 'Statistics', 'Room 204', '2024-03-10', '2024-07-10'),
    (5, 'Literature', 'Room 305', '2024-01-15', '2024-05-15'),
    (6, 'Organic Chemistry', 'Room 106', '2024-02-05', '2024-06-05'),
    (7, 'Art History', 'Room 307', '2024-01-20', '2024-05-20'),
    (8, 'Microeconomics', 'Room 108', '2024-02-15', '2024-06-15'),
    (9, 'Physical Education', 'Gymnasium', '2024-01-10', '2024-05-10'),
    (10, 'Music Theory', 'Music Room', '2024-03-01', '2024-07-01')
    ;
    CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    ClassID INT,
    Grade DECIMAL(3, 2),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID)
);
INSERT INTO Enrollments (EnrollmentID, StudentID, ClassID, Grade)
VALUES 
    (1, 1, 1, 3.5),
    (2, 2, 1, 4.0),
    (3, 3, 1, 3.0),
    (4, 4, 2, 3.7),
    (5, 5, 3, 4.0),
    (6, 6, 4, 3.5),
    (7, 7, 5, 3.2),
    (8, 8, 6, 4.0),
    (9, 9, 2, 3.9),
    (10, 10, 3, 3.8)
    ;
CREATE VIEW Student_list AS
SELECT * FROM Students;
select * from Students;
CREATE VIEW StudentClasses AS
SELECT s.FirstName, s.LastName, c.ClassName, c.Location
FROM Students s
INNER JOIN Enrollments e ON s.StudentID = e.StudentID
INNER JOIN Classes c ON e.ClassID = c.ClassID
WHERE s.StudentID IN (1, 2);
select * from StudentClasses;
CREATE VIEW DormStudents AS
SELECT *
FROM Students
WHERE DormName IN ('Dorm A', 'Dorm B', 'Dorm C');
select * from DormStudents;