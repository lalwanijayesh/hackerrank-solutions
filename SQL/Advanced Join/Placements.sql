SELECT name
FROM
    students s
    JOIN friends f ON s.id = f.id
    JOIN packages p1 ON s.id = p1.id
    JOIN packages p2 ON f.friend_id = p2.id
WHERE
    p2.salary > p1.salary
ORDER BY
    p2.salary