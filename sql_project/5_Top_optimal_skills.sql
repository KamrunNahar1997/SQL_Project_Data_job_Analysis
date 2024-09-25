-- Identify skills in high demand and associated with high average salaries for Data Analyst and Data Scientist roles
-- Concentrates on remote positions with specified salaries


SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    (job_title_short = 'Data Analyst' OR job_title_short = 'Data Scientist')
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True 
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;


--Cloud computing, machine learning, and big data technologies dominate both demand and salary, with AWS and Spark leading.
--AI and data engineering skills like TensorFlow, PyTorch, and Hadoop are high-paying and critical in the current landscape.
--The Python data science ecosystem (Pandas, Numpy, Scikit-learn) remains foundational, while cloud-native tools (Snowflake, BigQuery) are growing rapidly.
--Data manipulation libraries like Pandas and Numpy, to advanced machine learning tools such as TensorFlow and PyTorch are essential tools and technologies for data analysis and data science.


--RESULTS


[
  {
    "skill_id": 26,
    "skills": "c",
    "demand_count": "57",
    "avg_salary": "154455"
  },
  {
    "skill_id": 81,
    "skills": "gcp",
    "demand_count": "62",
    "avg_salary": "154199"
  },
  {
    "skill_id": 3,
    "skills": "scala",
    "demand_count": "61",
    "avg_salary": "154095"
  },
  {
    "skill_id": 101,
    "skills": "pytorch",
    "demand_count": "115",
    "avg_salary": "152603"
  },
  {
    "skill_id": 96,
    "skills": "airflow",
    "demand_count": "28",
    "avg_salary": "151823"
  },
  {
    "skill_id": 99,
    "skills": "tensorflow",
    "demand_count": "126",
    "avg_salary": "151536"
  },
  {
    "skill_id": 95,
    "skills": "pyspark",
    "demand_count": "36",
    "avg_salary": "150913"
  },
  {
    "skill_id": 8,
    "skills": "go",
    "demand_count": "84",
    "avg_salary": "148822"
  },
  {
    "skill_id": 94,
    "skills": "numpy",
    "demand_count": "78",
    "avg_salary": "148732"
  },
  {
    "skill_id": 106,
    "skills": "scikit-learn",
    "demand_count": "83",
    "avg_salary": "148405"
  },
  {
    "skill_id": 92,
    "skills": "spark",
    "demand_count": "162",
    "avg_salary": "146087"
  },
  {
    "skill_id": 93,
    "skills": "pandas",
    "demand_count": "122",
    "avg_salary": "145333"
  },
  {
    "skill_id": 77,
    "skills": "bigquery",
    "demand_count": "49",
    "avg_salary": "144543"
  },
  {
    "skill_id": 76,
    "skills": "aws",
    "demand_count": "249",
    "avg_salary": "144321"
  },
  {
    "skill_id": 213,
    "skills": "kubernetes",
    "demand_count": "27",
    "avg_salary": "143609"
  },
  {
    "skill_id": 100,
    "skills": "keras",
    "demand_count": "39",
    "avg_salary": "141634"
  },
  {
    "skill_id": 98,
    "skills": "kafka",
    "demand_count": "16",
    "avg_salary": "140132"
  },
  {
    "skill_id": 75,
    "skills": "databricks",
    "demand_count": "73",
    "avg_salary": "139943"
  },
  {
    "skill_id": 80,
    "skills": "snowflake",
    "demand_count": "109",
    "avg_salary": "139198"
  },
  {
    "skill_id": 6,
    "skills": "shell",
    "demand_count": "13",
    "avg_salary": "138606"
  },
  {
    "skill_id": 4,
    "skills": "java",
    "demand_count": "81",
    "avg_salary": "137563"
  },
  {
    "skill_id": 103,
    "skills": "nltk",
    "demand_count": "13",
    "avg_salary": "137212"
  },
  {
    "skill_id": 97,
    "skills": "hadoop",
    "demand_count": "104",
    "avg_salary": "136948"
  },
  {
    "skill_id": 169,
    "skills": "linux",
    "demand_count": "23",
    "avg_salary": "136472"
  },
  {
    "skill_id": 108,
    "skills": "matplotlib",
    "demand_count": "45",
    "avg_salary": "136321"
  }
]