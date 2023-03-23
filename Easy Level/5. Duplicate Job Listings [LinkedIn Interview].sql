/*Level: EASY

Assume you are given the table below that shows job postings for all companies on the LinkedIn platform. 
Write a query to get the number of companies that have posted duplicate job listings.

Clarification:
Duplicate job listings refer to two jobs at the same company with the same title and description.

job_listings Table:
Column_Name	  Type
job_id	      integer
company_id	  integer
title	        string
description	  string

job_listings Example:
job_id	company_id	title	            description
248	    827	        Business Analyst	Business analyst evaluates past and current business data with the primary goal of improving decision-making processes within organizations.
149	    845	        Business Analyst	Business analyst evaluates past and current business data with the primary goal of improving decision-making processes within organizations.
945	    345	        Data Analyst	    Data analyst reviews data to identify key insights into a business's customers and ways the data can be used to solve problems.
164	    345	        Data Analyst	    Data analyst reviews data to identify key insights into a business's customers and ways the data can be used to solve problems.
172	    244	        Data Engineer	    Data engineer works in a variety of settings to build systems that collect, manage, and convert raw data into usable information for data scientists and business analysts to interpret.

My solution: */

SELECT COUNT(*) AS co_w_duplicate_jobs
FROM (
  SELECT DISTINCT(company_id, title, description)
  FROM job_listings
  GROUP BY company_id, title, description
  HAVING COUNT(*) > 1
  ) AS duplicates
