SELECT
    c.company_code,
    c.founder,
    COUNT(DISTINCT lm.lead_manager_code),
    COUNT(DISTINCT sm.senior_manager_code),
    COUNT(DISTINCT m.manager_code),
    COUNT(DISTINCT e.employee_code)
FROM
    company c
    JOIN lead_manager lm USING(company_code)
    JOIN senior_manager sm USING(lead_manager_code)
    JOIN manager m USING(senior_manager_code)
    JOIN employee e USING(manager_code)
GROUP BY
    c.company_code, c.founder
ORDER BY
    c.company_code