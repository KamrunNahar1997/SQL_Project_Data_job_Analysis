-- Identify the top 10 highest-paying Data Analyst or Data Scientist roles that are available remotely
-- Focuses on job postings with specified salaries (remove nulls)
-- Include company names of top 10 roles


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



--Broad Salary Spectrum: The highest-paying data analyst and Data Scientist positions in 2023 offer salaries ranging from $300,000 to $650,000, highlighting the vast earning potential in these fields.
--Industry-Wide Demand: Major companies such as Mantys, Shelby Jennings, and Algo Capital Group are among those providing top salaries, indicating strong demand across various sectors.
--Variety in Job Titles: Roles range from Data Analyst to Head of Data Science, reflecting the diverse opportunities and specializations available within the data analytics and Data Scientist professions.

-- Results

[
  {
    "job_id": 226942,
    "job_title": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "650000.0",
    "job_posted_date": "2023-02-20 15:13:33",
    "company_name": "Mantys"
  },
  {
    "job_id": 40145,
    "job_title": "Staff Data Scientist/Quant Researcher",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "550000.0",
    "job_posted_date": "2023-08-16 16:05:16",
    "company_name": "Selby Jennings"
  },
  {
    "job_id": 1714768,
    "job_title": "Staff Data Scientist - Business Analytics",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "525000.0",
    "job_posted_date": "2023-09-01 19:24:02",
    "company_name": "Selby Jennings"
  },
  {
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-07-31 14:05:21",
    "company_name": "Algo Capital Group"
  },
  {
    "job_id": 1742633,
    "job_title": "Head of Data Science",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "351500.0",
    "job_posted_date": "2023-07-12 03:07:31",
    "company_name": "Demandbase"
  },
  {
    "job_id": 547382,
    "job_title": "Director of Analytics",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "336500.0",
    "job_posted_date": "2023-08-23 12:04:42",
    "company_name": "Meta"
  },
  {
    "job_id": 551497,
    "job_title": "Head of Data Science",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "324000.0",
    "job_posted_date": "2023-05-26 22:04:44",
    "company_name": "Demandbase"
  },
  {
    "job_id": 126218,
    "job_title": "Director Level - Product Management - Data Science",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "320000.0",
    "job_posted_date": "2023-03-26 23:46:39",
    "company_name": "Teramind"
  },
  {
    "job_id": 1161630,
    "job_title": "Director of Data Science & Analytics",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "313000.0",
    "job_posted_date": "2023-08-23 22:03:48",
    "company_name": "Reddit"
  },
  {
    "job_id": 129924,
    "job_title": "Director of Data Science",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "job_posted_date": "2023-01-21 11:09:36",
    "company_name": "Storm4"
  }
]