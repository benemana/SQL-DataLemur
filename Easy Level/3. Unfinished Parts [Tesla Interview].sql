/*Level: EASY

Tesla is investigating bottlenecks in their production, and they need your help to extract the relevant data. 
Write a query that determines which parts have begun the assembly process but are not yet finished.

Assumptions:
Table parts_assembly contains all parts in production.
A part with no finish_date is an unfinished part.

parts_assembly Table
Column_Name	  Type
part	        string
finish_date	  datetime
assembly_step	integer

Example Input
part	  finish_date	          assembly_step
battery	01/22/2022 00:00:00	  1
battery	02/22/2022 00:00:00	  2
battery	03/22/2022 00:00:00	  3
bumper	01/22/2022 00:00:00	  1
bumper	02/22/2022 00:00:00	  2
bumper		                    3
bumper		                    4

My solution:*/

SELECT DISTINCT(part) 
FROM parts_assembly 
WHERE finish_date IS NULL
