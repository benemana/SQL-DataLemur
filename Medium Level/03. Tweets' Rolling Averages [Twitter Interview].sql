/*
Level: MEDIUM

The table below contains information about tweets over a given period of time. 
Calculate the 3-day rolling average of tweets published by each user for each date that a tweet was posted. 
Output the user id, tweet date, and rolling averages rounded to 2 decimal places.

Important Assumptions:
Rows in this table are consecutive and ordered by date.
Each row represents a different day
A day that does not correspond to a row in this table is not counted. 
The most recent day is the next row above the current row.

tweets Table:
Column_Name	Type
tweet_id	integer
user_id		integer
tweet_date	timestamp

Example Input:
tweet_id	user_id	tweet_date
214252		111		06/01/2022 12:00:00
739252		111		06/01/2022 12:00:00
846402		111		06/02/2022 12:00:00
241425		254		06/02/2022 12:00:00
137374		111		06/04/2022 12:00:00

My solution:
*/

WITH tweet_count
AS (
  SELECT
    user_id,
    tweet_date,
    COUNT(DISTINCT tweet_id) AS tweet_num
  FROM tweets
  GROUP BY user_id,tweet_date
)

SELECT
  user_id,
  tweet_date,
  ROUND(
    AVG(tweet_num) OVER (
      PARTITION BY user_id
      ORDER BY user_id, tweet_date
      ROWS BETWEEN 2 PRECEDING AND CURRENT ROW), 2)
  AS rolling_avg_3d
FROM tweet_count
