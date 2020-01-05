SELECT
    id, age, coins_needed, power
FROM
    wands w JOIN wands_property p
    USING (code)
WHERE
    is_evil = 0
    AND coins_needed = (SELECT MIN(coins_needed)
                        FROM wands JOIN wands_property USING (code)
                        WHERE power = w.power AND age = p.age)                        
ORDER BY
    power DESC, age DESC