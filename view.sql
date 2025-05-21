SELECT * from employee1

SELECT d_name, round(avg(salary)) FROM employee1 GROUP BY d_name

CREATE View dept_avg_salary
AS
SELECT d_name, round(avg(salary)) as salary FROM employee1 GROUP BY d_name

SELECT * FROM dept_avg_salary ORDER BY salary ASC




















DROP VIEW dept_avg_salary