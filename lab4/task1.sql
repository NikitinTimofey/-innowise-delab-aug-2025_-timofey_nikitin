-- Задание 1: DML операции
-- 1. Вставить двух новых сотрудников в таблицу Employees
INSERT INTO Employees (FirstName, LastName, Department, Salary) 
VALUES 
('John', 'Doe', 'IT', 72000.00),
('Sarah', 'Wilson', 'Finance', 68000.00);

-- 2. Выбрать всех сотрудников из таблицы Employees
SELECT * FROM Employees;

-- 3. Выбрать только FirstName и LastName сотрудников из отдела 'IT'
SELECT FirstName, LastName 
FROM Employees 
WHERE Department = 'IT';

-- 4. Обновить Salary 'Alice Smith' до 65000.00
UPDATE Employees 
SET Salary = 65000.00 
WHERE FirstName = 'Alice' AND LastName = 'Smith';

-- 5. Удалить сотрудника, чья LastName — 'Prince'
DELETE FROM EmployeeProjects 
WHERE EmployeeID IN (SELECT EmployeeID FROM Employees WHERE LastName = 'Prince');

DELETE FROM Employees 
WHERE LastName = 'Prince';

-- 6. Проверить все изменения
SELECT * FROM Employees;