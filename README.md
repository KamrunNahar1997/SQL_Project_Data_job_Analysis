# Introduction

In this SQL analysis project, I conducted an in-depth exploration of the data job market, with a particular focus on data analyst and Data Scientist roles. This analysis uncovers valuable insights into the industry's landscape, highlighting the top-paying jobs, the most sought-after skills, and the intersection of high demand and competitive salaries within these fields. By leveraging SQL to dive deep into job trends, this project provides a clear view of the current opportunities and requirements for data professionals in today's competitive market.

Check them out at sql_project folder

# The questions I wanted to answer through my SQL queries were:

1. What are the top-paying data analyst and data scientist jobs?
2. What skills are required for these top-paying jobs?
3. What skills are most in demand for data analysts and data scientist?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn?

# Tools Used 

- SQL: The backbone of my analysis, allowing me to query the database and unearth critical insights.

- PostgreSQL: The chosen database management system, ideal for handling the job posting data.

- Visual Studio Code: My go-to for database management and executing SQL queries.

- Git & GitHub: Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.

# The Analysis

Each query for this project aimed at investigating specific aspects of the data analyst and data scientist job market. Here’s how I approached each question:

### Top Paying Jobs

To identify the highest-paying roles, I filtered data analyst and data scientist positions by average yearly salary and location, focusing on remote jobs. This query highlights the high paying opportunities in the field.

```sql
SELECT *
FROM
    job_postings_fact


SELECT	
	job_id,
	job_title,
	job_location,
	job_schedule_type,
	salary_year_avg,
	job_posted_date
FROM
    job_postings_fact


SELECT	
	job_id,
	job_title,
	job_location,
	job_schedule_type,
	salary_year_avg,
	job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    (job_title_short = 'Data Analyst' OR job_title_short = 'Data Scientist') AND 
    job_location = 'Anywhere' AND 
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;
```

![Top paying Jobs](image.png)


This chart provides a visual comparison of the average salaries across various roles in the data job market

- Data Analyst at Mantys tops the list with the highest salary, averaging $650,000 per year.

- Staff Data Scientist and Quant Researcher roles at Selby Jennings follow with salaries ranging between $525,000 and $550,000.

- Mid-level roles such as Data Scientist at Algo Capital Group offer $375,000 annually.

- Leadership positions like Director of Analytics (Meta) and Head of Data Science (Demandbase) have salaries ranging from $300,000 to $351,500.

This breakdown shows that both seniority and specialization significantly influence earning potential in the data field.

### Top Paying skills

To understand what skills are required for the top-paying jobs, I joined the job postings with the skills data, providing insights into what employers value for high-compensation roles.

```sql
WITH top_paying_jobs AS (
    SELECT	
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        (job_title_short = 'Data Analyst' OR job_title_short = 'Data Scientist') AND 
        job_location = 'Anywhere' AND 
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;
```
![Top skills demand](image-1.png)  

- SQL (3 mentions): Still a high-demand skill for data querying and analytics roles.

- Python (3 mentions): Widely sought after for programming, analytics, and machine learning.

- AWS (2 mentions): Cloud computing expertise is in growing demand.

- Big Data & ML Tools (Hadoop, Spark, TensorFlow, etc. 1 mention each): Specialized tools required for advanced roles, but less frequent than SQL or Python.


### Top Demanded Skills 

This query helped identify the skills most frequently requested in job postings, directing focus to areas with high demand.

```sql
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
```

![Top 5 Skills](image-2.png)

- SQL is the most in-demand skill, with 14,779 job listings or opportunities mentioning it.

- Python follows closely with 14,720 mentions, reflecting a nearly equal demand.

- R is mentioned in 6,816 listings, indicating moderate demand compared to SQL and Python.

- Tableau is sought after in 6,203 cases, showing its relevance in data visualization roles.

- Excel rounds out the list with 5,875 mentions, still maintaining solid demand, especially in business and analytical roles.

SQL and Python lead the pack, showing their dominance in data roles, while R, Tableau, and Excel have significant but comparatively lower demand.

### Top Salary Skills

Exploring the average salaries associated with different skills revealed which skills are the highest paying.

![Top Salary Skills](image-3.png)

- High-Paying Skills: GDPR leads the pack with the highest average salary ($217,738), followed by Bitbucket and Golang, indicating strong demand for compliance, version control, and efficient programming skills.

- Emerging Technologies: Skills in blockchain (Solidity), AI (DataRobot, OpenCV), and NoSQL databases (DynamoDB, Neo4j) offer competitive salaries, highlighting growing industries.

- Automation & Data Science: Tools like Selenium (automation testing) and Tidyverse (data science in R) offer high salaries, reflecting their importance in streamlining processes and data analysis.

### Top Optimal Skills

Combining insights from demand and salary data, this query aimed to pinpoint skills that are both in high demand and have high salaries, offering a strategic focus for skill development.

```sql
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
```

![Top Optimal Skills](image-4.png)

- Top-Paying Skills: Skills like C, GCP (Google Cloud Platform), and Scala offer the highest average salaries, all around $154K, indicating strong demand for cloud infrastructure and programming expertise.

- AI & Machine Learning Focus: PyTorch, TensorFlow, and Scikit-learn are among the most in-demand skills, reflecting the high value placed on machine learning frameworks with average salaries ranging from $148K to $152K.

- Data Engineering & Analytics: Tools like Airflow (workflow automation), PySpark, and NumPy are valued in data processing and analysis, with average salaries around $148K to $151K.


# conclusion

This analysis highlights the competitive salaries and high demand for data-related roles and skills. Top-paying positions like Data Analyst at Mantys and Data Scientist roles at Selby Jennings offer salaries above $500K, while SQL and Python remain the most sought-after skills. Emerging technologies, cloud infrastructure, and machine learning frameworks are driving salary growth, particularly for roles in AI, data engineering, and automation. Specialized tools like GDPR, PyTorch, and Airflow command high salaries, emphasizing their importance in today’s data-driven landscape.
