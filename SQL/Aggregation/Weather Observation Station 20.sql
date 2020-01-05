SET @rowNum := -1;
SELECT ROUND(AVG(lat_n), 4)
FROM (SELECT @rowNum := @rowNum + 1 AS num, lat_n
      FROM station
      ORDER BY lat_n) TEMP
WHERE num IN (FLOOR(@rowNum / 2), CEIL(@rowNum / 2));