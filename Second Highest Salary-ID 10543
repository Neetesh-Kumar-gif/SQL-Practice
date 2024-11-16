Identify the second-highest salary in each department.


Your output should include the department, the second highest salary, and the employee ID. Do not remove duplicate salaries when ordering salaries, and apply the rankings without a gap in the rank. For example, if multiple employees share the same highest salary, the second-highest salary will be the next salary that is lower than the highest salaries.

Table: employee_data
My solution is:

select department , salary as second_highest_salary , employee_id, rnk
from (
select department , salary , employee_id , 
row_number() over(partition by department order by salary desc)
as rnk from employee_data
) as ranked_salaries where rnk = 2;
