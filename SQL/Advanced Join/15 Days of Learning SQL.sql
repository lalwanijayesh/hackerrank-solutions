SELECT t1.submission_date, t1.unique_submissions, t2.hacker_id, t3.name
FROM (SELECT submission_date, COUNT(DISTINCT hacker_id) unique_submissions
      FROM submissions s
      WHERE (SELECT COUNT(DISTINCT submission_date) FROM submissions
             WHERE hacker_id = s.hacker_id AND submission_date < s.submission_date)
            = DATEDIFF(s.submission_date, '2016-03-01')
      GROUP BY submission_date) t1
JOIN (SELECT submission_date,
      (SELECT hacker_id FROM submissions
       WHERE submission_date = s.submission_date GROUP BY hacker_id
       ORDER BY COUNT(submission_id) DESC, hacker_id LIMIT 1) hacker_id
      FROM (SELECT DISTINCT submission_date FROM submissions) s) t2
ON t1.submission_date = t2.submission_date
JOIN hackers t3
ON t2.hacker_id = t3.hacker_id
ORDER BY submission_date