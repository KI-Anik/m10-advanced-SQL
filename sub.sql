
CREATE Table employee1(
    e_id SERIAL PRIMARY KEY,
    e_name varchar(20) NOT NULL,
    d_name VARCHAR(20),
    salary DECIMAL(10,2),
    hire_date DATE
)

INSERT INTO employee1 (e_name, d_name, salary, hire_date) VALUES 
  ('John Doe', 'HR', 60000.00, '2022-01-10'),
    ('Jane Smith', 'Marketing', 75000.50, '2021-05-22'),
    ('Bob Johnson', 'Finance', 80000.75, '2020-11-15'),
    ('Alice Williams', 'IT', 90000.25, '2019-08-03'),
    ('David Lee', 'Sales', 65000.50, '2020-03-18'),
    ('Sara Brown', 'Engineering', 70000.00, '2021-09-28'),
    ('Mike Miller', 'Customer Support', 55000.75, '2022-02-05'),
    ('Emily Davis', 'Administration', 95000.00, '2018-12-12'),
    ('Chris Wilson', 'Research', 72000.50, '2020-06-30'),
    ('Amy White', 'Quality Assurance', 68000.25, '2021-11-09'),
    ('John Johnson', 'HR', 62000.00, '2022-01-15'),
    ('Jessica Thompson', 'Marketing', 78000.50, '2021-06-05'),
    ('Michael Harris', 'Finance', 85000.75, '2020-11-25'),
    ('Emma Martinez', 'IT', 92000.25, '2019-09-15'),
    ('James Taylor', 'Sales', 67000.50, '2020-04-08'),
    ('Sophia Anderson', 'Engineering', 72000.00, '2021-10-10'),
    ('William Jackson', 'Customer Support', 56000.75, '2022-02-10'),
    ('Olivia Nelson', 'Administration', 97000.00, '2018-12-20'),
    ('Daniel White', 'Research', 73000.50, '2020-07-05'),
    ('Ava Wilson', 'Quality Assurance', 69000.25, '2021-11-15'),
    ('Matthew Brown', 'HR', 63000.00, '2022-01-20'),
    ('Emily Garcia', 'Marketing', 76000.50, '2021-06-15'),
    ('Christopher Allen', 'Finance', 86000.75, '2020-12-05'),
    ('Madison Hall', 'IT', 93000.25, '2019-09-25'),
    ('Andrew Cook', 'Sales', 68000.50, '2020-04-18'),
    ('Abigail Torres', 'Engineering', 73000.00, '2021-10-20'),
    ('Ethan Murphy', 'Customer Support', 57000.75, '2022-02-15'),
    ('Ella King', 'Administration', 98000.00, '2018-12-28'),
    ('Nathan Rivera', 'Research', 74000.50, '2020-07-15'),
    ('Mia Roberts', 'Quality Assurance', 70000.25, '2021-11-20');

    SELECT * FROM employee1

    SELECT max(salary) FROM employee1 WHERE d_name = 'HR'

---- sub query
    SELECT * FROM employee1 WHERE salary > ( SELECT max(salary) FROM employee1 WHERE d_name = 'HR' )

    SELECT sum(salary) FROM employee1 

    SELECT * , (SELECT sum(salary) FROM employee1 ) FROM employee1

    SELECT d_name, sum(salary)
     FROM employee1
      GROUP BY d_name

SELECT * FROM -- main / outer query
(
  SELECT d_name, sum(salary) as sum_dept_salary
     FROM employee1
      GROUP BY d_name
) 

SELECT e_name, salary, d_name FROM employee1
 WHERE d_name LIKE '%R%'

 --- same result but alternative way by using SubQuery
 SELECT e_name, salary, d_name FROM employee1
 WHERE d_name IN
  (SELECT d_name, FROM employee1 WHERE d_name LIKE '%R%')