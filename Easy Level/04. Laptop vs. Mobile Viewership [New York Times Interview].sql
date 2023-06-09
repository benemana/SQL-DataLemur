/*Level: EASY

Assume that you are given the table below containing information on viewership by device type (where the three types are laptop, tablet, and phone). 
Define “mobile” as the sum of tablet and phone viewership numbers. 
Write a query to compare the viewership on laptops versus mobile devices.

Output the total viewership for laptop and mobile devices in the format of "laptop_views" and "mobile_views".

viewership Table:
Column_Name	  Type
user_id	      integer
device_type	  string ('laptop', 'tablet', 'phone')
view_time	    timestamp

Example Input:
user_id	    device_type	    view_time
123	        tablet	        01/02/2022 00:00:00
125	        laptop	        01/07/2022 00:00:00
128	        laptop	        02/09/2022 00:00:00
129	        phone	          02/09/2022 00:00:00
145	        tablet	        02/24/2022 00:00:00


My solution:*/

SELECT 
  SUM(CASE 
        WHEN device_type = 'laptop' THEN 1
        ELSE 0 
      END) AS laptop_views,
  SUM(CASE 
        WHEN device_type IN ('tablet', 'phone') THEN 1 
        ELSE 0 
      END) AS mobile_views
FROM viewership
