SELECT '2023-02-19'::DATE,
    '123'::INTEGER,
    'true'::BOOLEAN,
    '3.14'::REAL;
SELECT job_title_short AS title,
    job_location AS location,
    job_posted_date::DATE AS date
FROM job_postings_fact
LIMIT 5;
SELECT job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time,
    EXTRACT(
        MONTH
        FROM job_posted_date
    ) AS date_month,
    EXTRACT(
        YEAR
        FROM job_posted_date
    ) AS date_year
FROM job_postings_fact
LIMIT 5;
SELECT job_id,
    EXTRACT(
        MONTH
        FROM job_posted_date
    ) AS month
FROM job_postings_fact
LIMIT 5;
SELECT COUNT(job_id) AS job_posted_count,
    EXTRACT(
        MONTH
        FROM job_posted_date
    ) AS month
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY month
ORDER BY job_posted_count DESC;
/*practice problem 1
 Write a query to find the average salary both yearly (salary_year_avg) and hourly (salary_hour_avg) for job postings that were posted after June 1, 2023. Group the results by job schedule type.
 */
SELECT job_schedule_type,
    AVG(salary_year_avg) AS avg_yearly_salary,
    AVG(salary_hour_avg) AS avg_hourly_salary
FROM job_postings_fact
WHERE job_posted_date > '2023-06-01'
GROUP BY job_schedule_type;
/*practice problem 2
 Write a query to count the number of job postings for each month in 2023, adjusting the job_posted_date to be in 'America/New_York' time zone before extracting (hint) the month. Assume the job_posted_date is stored in UTC. Group by and order by the month.
 */
SELECT EXTRACT(
        MONTH
        FROM (
                job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York'
            )
    ) AS month,
    COUNT(*) AS job_postings_count
FROM job_postings_fact
WHERE EXTRACT(
        YEAR
        FROM job_posted_date
    ) = 2023
GROUP BY EXTRACT(
        MONTH
        FROM (
                job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York'
            )
    )
ORDER BY month;
/*practice problem 3
 Write a query to find companies (include company name) that have posted jobs offering health insurance, where these postings were made in the second quarter of 2023. Use date extraction to filter by quarter.
 */
SELECT DISTINCT company_id
FROM job_postings_fact
WHERE job_health_insurance = true
    AND EXTRACT(
        QUARTER
        FROM job_posted_date
    ) = 2
    AND EXTRACT(
        YEAR
        FROM job_posted_date
    ) = 2023;