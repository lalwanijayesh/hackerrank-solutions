SELECT
    contest_id, hacker_id, name,
    IFNULL(SUM(total_submissions), 0) t_submissions,
    IFNULL(SUM(total_accepted_submissions), 0) t_accepted_submissions,
    IFNULL(SUM(total_views), 0) t_views,
    IFNULL(SUM(total_unique_views), 0) t_unique_views
FROM
    contests
    JOIN colleges USING (contest_id)
    JOIN challenges USING (college_id)
    LEFT JOIN (SELECT challenge_id,
               sum(total_views) total_views,
               sum(total_unique_views) total_unique_views
               FROM view_stats GROUP BY challenge_id) vs
               USING (challenge_id)
    LEFT JOIN (SELECT challenge_id,
               sum(total_submissions) total_submissions,
               sum(total_accepted_submissions) total_accepted_submissions
               FROM submission_stats GROUP BY challenge_id) ss
               USING (challenge_id)
GROUP BY
    contest_id, hacker_id, name
HAVING
    t_submissions + t_accepted_submissions + t_views + t_unique_views > 0
ORDER BY
    contest_id