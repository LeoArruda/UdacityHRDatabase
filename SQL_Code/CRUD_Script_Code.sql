/* Question 1: Return a list of employees WITH Job Titles AND Department Names */
SELECT emp.emp_nm AS "Employee Name",
         job.job_title AS "Job Title",
         dep.dep_nm AS "Department"
FROM EmployeeHistory AS es
JOIN Employee AS emp
    ON es.emp_id = emp.emp_id
JOIN JobPosition AS job
    ON es.job_id = job.job_id
JOIN Department AS dep
    ON es.dep_id = dep.dep_id
ORDER BY dep.dep_nm, job.job_title; 

/* Question 2: INSERT Web Programmer AS a new job title */
INSERT INTO JobPosition (job_title) VALUES ('Web Programmer');

/* Question 3: Correct the job title FROM web programmer to web developer */ 
UPDATE JobPosition SET job_title = 'Web Developer'
WHERE job_title = 'Web Programmer';

/* Question 4: Delete the job title Web Developer from the database */
DELETE
FROM JobPosition
WHERE job_title = 'Web Developer';
    
    
/* Question 5: How many employees are in each department? */
SELECT dep.dep_nm as "Department",
       count(emp.emp_nm) as "# Employees"
FROM EmployeeHistory AS eh
JOIN Employee AS emp
    ON eh.emp_id = emp.emp_id
JOIN Department AS dep
    ON eh.dep_id = dep.dep_id
GROUP BY dep.dep_nm
ORDER BY 2 DESC;

/* Question 6: Write a query that returns current and past jobs (include 
   employee name, job title, department, manager name, start and end date 
   for position) for employee Toni Lembeck. */
SELECT emp.emp_nm as "Name",
       job.job_title as "Job Title",
       dep.dep_nm as "Department",
    (SELECT emp_nm
    FROM Employee
    WHERE emp_id = eh.manager_id) as "Manager Name",
       eh.start_dt as "Start Date", 
       eh.end_dt as "End Date"
FROM EmployeeHistory AS eh
JOIN Employee AS emp
    ON eh.emp_id = emp.emp_id
JOIN JobPosition AS job
    ON eh.job_id = job.job_id
JOIN Department AS dep
    ON eh.dep_id = dep.dep_id
WHERE emp.emp_nm = 'Toni Lembeck';