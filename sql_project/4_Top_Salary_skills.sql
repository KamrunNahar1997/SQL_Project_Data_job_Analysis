-- Look at the average salary associated with each skill for Data Analyst positions
-- Focuses on roles with specified salaries, regardless of location


SELECT 
    skills,
    ROUND(AVG(salary_year_avg),0) AS Avg_Salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    (job_title_short = 'Data Analyst' OR job_title_short = 'Data Scientist') 
    AND job_work_from_home = True AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    Avg_Salary DESC
LIMIT 30;


--The highest-paying skills are heavily geared toward compliance, cloud technologies, modern programming languages, AI/ML tools, and data privacy.
--Machine learning, cloud expertise, automation, and NoSQL databases are also highly compensated, reflecting current industry trends and needs.


--RESULTS
[
  {
    "skills": "gdpr",
    "avg_salary": "217738"
  },
  {
    "skills": "bitbucket",
    "avg_salary": "189155"
  },
  {
    "skills": "golang",
    "avg_salary": "187500"
  },
  {
    "skills": "selenium",
    "avg_salary": "180000"
  },
  {
    "skills": "opencv",
    "avg_salary": "172500"
  },
  {
    "skills": "neo4j",
    "avg_salary": "171655"
  },
  {
    "skills": "dynamodb",
    "avg_salary": "169670"
  },
  {
    "skills": "tidyverse",
    "avg_salary": "165513"
  },
  {
    "skills": "solidity",
    "avg_salary": "165000"
  },
  {
    "skills": "datarobot",
    "avg_salary": "162998"
  },
  {
    "skills": "redis",
    "avg_salary": "162500"
  },
  {
    "skills": "watson",
    "avg_salary": "161471"
  },
  {
    "skills": "elixir",
    "avg_salary": "161250"
  },
  {
    "skills": "cassandra",
    "avg_salary": "160850"
  },
  {
    "skills": "atlassian",
    "avg_salary": "160431"
  },
  {
    "skills": "microstrategy",
    "avg_salary": "158765"
  },
  {
    "skills": "slack",
    "avg_salary": "158333"
  },
  {
    "skills": "hugging face",
    "avg_salary": "156520"
  },
  {
    "skills": "vue",
    "avg_salary": "156107"
  },
  {
    "skills": "aurora",
    "avg_salary": "155000"
  },
  {
    "skills": "dplyr",
    "avg_salary": "155000"
  },
  {
    "skills": "c",
    "avg_salary": "154455"
  },
  {
    "skills": "gcp",
    "avg_salary": "154199"
  },
  {
    "skills": "scala",
    "avg_salary": "154095"
  },
  {
    "skills": "php",
    "avg_salary": "153500"
  },
  {
    "skills": "node",
    "avg_salary": "153333"
  },
  {
    "skills": "pytorch",
    "avg_salary": "152603"
  },
  {
    "skills": "airflow",
    "avg_salary": "151823"
  },
  {
    "skills": "assembly",
    "avg_salary": "151620"
  },
  {
    "skills": "tensorflow",
    "avg_salary": "151536"
  }
]