CREATE DATABASE CompanyDB;
USE CompanyDB;

-- Departments Table
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY AUTO_INCREMENT,
    DeptName VARCHAR(50) NOT NULL UNIQUE,
    Location VARCHAR(50),
    Budget DECIMAL(12,2)
);

-- Employees Table
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DeptID INT,
    Position VARCHAR(50),
    HireDate DATE,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

-- Salaries Table
CREATE TABLE Salaries (
    SalaryID INT PRIMARY KEY AUTO_INCREMENT,
    EmpID INT,
    BasicSalary DECIMAL(10,2),
    Bonus DECIMAL(10,2),
    PayDate DATE,
    FOREIGN KEY (EmpID) REFERENCES Employees(EmpID)
);

-- Projects Table
CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY AUTO_INCREMENT,
    ProjectName VARCHAR(100),
    DeptID INT,
    StartDate DATE,
    EndDate DATE,
    Budget DECIMAL(12,2),
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

-- Employee_Projects Table (Many-to-Many)
CREATE TABLE Employee_Projects (
    EmpID INT,
    ProjectID INT,
    Role VARCHAR(50),
    HoursWorked INT,
    PRIMARY KEY (EmpID, ProjectID),
    FOREIGN KEY (EmpID) REFERENCES Employees(EmpID),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
);
-- Departments
INSERT INTO Departments (DeptName, Location, Budget) VALUES
('HR', 'Mumbai', 500000),
('IT', 'Pune', 1200000),
('Finance', 'Delhi', 900000),
('Marketing', 'Bangalore', 700000),
('R&D', 'Hyderabad', 1500000);

-- Employees
INSERT INTO Employees (FirstName, LastName, DeptID, Position, HireDate, Email, Phone) VALUES
('Amit', 'Sharma', 1, 'HR Manager', '2020-01-15', 'amit.sharma@company.com', '9876543210'),
('Priya', 'Patel', 2, 'Software Engineer', '2021-05-20', 'priya.patel@company.com', '9876543211'),
('Rahul', 'Verma', 2, 'Data Analyst', '2022-03-12', 'rahul.verma@company.com', '9876543212'),
('Sneha', 'Kumar', 3, 'Accountant', '2019-08-10', 'sneha.kumar@company.com', '9876543213'),
('Ravi', 'Joshi', 4, 'Marketing Executive', '2023-06-05', 'ravi.joshi@company.com', '9876543214'),
('Neha', 'Singh', 5, 'Research Scientist', '2021-09-17', 'neha.singh@company.com', '9876543215'),
('Karan', 'Mehta', 2, 'System Administrator', '2018-11-01', 'karan.mehta@company.com', '9876543216'),
('Anita', 'Desai', 3, 'Financial Analyst', '2020-12-20', 'anita.desai@company.com', '9876543217');

-- Salaries
INSERT INTO Salaries (EmpID, BasicSalary, Bonus, PayDate) VALUES
(1, 45000, 5000, '2024-01-31'),
(2, 60000, 8000, '2024-01-31'),
(3, 55000, 6000, '2024-01-31'),
(4, 50000, 4000, '2024-01-31'),
(5, 40000, 3000, '2024-01-31'),
(6, 75000, 12000, '2024-01-31'),
(7, 65000, 9000, '2024-01-31'),
(8, 52000, 5000, '2024-01-31');

-- Projects
INSERT INTO Projects (ProjectName, DeptID, StartDate, EndDate, Budget) VALUES
('Employee Onboarding System', 1, '2023-01-10', '2023-06-30', 150000),
('Website Redesign', 2, '2023-03-15', '2023-09-15', 300000),
('Financial Audit 2023', 3, '2023-04-01', '2023-05-31', 100000),
('Social Media Campaign', 4, '2023-02-01', '2023-07-01', 200000),
('AI Research Project', 5, '2023-05-10', '2024-05-10', 500000);

-- Employee_Projects
INSERT INTO Employee_Projects (EmpID, ProjectID, Role, HoursWorked) VALUES
(1, 1, 'Coordinator', 120),
(2, 2, 'Developer', 200),
(3, 2, 'Data Analyst', 150),
(4, 3, 'Auditor', 100),
(5, 4, 'Marketing Lead', 180),
(6, 5, 'Lead Scientist', 250),
(7, 2, 'SysAdmin', 160),
(8, 3, 'Assistant Auditor', 90);



