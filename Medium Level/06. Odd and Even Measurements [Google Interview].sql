/*Level: MEDIUM

Assume you are given the table containing measurement values obtained from a Google sensor over several days. 
Measurements are taken several times within a given day.

Write a query to obtain the sum of the odd-numbered and even-numbered measurements on a particular day, in two different columns. 
Refer to the Example Output below for the output format.

Definition:

1st, 3rd, and 5th measurements taken within a day are considered odd-numbered measurements.
the 2nd, 4th, and 6th measurements are even-numbered measurements.

measurements Table:
Column_Name			Type
measurement_id		integer
measurement_value	decimal
measurement_time	datetime

measurements Example Input:
measurement_id	measurement_value	measurement_time
131233			1109.51	07/10/2022 	09:00:00
135211			1662.74	07/10/2022 	11:00:00
523542			1246.24	07/10/2022 	13:15:00
143562			1124.50	07/11/2022 	15:00:00
346462			1234.14	07/11/2022 	16:45:00

Example Output:
measurement_day			odd_sum		even_sum
07/10/2022 00:00:00		2355.75		1662.74
07/11/2022 00:00:00		1124.50		1234.14



My solution:*/

SELECT measurement_day, 
SUM(CASE WHEN MOD(row_id,2)<>0 THEN measurement_value ELSE 0 END) as odd_sum,
SUM(CASE WHEN MOD(row_id,2)=0 THEN measurement_value ELSE 0 END) as even_sum
FROM (
  SELECT measurement_time::TIMESTAMP::DATE as measurement_day,
  measurement_value,
  ROW_NUMBER() OVER(
            PARTITION BY measurement_time::TIMESTAMP::DATE
            ORDER BY measurement_time) as row_id
  FROM measurements
) measurement_with_rows
GROUP BY measurement_day
