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