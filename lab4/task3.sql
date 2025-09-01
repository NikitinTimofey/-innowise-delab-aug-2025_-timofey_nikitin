CREATE ROLE hr_user WITH LOGIN PASSWORD 'hr_password';
GRANT SELECT ON Employees TO hr_user;
GRANT INSERT, UPDATE ON Employees TO hr_user;