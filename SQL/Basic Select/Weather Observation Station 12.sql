# Solution 1
SELECT DISTINCT city
FROM station
WHERE
    SUBSTRING(city, 1, 1) NOT IN ('a','e','i','o','u')
    AND SUBSTRING(city, -1) NOT IN ('a','e','i','o','u');
# Solution 2
SELECT DISTINCT city
FROM station
WHERE
    LEFT(city, 1) NOT IN ('a','e','i','o','u')
    AND RIGHT(city, 1) NOT IN ('a','e','i','o','u');
# Solution 3
SELECT DISTINCT city
FROM station
WHERE
    city REGEXP '^[^aeiou].*[^aeiou]$';