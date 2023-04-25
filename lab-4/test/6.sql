SELECT s_name, o_orderpriority, count(DISTINCT l_partkey)
FROM part
INNER JOIN partsupp ON p_partkey = ps_partkey 
INNER JOIN supplier ON ps_suppkey = s_suppkey
INNER JOIN nation ON s_nationkey = n_nationkey
INNER JOIN lineitem ON s_suppkey = l_suppkey
INNER JOIN orders ON l_orderkey = o_orderkey
WHERE n_name = 'CANADA' 
GROUP BY s_name, o_orderpriority;