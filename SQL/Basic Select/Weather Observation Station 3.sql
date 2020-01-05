# Solution 1
SELECT DISTINCT city
FROM station
WHERE MOD(id, 2) = 0;
# Solution 2
SELECT DISTINCT city
FROM station
WHERE id % 2 = 0;