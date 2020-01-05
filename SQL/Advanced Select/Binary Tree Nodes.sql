SELECT n,
    CASE WHEN p IS NULL THEN 'Root'
        WHEN EXISTS (SELECT n FROM bst WHERE p = b.n) THEN 'Inner'
        ELSE 'Leaf'
    END
FROM bst b
ORDER BY n