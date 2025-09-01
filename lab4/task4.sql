UPDATE Employees 
SET Salary = Salary * 1.10 
WHERE Department = 'HR';

UPDATE Employees 
SET Department = 'Senior IT' 
WHERE Salary > 70000.00;

DELETE FROM Employees 
WHERE NOT EXISTS (
    SELECT 1 FROM EmployeeProjects 
    WHERE EmployeeProjects.EmployeeID = Employees.EmployeeID
);

BEGIN;

INSERT INTO Projects (ProjectName, Budget, StartDate, EndDate) 
VALUES ('Cloud Migration', 180000.00, '2024-01-15', '2024-12-31')

INSERT INTO EmployeeProjects (EmployeeID, ProjectID, HoursWorked) 
VALUES 
(2, 4, 120),
(4, 4, 90);
COMMIT;

SELECT * FROM Employees ORDER BY Department, Salary DESC;
SELECT * FROM Projects ORDER BY ProjectID;
SELECT * FROM EmployeeProjects ORDER BY ProjectID, EmployeeID;