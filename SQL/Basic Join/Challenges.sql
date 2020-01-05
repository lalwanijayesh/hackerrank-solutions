SELECT
    hacker_id, name, COUNT(challenge_id) challenge_count
FROM
    hackers JOIN challenges USING (hacker_id)
GROUP BY
    hacker_id, name
HAVING
    challenge_count = (SELECT COUNT(challenge_id) total FROM challenges
                       GROUP BY hacker_id ORDER BY total DESC LIMIT 1)
    OR challenge_count IN (SELECT total
                           FROM (SELECT COUNT(challenge_id) total FROM challenges
                                 GROUP BY hacker_id) temp
                           GROUP BY total
                           HAVING COUNT(total) = 1)                           
ORDER BY
    challenge_count DESC, hacker_id