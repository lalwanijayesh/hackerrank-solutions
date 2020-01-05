SELECT CONCAT(name, '(', LEFT(occupation, 1), ')')
FROM occupations
ORDER BY name;
SELECT CONCAT('There are a total of ', COUNT(name), ' ', LCASE(occupation), 's.') total
FROM occupations
GROUP BY occupation
ORDER BY total, occupation;