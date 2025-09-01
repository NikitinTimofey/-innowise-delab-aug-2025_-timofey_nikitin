CREATE OR REPLACE FUNCTION CalculateAnnualBonus(
    employee_id INTEGER,
    salary DECIMAL
)
RETURNS DECIMAL
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN salary * 0.10;
END;
$$;

SELECT 
    EmployeeID,
    FirstName,
    LastName,
    Salary,
    CalculateAnnualBonus(EmployeeID, Salary) AS AnnualBonus
FROM Employees
ORDER BY AnnualBonus DESC;

CREATE OR REPLACE VIEW IT_Department_View AS
SELECT 
    EmployeeID,
    FirstName,
    LastName,
    Salary
FROM Employees
WHERE Department = 'IT'
ORDER BY EmployeeID;

SELECT * FROM IT_Department_View;

SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'it_department_view'
ORDER BY ordinal_position;