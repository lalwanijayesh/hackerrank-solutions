SET @count := 21;
SELECT REPEAT('* ', @count := @count - 1)
FROM information_schema.tables
LIMIT 20;