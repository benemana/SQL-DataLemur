/*Level: EASY

Assume you are given the tables below about Facebook pages and page likes. 
Write a query to return the page IDs of all the Facebook pages that don't have any likes. The output should be in ascending order.

pages Table:
Column_Name	  Type
page_id	      integer
page_name	    varchar

Example Input:
page_id	  page_name
20001	    SQL Solutions
20045	    Brain Exercises
20701	    Tips for Data Analysts

page_likes Table:
Column_Name	Type
user_id	    integer
page_id	    integer
liked_date	datetime

page_likes Example Input:
user_id	  page_id	liked_date
111	      20001	  04/08/2022 00:00:00
121	      20045	  03/12/2022 00:00:00
156	      20001   07/25/2022 00:00:00

My solution:*/

SELECT page_id
FROM pages
WHERE page_id NOT IN (SELECT DISTINCT(page_id) FROM page_likes)
ORDER BY page_id