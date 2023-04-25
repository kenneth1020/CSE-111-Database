--. Find the number of distinct orders completed in 1995 by the suppliers in every nation. An order status
--of F stands for complete. Print only those nations for which the number of orders is larger than 50.

SELECT n_name, count(DISTINCT o_orderkey) as orderCount
FROM orders
INNER JOIN lineitem ON o_orderkey = l_orderkey
INNER JOIN supplier ON l_suppkey = s_suppkey 
INNER JOIN nation ON s_nationkey = n_nationkey
WHERE o_orderstatus = 'F' AND strftime('%Y', o_orderdate) = '1995'
GROUP BY n_name
HAVING orderCount > 50;