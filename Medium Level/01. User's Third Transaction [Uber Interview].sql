/*
Level: MEDIUM

Assume you are given the table below on Uber transactions made by users. 
Write a query to obtain the third transaction of every user. 
Output the user id, spend and transaction date.

transactions Table:
Column_Name			Type
user_id				integer
spend				decimal
transaction_date	timestamp

Example Input:
user_id		spend	transaction_date
111			100.50	01/08/2022 12:00:00
111			55.00	01/10/2022 12:00:00
121			36.00	01/18/2022 12:00:00
145			24.99	01/26/2022 12:00:00
111			89.60	02/05/2022 12:00:00



My solution: */


SELECT user_id, spend, transaction_date
FROM (
  SELECT 
    user_id, spend, transaction_date, 
    ROW_NUMBER() OVER (
      PARTITION BY user_id ORDER BY transaction_date) AS row_num
  FROM transactions) AS trans_num 
WHERE row_num = 3
