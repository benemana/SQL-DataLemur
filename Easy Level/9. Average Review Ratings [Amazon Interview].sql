/*
Level: EASY

Given the reviews table, write a query to get the average stars for each product every month.
The output should include the month in numerical value, product id, and average star rating rounded to two decimal places. 
Sort the output based on month followed by the product id.

reviews Table:
Column_Name	Type
review_id	integer
user_id		integer
submit_date	datetime
product_id	integer
stars		integer (1-5)

Example Input:
review_id	user_id	submit_date				product_id	stars
6171		123		06/08/2022 00:00:00		50001		4
7802		265		06/10/2022 00:00:00		69852		4
5293		362		06/18/2022 00:00:00		50001		3
6352		192		07/26/2022 00:00:00		69852		3
4517		981		07/05/2022 00:00:00		69852		2

*/

SELECT EXTRACT(MONTH FROM submit_date) as mth, product_id as product, ROUND(AVG(stars),2) as avg_stars
FROM reviews
GROUP BY EXTRACT(MONTH FROM submit_date), product_id
ORDER BY mth, product_id