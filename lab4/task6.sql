SELECT DISTINCT p.ProjectName
FROM Projects p
JOIN EmployeeProjects ep ON p.ProjectID = ep.ProjectID
JOIN Employees e ON ep.EmployeeID = e.EmployeeID
WHERE e.FirstName = 'Bob' 
  AND e.LastName = 'Johnson' 
  AND ep.HoursWorked > 150;

UPDATE Projects p
SET Budget = Budget * 1.10
WHERE EXISTS (
    SELECT 1 
    FROM EmployeeProjects ep
    JOIN Employees e ON ep.EmployeeID = e.EmployeeID
    WHERE ep.ProjectID = p.ProjectID 
      AND e.Department = 'IT'
);

SELECT p.ProjectID, p.ProjectName, p.Budget, e.Department
FROM Projects p
JOIN EmployeeProjects ep ON p.ProjectID = ep.ProjectID
JOIN Employees e ON ep.EmployeeID = e.EmployeeID
WHERE e.Department = 'IT'
ORDER BY p.ProjectID;

UPDATE Projects
SET EndDate = StartDate + INTERVAL '1 year'
WHERE EndDate IS NULL;

SELECT ProjectID, ProjectName, StartDate, EndDate
FROM Projects
WHERE EndDate IS NOT NULL
ORDER BY ProjectID;

BEGIN;

INSERT INTO Employees (FirstName, LastName, Department, Salary, Email)
VALUES ('Michael', 'Scott', 'Management', 90000.00, 'michael.scott@company.com')
RETURNING EmployeeID;

INSERT INTO EmployeeProjects (EmployeeID, ProjectID, HoursWorked)
SELECT 
    (SELECT MAX(EmployeeID) FROM Employees),
    p.ProjectID,
    80
FROM Projects p
WHERE p.ProjectName = 'Website Redesign';

COMMIT;

SELECT 
    e.EmployeeID,
    e.FirstName,
    e.LastName,
    e.Department,
    p.ProjectName,
    ep.HoursWorked
FROM Employees e
JOIN EmployeeProjects ep ON e.EmployeeID = ep.EmployeeID
JOIN Projects p ON ep.ProjectID = p.ProjectID
WHERE e.FirstName = 'Michael' AND e.LastName = 'Scott';