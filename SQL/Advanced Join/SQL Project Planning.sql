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