SELECT *
FROM (
        -- Subquery starts here
        SELECT *
        FROM job_postings_fact
        WHERE EXTRACT(
                MONTH
                FROM job_posted_date
            ) = 1
    ) AS january_jobs;
-- Subquery ends here
WITH january_jobs AS (
    -- CTE definition starts here
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(
            MONTH
            FROM job_posted_date
        ) = 1
) -- CTE definition ends here
Select *
FROM january_jobs;
SELECT company_id,
    name AS company_name
FROM company_dim
WHERE company_id IN (
        SELECT company_id
        FROM job_postings_fact
        WHERE job_no_degree_mention = true
        ORDER BY company_id
    ) ---------------------------------------
    /* 
     Find the companies that have the most job openings.
     - Get the total number of job postings per company id (job_postings_fact)
     - Return the total number of jobs with the company name (company_dim)
     */
    WITH company_job_count AS(
        SELECT company_id,
            COUNT(*) AS total_jobs
        FROM job_postings_fact
        GROUP BY company_id
    )
SELECT company_dim.name AS company_name,
    company_job_count.total_jobs
FROM company_dim
    LEFT JOIN company_job_count ON company_job_count.company_id = company_dim.company_id
ORDER BY total_jobs DESC -----------------------------------
    /*
     Practice Problem 1
     Identify the top 5 skills that are most frequently mentioned in job postings. Use a subquery to find the skill IDs with the highest counts in the skills_job_dim table and then join this result with the skills_dim table to get the skill names.
     */
SELECT skills_dim.skill_id,
    skills_dim.skills,
    subquery.skill_count
FROM (
        SELECT skill_id,
            COUNT(*) AS skill_count
        FROM skills_job_dim
        GROUP BY skill_id
        ORDER BY COUNT(*) DESC
        LIMIT 5
    ) AS subquery
    INNER JOIN skills_dim ON subquery.skill_id = skills_dim.skill_id
ORDER BY subquery.skill_count DESC;
/*
 Practice Problem 2
 Determine the size category ('Small', 'Medium', or 'Large') for each company by first identifying the number of job postings they have. Use a subquery to calculate the total job postings per company. A company is considered 'Small' if it has less than 10 job postings, 'Medium' if the number of job postings is between 10 and 50, and 'Large' if it has more than 50 job postings. Implement a subquery to aggregate job counts per company before classifying them based on size.
 */
SELECT company_dim.company_id,
    company_dim.name AS company_name,
    subquery.total_jobs,
    CASE
        WHEN subquery.total_jobs < 10 THEN 'Small'
        WHEN subquery.total_jobs BETWEEN 10 AND 50 THEN 'Medium'
        ELSE 'Large'
    END AS company_size
FROM company_dim
    JOIN (
        SELECT company_id,
            COUNT(*) AS total_jobs
        FROM job_postings_fact
        GROUP BY company_id
    ) AS subquery ON company_dim.company_id = subquery.company_id;