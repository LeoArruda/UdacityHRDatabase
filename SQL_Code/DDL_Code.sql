/* Following DDL SQL code will help you to create a physical database 
   for managing the employee's data on a DBMS supporting PostgreSQL. */
   

/* Creating Education table - primary key -> edu_id */
CREATE TABLE IF NOT EXISTS Education(
    edu_id SERIAL,
    edu_level varchar(50),
    CONSTRAINT pk_education_edu_id PRIMARY KEY (edu_id)
);

/* Creating Employee table - primary key -> emp_id */
CREATE TABLE IF NOT EXISTS Employee(
    emp_id varchar(10),
    emp_nm varchar(50),
    email varchar(50),
    hire_dt date,
    edu_id int,
    CONSTRAINT pk_employee_emp_id PRIMARY KEY (emp_id),
    CONSTRAINT fk_employee_edu_id_education FOREIGN KEY (edu_id) REFERENCES Education(edu_id)
);


/* Creating Location table - primary key -> loc_id */
CREATE TABLE IF NOT EXISTS Location(
    loc_id SERIAL,
    loc_nm varchar(50),
    CONSTRAINT pk_location_loc_id PRIMARY KEY (loc_id)
);

/* Creating State table - primary key -> state_id */
CREATE TABLE IF NOT EXISTS State(
    state_id SERIAL,
    state_nm varchar(50),
    loc_id INT,
    CONSTRAINT pk_state_state_id PRIMARY KEY (state_id),
    CONSTRAINT fk_state_loc_id_location FOREIGN KEY (loc_id) REFERENCES Location(loc_id)
);

/* Creating City table - primary key -> city_id */
CREATE TABLE IF NOT EXISTS City(
    city_id SERIAL,
    city_nm varchar(50),
    state_id INT,
    CONSTRAINT pk_city_city_id PRIMARY KEY (city_id),
    CONSTRAINT fk_city_state_id_state FOREIGN KEY (state_id) REFERENCES State(state_id)
);

/* Creating Address table - primary key -> addr_id */
CREATE TABLE IF NOT EXISTS Address(
    addr_id SERIAL,
    addr_nm  varchar(100),
    city_id INT,
    CONSTRAINT pk_address_addr_id PRIMARY KEY (addr_id),
    CONSTRAINT fk_address_city_id_state FOREIGN KEY (city_id) REFERENCES City(city_id)
);

/* Creating JobPosition table - primary key -> job_id */
CREATE TABLE IF NOT EXISTS JobPosition(
    job_id SERIAL,
    job_title varchar(50),
    CONSTRAINT pk_jobposition_job_id PRIMARY KEY (job_id)
);

/* Creating Department table - primary key -> dep_id */
CREATE TABLE IF NOT EXISTS Department(
    dep_id SERIAL,
    dep_nm varchar(50),
    CONSTRAINT pk_department_dep_id PRIMARY KEY (dep_id)
);

/* Creating Salary table - primary key -> salary_id */
CREATE TABLE IF NOT EXISTS Salary(
    salary_id SERIAL,
    value INT,
    CONSTRAINT pk_salary_salary_id PRIMARY KEY (salary_id)
);

/* Creating EmployeeHistory table - primary key -> emp_id + job_id */
CREATE TABLE IF NOT EXISTS EmployeeHistory(
    emp_id varchar(10),
    job_id INT,
    dep_id INT,
    manager_id varchar(10),
    addr_id INT,
    salary_id INT,
    start_dt date,
    end_dt date,
    CONSTRAINT pk_employeehistory_emp_id_job_id PRIMARY KEY (emp_id, job_id),
    CONSTRAINT fk_employeehistory_emp_id_employee FOREIGN KEY (emp_id) REFERENCES Employee(emp_id),
    CONSTRAINT fk_employeehistory_job_id_jobposition FOREIGN KEY (job_id) REFERENCES JobPosition(job_id),
    CONSTRAINT fk_employeehistory_dep_id_department FOREIGN KEY (dep_id) REFERENCES Department(dep_id),
    CONSTRAINT fk_employeehistory_addr_id_address FOREIGN KEY (addr_id) REFERENCES Address(addr_id),
    CONSTRAINT fk_employeehistory_salary_id_salary FOREIGN KEY (salary_id) REFERENCES Salary(salary_id),
    CONSTRAINT fk_employeehistory_manager_id_employee FOREIGN KEY (manager_id) REFERENCES Employee(emp_id)
);
