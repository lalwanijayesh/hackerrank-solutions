# Solution 1
SELECT MAX(salary * months), COUNT(1)
FROM employee
WHERE
    salary * months = (SELECT MAX(salary * months) FROM employee);
# Solution 2
SELECT
    (salary * months) earnings,
    count(1)
FROM
    employee
GROUP BY
    earnings
ORDER BY
    earnings DESC
LIMIT 1;