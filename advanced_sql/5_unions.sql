SELECT *
FROM january_jobs;
SELECT *
FROM february_jobs;
SELECT *
FROM march_jobs;
--------------------------
-- Get jobs and companies from January
SELECT job_title_short,
    company_id,
    job_location
FROM january_jobs
UNION ALL
-- Get jobs and companies from February
SELECT job_title_short,
    company_id,
    job_location
FROM february_jobs
UNION ALL
-- combine another table
-- Get jobs and companies from March
SELECT job_title_short,
    company_id,
    job_location
FROM march_jobs -----------------------------------
    /*
     Practice Problem 1
     ⦁	Get the corresponding skill and skill type for each job posting in q1
     ⦁	Include those without any skills too
     ⦁	Why? Look at the skills and the type for each job in the first quarter that has a salary > $70000
     */
    -- Jobs με skills
SELECT job_postings_fact.job_id,
    job_postings_fact.job_title,
    job_postings_fact.salary_year_avg,
    skills_dim.skills,
    skills_dim.type
FROM job_postings_fact
    JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE EXTRACT(
        QUARTER
        FROM job_postings_fact.job_posted_date
    ) = 1
    AND job_postings_fact.salary_year_avg > 70000
UNION ALL
-- Jobs χωρίς skills
SELECT job_postings_fact.job_id,
    job_postings_fact.job_title,
    job_postings_fact.salary_year_avg,
    NULL AS skills,
    NULL AS type
FROM job_postings_fact
WHERE EXTRACT(
        QUARTER
        FROM job_postings_fact.job_posted_date
    ) = 1
    AND job_postings_fact.salary_year_avg > 70000
    AND job_postings_fact.job_id NOT IN (
        SELECT job_id
        FROM skills_job_dim
    );
SELECT *
from skills_dim