-- Join job postings to inner join table similar to query 2
-- Identify the top 5 in-demand skills for a data analyst and data data scientist.
-- Focus on all job postings.


SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    (job_title_short = 'Data Analyst' OR job_title_short = 'Data Scientist') 
    AND job_work_from_home = True 
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;


--For data analysts and data scientists, SQL and Python are indispensable, forming the backbone of efficient data processing and analysis. 
--Proficiency in spreadsheet manipulation, particularly through Excel, remains a key competency. 
--Moreover, expertise in visualization and programming tools such as Tableau and R is critical, underscoring the growing demand for translating complex data into actionable insights and supporting informed decision-making processes.



--RESULT


[
  {
    "skills": "sql",
    "demand_count": "14779"
  },
  {
    "skills": "python",
    "demand_count": "14720"
  },
  {
    "skills": "r",
    "demand_count": "6816"
  },
  {
    "skills": "tableau",
    "demand_count": "6203"
  },
  {
    "skills": "excel",
    "demand_count": "5875"
  }
]