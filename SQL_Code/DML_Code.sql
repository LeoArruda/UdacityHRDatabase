/* Following DML SQL code will help you to populate the physical database for managing the employee's data
ON a DBMS supporting PostgreSQL. */ 

/* Populating Education TABLE */
INSERT INTO Education(edu_level)
SELECT  DISTINCT education_lvl
FROM proj_stg; 

/* Populating Job TABLE */
INSERT INTO JobPosition(job_title)
SELECT  DISTINCT job_title
FROM proj_stg; 

/* Populating Department TABLE */
INSERT INTO Department(dep_nm)
SELECT  DISTINCT department_nm
FROM proj_stg; 

/* Populating Location TABLE */
INSERT INTO Location(loc_nm)
SELECT  DISTINCT location
FROM proj_stg;

/* Populating State TABLE */
INSERT INTO State(state_nm, loc_id)
SELECT  DISTINCT s.state,
        loc.loc_id
FROM proj_stg AS s
JOIN Location AS loc
ON s.location = loc.loc_nm;

/* Populating City TABLE */
INSERT INTO City(city_nm, state_id)
SELECT  DISTINCT s.city,
        st.state_id
FROM proj_stg AS s
JOIN State AS st
ON s.state = st.state_nm;

/* Populating Address TABLE */
INSERT INTO Address(addr_nm, city_id)
SELECT  DISTINCT s.address,
        ct.city_id
FROM proj_stg AS s
JOIN City AS ct
ON s.city = ct.city_nm;

/* Populating Salary TABLE */
INSERT INTO Salary(value)
SELECT  DISTINCT salary
FROM proj_stg; 

/* Populating Employee TABLE */
INSERT INTO Employee(emp_id, emp_nm, email, hire_dt, edu_id)
SELECT  DISTINCT s.emp_ID,
        s.Emp_NM,
        s.Email,
        s.hire_dt,
        ed.edu_id
FROM proj_stg AS s
JOIN Education AS ed
ON s.education_lvl = ed.edu_level;

 /* Populating EmployeeStatus TABLE */
INSERT INTO EmployeeHistory(emp_id, job_id, dep_id, manager_id, start_dt, end_dt, addr_id, salary_id)
SELECT  emp.emp_id,
        job.job_id,
        dep.dep_id,
        (
            SELECT  emp_id
            FROM Employee
            WHERE emp_nm = s.manager
        ), 
        s.start_dt,
        s.end_dt,
        addr.addr_id,
        sal.salary_id
FROM proj_stg AS s
JOIN Employee AS emp
ON s.Emp_ID = emp.emp_id
JOIN JobPosition AS job
ON s.job_title = job.job_title
JOIN Department AS dep
ON s.Department_nm = dep.dep_nm
JOIN Address AS addr
ON s.address = addr.addr_nm
JOIN Salary AS sal
ON s.salary = sal.value;
