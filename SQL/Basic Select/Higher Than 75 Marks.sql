# Solution 1
SELECT name
FROM students
WHERE
    marks > 75
ORDER BY
    SUBSTRING(name, -3), id;
# Solution 2
SELECT name
FROM students
WHERE
    marks > 75
ORDER BY
    RIGHT(name, 3), id;