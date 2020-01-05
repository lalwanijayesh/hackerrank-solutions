SET @count := 0;
SELECT REPEAT('* ', @count := @count + 1)
FROM information_schema.tables
LIMIT 20;