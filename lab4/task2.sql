-- Задание 2: DDL операции
-- 1. Создать новую таблицу Departments
CREATE TABLE Departments (
    DepartmentID SERIAL PRIMARY KEY,
    DepartmentName VARCHAR(50) UNIQUE NOT NULL,
    Location VARCHAR(50)
);

-- 2. Добавить столбец Email в таблицу Employees
ALTER TABLE Employees ADD COLUMN Email VARCHAR(100);

-- 3. Заполнить Email любыми значениями и добавить ограничение UNIQUE
-- Просто заполняем любыми email-адресами
UPDATE Employees SET Email = 'alice.smith@company.com' WHERE EmployeeID = 1;
UPDATE Employees SET Email = 'bob.johnson@company.com' WHERE EmployeeID = 2;
UPDATE Employees SET Email = 'charlie.brown@company.com' WHERE EmployeeID = 3;
UPDATE Employees SET Email = 'diana.prince@company.com' WHERE EmployeeID = 4;
UPDATE Employees SET Email = 'eve.davis@company.com' WHERE EmployeeID = 5;
UPDATE Employees SET Email = 'john.doe@company.com' WHERE EmployeeID = 6;
UPDATE Employees SET Email = 'sarah.wilson@company.com' WHERE EmployeeID = 7;

-- Добавляем ограничение UNIQUE
ALTER TABLE Employees ADD CONSTRAINT unique_email UNIQUE (Email);

-- 4. Переименовать столбец Location в OfficeLocation в таблице Departments
ALTER TABLE Departments RENAME COLUMN Location TO OfficeLocation;

-- Проверка изменений
SELECT * FROM Departments;
SELECT EmployeeID, FirstName, LastName, Email FROM Employees;