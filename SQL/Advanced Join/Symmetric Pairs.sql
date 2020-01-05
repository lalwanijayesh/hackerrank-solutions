# Solution 1
SELECT f1.x, f1.y FROM functions f1
WHERE x <> y AND EXISTS (SELECT * FROM functions
                         WHERE x = f1.y AND y = f1.x AND x > f1.x)
UNION
SELECT f2.x, f2.y FROM functions f2
WHERE x = y AND (SELECT COUNT(1) FROM functions
                 WHERE x = f2.x AND y = f2.y) > 1
ORDER BY x;
# Solution 2
SELECT f1.x, f1.y
FROM
    functions f1 JOIN functions f2
        ON f1.x = f2.y AND f1.y = f2.x
GROUP BY
    f1.x, f1.y
HAVING
    COUNT(f1.x) > 1 OR f1.x < f1.y
ORDER BY
    f1.x;