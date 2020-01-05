SELECT h.hacker_id, h.name
FROM hackers h
    JOIN submissions s USING(hacker_id)
    JOIN challenges c USING(challenge_id)
    JOIN difficulty d USING(difficulty_level)
WHERE
    s.score = d.score
GROUP BY
    h.hacker_id, h.name
HAVING
    COUNT(h.hacker_id) > 1
ORDER BY
    COUNT(h.hacker_id) DESC,
    h.hacker_id