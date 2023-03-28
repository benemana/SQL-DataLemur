/*Level: MEDIUM

A Microsoft Azure Supercloud customer is a company which buys at least 1 product from each product category.
Write a query to report the company ID which is a Supercloud customer.


customer_contracts Table:
Column_Name	Type
customer_id	integer
product_id	integer
amount		  integer

customer_contracts Example Input:
customer_id	product_id	amount
1		1		1000
1		3		2000
1		5		1500
2		2		3000
2		6		2000

products Table:
Column_Name			Type
product_id			integer
product_category	string
product_name		string

products Example Input:
product_id	product_category	product_name
1		Analytics		Azure Databricks
2		Analytics		Azure Stream Analytics
4		Containers		Azure Kubernetes Service
5		Containers		Azure Service Fabric	
6		Compute			Virtual Machines		
7		Compute			Azure Functions


My solution:*/

WITH customer_categories AS
(
  SELECT cc.customer_id, COUNT(DISTINCT(pro.product_category)) as bought_categories
  FROM customer_contracts cc 
  JOIN products pro ON cc.product_id = pro.product_id
  GROUP BY cc.customer_id
)

SELECT customer_id
FROM customer_categories
WHERE bought_categories = 
      (
      SELECT COUNT(DISTINCT(product_category))
      FROM products
      )
