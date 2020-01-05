SELECT CASE
        WHEN a + b <= c
            OR b + c <= a
            OR c + a <= b
            THEN 'Not A Triangle'
        WHEN a = b
            AND b = c
            THEN 'Equilateral'
        WHEN a = b
            OR b = c
            OR c = a
            THEN 'Isosceles'
        ELSE 'Scalene'
       END
FROM triangles