Problem : https://www.hackerrank.com/challenges/the-blunder/problem?isFullScreen=true

**SOLUTION**

SELECT CEIL(AVG(Salary) - AVG(REPLACE(Salary, '0', '')))
FROM EMPLOYEES;
