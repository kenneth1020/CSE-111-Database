SELECT o_orderpriority, COUNT(DISTINCT o_orderkey)
FROM orders
INNER JOIN lineitem ON l_orderkey = o_orderkey
WHERE o_orderdate >= '1997-10-01'AND o_orderdate < '1998-01-01'AND l_receiptdate < l_commitdate
GROUP BY o_orderpriority;