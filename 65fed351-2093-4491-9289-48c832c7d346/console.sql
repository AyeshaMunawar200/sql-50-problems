create database sql_practice;
use sql_practice;
#
# CREATE TABLE customer_orders (
#     order_id INTEGER PRIMARY KEY,
#     customer_id INTEGER,
#     order_date DATE,
#     order_amount INTEGER
# );
#
# -- Inserting sample data
# INSERT INTO customer_orders (order_id, customer_id, order_date, order_amount) VALUES
#     (1, 100, '2022-01-01', 2000),
#     (2, 200, '2022-01-01', 2500),
#     (3, 300, '2022-01-01', 2100),
#     (4, 100, '2022-01-02', 2000),
#     (5, 400, '2022-01-02', 2200),
#     (6, 500, '2022-01-02', 2700),
#     (7, 100, '2022-01-03', 3000),
#     (8, 400, '2022-01-03', 1000),
#     (9, 600, '2022-01-03', 3000);

-- Select statement should have a semicolon before inserting data
# SELECT * FROM customer_orders;
-- date / new customers / old customers
-- 2022-01-01 3 0
-- 2022-01-02 2 1
-- 2022-01-01 1 2
# Select co.order_date,
#        COUNT(case when co.order_date <= cifod.first_order_date then 1 END) as new_customer_count,
#        COUNT(case when co.order_date > cifod.first_order_date then 1 END) as old_customer_count from customer_orders co
#            JOIN (Select customer_id, min(order_date) as first_order_date from customer_orders group by customer_id) as cifod
# on co.customer_id = cifod.customer_id group by order_date order by co.order_date;

# **********************************************************************************
# Task:1
# difference between having and where clause
-- Create employees table
CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,      -- Unique Employee ID
    first_name VARCHAR(50),                 -- First Name
    last_name VARCHAR(50),                  -- Last Name
    age SMALLINT,                            -- Age
    salary DECIMAL(10,2),                   -- Salary with two decimal places
    department VARCHAR(100),                -- Department Name
    is_manager TINYINT(1),                   -- Boolean (1 for Yes, 0 for No)
    hire_date DATE,                          -- Hire Date
    shift_start TIME,                        -- Shift Start Time
    last_promotion DATETIME,                 -- Last Promotion Date and Time
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Auto-updating timestamp
    preferences JSON,                        -- JSON Data
    employee_code CHAR(10) UNIQUE,           -- Fixed-length employee code
    uuid_value CHAR(36)                      -- Unique Identifier (UUID must be inserted manually)
);


-- Insert sample data
INSERT INTO employees (first_name, last_name, age, salary, department, is_manager, hire_date, shift_start, last_promotion, preferences, employee_code)
VALUES
('Alice', 'Johnson', 30, 70000.50, 'Engineering', 1, '2020-05-15', '09:00:00', '2023-07-10 10:15:30', '{"work_mode": "remote"}', 'EMP001'),
('Bob', 'Smith', 45, 85000.00, 'Finance', 1, '2015-08-20', '08:30:00', '2022-06-05 14:00:00', '{"work_mode": "hybrid"}', 'EMP002'),
('Charlie', 'Brown', 28, 60000.75, 'Marketing', 0, '2021-09-10', '10:00:00', '2023-03-12 09:45:00', '{"work_mode": "onsite"}', 'EMP003'),
('Alice', 'Johnson', 30, 70000.50, 'Engineering', 1, '2020-05-15', '09:00:00', '2023-07-10 10:15:30', '{"work_mode": "remote"}', 'EMP004'),
('Emma', 'Davis', 32, 75000.25, 'HR', 0, '2018-02-05', '09:30:00', '2021-11-22 16:20:00', '{"work_mode": "onsite"}', 'EMP005'),
('David', 'Miller', 50, 95000.00, 'Engineering', 1, '2010-07-30', '08:00:00', '2019-12-10 11:00:00', '{"work_mode": "hybrid"}', 'EMP006');

-- View the data
SELECT * FROM employees;

# usage of where
# SELECT * from employees where salary > 80000;
# usage of having filter on aggregated values
# select department, avg(salary) from employees group by department having avg(salary) > 80000;


# both having and where clause applied
# select e.department, avg(e.salary) from (
# select * from employees where salary > 70000) as e
# group by e.department having  avg(e.salary) > 70000;


# select department, avg(salary) from employees
# where salary > 70000 group by department having avg(salary) > 50000


# **********************************************************************************
# Task 2: Convert rows into column and column into rows
