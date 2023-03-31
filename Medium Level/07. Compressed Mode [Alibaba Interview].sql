/*Level: MEDIUM

You are trying to find the most common (aka the mode) number of items bought per order on Alibaba.

However, instead of doing analytics on all Alibaba orders, you have access to a summary table, 
which describes how many items were in an order (item_count), and the number of orders that had that many items (order_occurrences).

In case of multiple item counts, display the item_counts in ascending order.

items_per_order Table:
Column_Name			Type
item_count			integer
order_occurrences	integer

items_per_order Example Input:
item_count	order_occurrences
1			500
2			1000
3			800
4			1000


My solution:*/

SELECT item_count as mode
FROM items_per_order
WHERE order_occurrences = 
          (SELECT MAX(order_occurrences)
          FROM items_per_order)
ORDER BY item_count
