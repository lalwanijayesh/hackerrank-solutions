SELECT
    (CASE WHEN grade >= 8 THEN name 
     ELSE NULL END) AS name,
    grade, marks
FROM
    students, grades
WHERE
    marks BETWEEN min_mark AND max_mark
ORDER BY
    grade DESC,
    (CASE WHEN grade >= 8 THEN name 
     ELSE marks END)