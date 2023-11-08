drop table departments cascade;
drop table projects cascade;
drop table empolyees cascade;
drop table hour_assignments cascade;

create table departments (
    dept_id integer primary key,
    dept_name text not null
);

create table projects(
    proj_id integer primary key,
    proj_name text not null,
    proj_location text default 'Online'
);

create table employees(
    emp_id integer primary key,
    first_name text NOT NULL,
    last_name text NOT NULL,
    dob date,
    department_id integer NOT NULL,
    FOREIGN KEY (department_id) REFERENCES DEPARTMENTS(dept_id)
);

CREATE TABLE hour_assignments(
    hour_assignment_id serial PRIMARY KEY,
    project_id integer NOT NULL,
    employee_id integer NOT NULL,
    hours decimal (6,2) NOT NULL CHECK (hours > 0),
    FOREIGN KEY(project_id) REFERENCES PROJECTS(proj_id) ON DELETE CASCADE,
    FOREIGN KEY(employee_id) REFERENCES EMPLOYEES(emp_id) ON DELETE CASCADE
);

-- Alter created table
ALTER TABLE table_name 
ADD COLUMN column_name datatype column_constraint;

-- Drop column on table
ALTER TABLE table_name 
DROP COLUMN column_name;

-- Rename column
ALTER TABLE table_name 
RENAME COLUMN column_name 
TO new_column_name;

-- Insert in column 
INSERT INTO table_name(attr1, attr2, etc.) VALUES (attr1_value, attr2_value, etc.);

-- Alternate insert (without table & attributes mentioned)
-- INSERT INTO DEPARTMENTS VALUES (11, 'Marketing');

-- Select attribute with parameter (Name)
SELECT *
FROM PROJECTS
WHERE proj_location = 'Melbourne';

-- Select attribute with parameter (DOB)
SELECT first_name, last_name, position, dob
FROM EMPLOYEES 
WHERE dob > '01/01/1995';

-- Select attributes starting with or not with parameter
dept_name LIKE ‘I%’ -> Must start with an I, but can then be anything.
dept_name LIKE ‘S_____’ -> Must be 5 characters starting with an S.
dept_name LIKE ‘%s’ -> Any sequence of characters ending with an s.
dept_name NOT LIKE ‘A%’ -> This means the 1st character cannot be an A.

-- Order attributes by certain order when called
SELECT proj_name, proj_location FROM PROJECTS WHERE proj_location = 'Melbourne' ORDER BY proj_name;

-- Order attributes by descending order when called
SELECT * 
FROM DEPARTMENTS 
ORDER BY dept_id DESC;

-- Delete
DELETE FROM table_name WHERE condition(s)

-- Update
UPDATE table_name 
SET attr_to_update = updated_value
WHERE condition(s)