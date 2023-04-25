SELECT count(DISTINCT o_clerk)
FROM orders 
INNER JOIN lineitem ON o_orderkey = l_orderkey
INNER JOIN supplier ON l_suppkey = s_suppkey
INNER JOIN nation on s_nationkey = n_nationkey
WHERE n_name = 'UNITED STATES';