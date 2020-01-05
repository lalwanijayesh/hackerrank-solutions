SELECT
    hacker_id, name, SUM(max_score) total
FROM
    hackers JOIN (SELECT hacker_id, MAX(score) max_score
                  FROM submissions
                  GROUP BY hacker_id, challenge_id) challenges
    USING (hacker_id)
GROUP BY
    hacker_id, name
HAVING total <> 0
ORDER BY
    total DESC, hacker_id