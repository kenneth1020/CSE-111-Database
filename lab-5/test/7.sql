SELECT o_orderpriority, COUNT(l_quantity)
FROM orders
INNER JOIN lineitem ON o_orderkey = l_orderkey
WHERE strftime('%Y', o_orderdate) = '1997' AND l_receiptdate > l_commitdate
GROUP BY o_orderpriority;