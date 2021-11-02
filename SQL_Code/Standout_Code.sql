
/* Standout Suggestion 2
    Create a view that returns all employee attributes; 
    results should resemble initial Excel file 
*/
CREATE VIEW v_employee AS
SELECT emp.emp_id AS "emp_id",
         emp.emp_nm AS "emp_nm",
         emp.email AS "email",
         emp.hire_dt AS "hire_dt",
         job.job_title AS "job_title",
         sal.value AS "salary",
         dep.dep_nm AS "department",
         (SELECT emp_nm
            FROM Employee
            WHERE emp_id = eh.manager_id) AS "manager",
         eh.start_dt AS "start_dt", 
         eh.end_dt AS "end_dt", 
         loc.loc_nm AS "location",
         addr.addr_nm AS "address",
         ci.city_nm AS "city",
         st.state_nm AS "state",
         edu.edu_level AS "education_level"
FROM EmployeeHistory AS eh
JOIN Employee AS emp
    ON eh.emp_id = emp.emp_id
JOIN Education AS edu
    ON emp.edu_id = edu.edu_id
JOIN JobPosition AS job
    ON eh.job_id = job.job_id
JOIN Department AS dep
    ON eh.dep_id = dep.dep_id
JOIN Salary AS sal
    ON eh.salary_id = sal.salary_id
JOIN Address AS addr
    ON eh.addr_id = addr.addr_id
JOIN City AS ci
    ON addr.city_id = ci.city_id
JOIN State AS st
    ON st.state_id = ci.state_id
JOIN Location AS loc
    ON st.loc_id = loc.loc_id ;


/* Standout Suggestion 2
    Create a stored procedure with parameters that returns current and past jobs 
    (include employee name, job title, department, manager name, start and end date for position) 
    when given an employee name. for employee Toni Lembeck.
*/

create or replace function GetAllJobs
(in _empName character varying)
RETURNS TABLE ( 
     Employee character varying, 
     Job_Title character varying,
     Department character varying,
     Manager character varying,
     StartDate date,
     EndDate date
)
as $$
    SELECT emp.emp_nm as Employee,
       job.job_title as Job_Title,
       dep.dep_nm as Department,
        (SELECT emp_nm
        FROM Employee
        WHERE emp_id = eh.manager_id) as Manager,
       eh.start_dt as StartDate, 
       eh.end_dt as EndDate
    FROM EmployeeHistory AS eh
    JOIN Employee AS emp
        ON eh.emp_id = emp.emp_id
    JOIN JobPosition AS job
        ON eh.job_id = job.job_id
    JOIN Department AS dep
        ON eh.dep_id = dep.dep_id
    WHERE emp.emp_nm = _empName;
    
$$
LANGUAGE SQL;


/* Standout Suggestion 3
    Implement user security on the restricted salary attribute.
    Create a non-management user named NoMgr. 
*/
CREATE ROLE noManager;
GRANT CONNECT ON DATABASE postgres TO noManager;
GRANT SELECT ON ALL TABLES IN SCHEMA Public to noManager;
REVOKE SELECT ON TABLE salary FROM noManager;
CREATE USER NoMgr WITH PASSWORD 'secret123';
GRANT noManager TO NoMgr;