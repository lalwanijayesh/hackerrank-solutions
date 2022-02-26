# Solution 1
SET @project = 0;
SET @last_date = NULL;
SELECT MIN(start_date), MAX(end_date)
FROM (SELECT
          start_date, end_date,
          (CASE WHEN start_date = @last_date THEN @project
                ELSE @project := @project + 1 END) AS project,
          @last_date := end_date
          FROM (SELECT start_date, end_date
                FROM projects ORDER BY start_date) sorted) temp
GROUP BY project
ORDER BY COUNT(1), MIN(start_date);
# Solution 2
SELECT start_date, MIN(end_date)
FROM (SELECT start_date FROM projects
      WHERE start_date NOT IN (SELECT end_date FROM projects)) a
      INNER JOIN
     (SELECT end_date FROM projects
      WHERE end_date NOT IN (SELECT start_date FROM projects)) b
WHERE start_date < end_date
GROUP BY start_date
ORDER BY MIN(end_date) - start_date, start_date;

/* 
I propose the following solution as an alternative.
Basically I assigned an index to each row and use that to join the two tables.
The rest is similar.
*/
SELECT
    s.start_date,
    e.end_date
FROM
    (
    SELECT start_date, ROW_NUMBER() OVER (ORDER BY start_date) AS rn
    FROM projects
    WHERE start_date NOT IN (SELECT end_date FROM projects
    ORDER BY start_date 
    )) AS s
JOIN    
    (
    SELECT end_date, ROW_NUMBER() OVER (ORDER BY end_date) AS rn
    FROM projects
    WHERE end_date NOT IN (SELECT start_date FROM projects
    ORDER BY end_date
    )) AS e
ON s.rn = e.rn    
ORDER BY DATEDIFF(s.start_date, e.end_date) DESC, s.start_date
; 
