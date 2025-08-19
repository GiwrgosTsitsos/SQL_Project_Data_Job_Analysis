/*
 Answer: What are the top skills based on salary?
 - Look at the average salary associated with each skill for Data Analyst positions
 - Focuses on roles with specified salaries, regardless of location
 - Why? It reveals how different skills impact salary levels for Data Analysts and
 helps identify the most financially rewarding skills to acquire or improve
 */
SELECT skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 25
    /*
     Here's a breakdown of the results for top paying skills for Data Analysts:
     - High Demand for Big Data & ML Skills: Top salaries are commanded by analysts skilled in big data technologies (PySpark, Couchbase), machine learning tools (DataRobot, Jupyter), and Python libraries (Pandas, NumPy), reflecting the industry's high valuation of data processing and predictive modeling capabilities.
     - Software Development & Deployment Proficiency: Knowledge in development and deployment tools (GitLab, Kubernetes, Airflow) indicates a lucrative crossover between data analysis and engineering, with a premium on skills that facilitate automation and efficient data pipeline management.
     - Cloud Computing Expertise: Familiarity with cloud and data engineering tools (Elasticsearch, Databricks, GCP) underscores the growing importance of cloud-based analytics environments, suggesting that cloud proficiency significantly boosts earning potential in data analytics.
     
     [
     {
     "skills": "pyspark",
     "avg_salary": "208172"
     },
     {
     "skills": "bitbucket",
     "avg_salary": "189155"
     },
     {
     "skills": "couchbase",
     "avg_salary": "160515"
     },
     {
     "skills": "watson",
     "avg_salary": "160515"
     },
     {
     "skills": "datarobot",
     "avg_salary": "155486"
     },
     {
     "skills": "gitlab",
     "avg_salary": "154500"
     },
     {
     "skills": "swift",
     "avg_salary": "153750"
     },
     {
     "skills": "jupyter",
     "avg_salary": "152777"
     },
     {
     "skills": "pandas",
     "avg_salary": "151821"
     },
     {
     "skills": "elasticsearch",
     "avg_salary": "145000"
     },
     {
     "skills": "golang",
     "avg_salary": "145000"
     },
     {
     "skills": "numpy",
     "avg_salary": "143513"
     },
     {
     "skills": "databricks",
     "avg_salary": "141907"
     },
     {
     "skills": "linux",
     "avg_salary": "136508"
     },
     {
     "skills": "kubernetes",
     "avg_salary": "132500"
     },
     {
     "skills": "atlassian",
     "avg_salary": "131162"
     },
     {
     "skills": "twilio",
     "avg_salary": "127000"
     },
     {
     "skills": "airflow",
     "avg_salary": "126103"
     },
     {
     "skills": "scikit-learn",
     "avg_salary": "125781"
     },
     {
     "skills": "jenkins",
     "avg_salary": "125436"
     },
     {
     "skills": "notion",
     "avg_salary": "125000"
     },
     {
     "skills": "scala",
     "avg_salary": "124903"
     },
     {
     "skills": "postgresql",
     "avg_salary": "123879"
     },
     {
     "skills": "gcp",
     "avg_salary": "122500"
     },
     {
     "skills": "microstrategy",
     "avg_salary": "121619"
     }
     ]
     */
    -- Repeat same process for 'Athens, Greece' below.
SELECT skills,
    job_location,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_location = 'Athens, Greece'
GROUP BY skills,
    job_location
ORDER BY avg_salary DESC
LIMIT 25
    /*
     [
     {
     "skills": "express",
     "job_location": "Athens, Greece",
     "avg_salary": "163782"
     },
     {
     "skills": "azure",
     "job_location": "Athens, Greece",
     "avg_salary": "163782"
     },
     {
     "skills": "aws",
     "job_location": "Athens, Greece",
     "avg_salary": "163782"
     },
     {
     "skills": "r",
     "job_location": "Athens, Greece",
     "avg_salary": "132141"
     },
     {
     "skills": "confluence",
     "job_location": "Athens, Greece",
     "avg_salary": "111175"
     },
     {
     "skills": "jira",
     "job_location": "Athens, Greece",
     "avg_salary": "111175"
     },
     {
     "skills": "flow",
     "job_location": "Athens, Greece",
     "avg_salary": "106571"
     },
     {
     "skills": "excel",
     "job_location": "Athens, Greece",
     "avg_salary": "100500"
     },
     {
     "skills": "sas",
     "job_location": "Athens, Greece",
     "avg_salary": "98500"
     },
     {
     "skills": "python",
     "job_location": "Athens, Greece",
     "avg_salary": "96756"
     },
     {
     "skills": "power bi",
     "job_location": "Athens, Greece",
     "avg_salary": "90633"
     },
     {
     "skills": "spark",
     "job_location": "Athens, Greece",
     "avg_salary": "89100"
     },
     {
     "skills": "databricks",
     "job_location": "Athens, Greece",
     "avg_salary": "89100"
     },
     {
     "skills": "sql",
     "job_location": "Athens, Greece",
     "avg_salary": "83700"
     },
     {
     "skills": "tableau",
     "job_location": "Athens, Greece",
     "avg_salary": "80000"
     },
     {
     "skills": "java",
     "job_location": "Athens, Greece",
     "avg_salary": "72900"
     },
     {
     "skills": "dax",
     "job_location": "Athens, Greece",
     "avg_salary": "72900"
     },
     {
     "skills": "git",
     "job_location": "Athens, Greece",
     "avg_salary": "57500"
     }
     ]
     */