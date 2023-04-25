SELECT s_name, count(DISTINCT p_partkey)
FROM supplier
INNER JOIN partsupp ON s_suppkey = ps_suppkey
INNER JOIN part ON ps_partkey = p_partkey
INNER JOIN nation ON s_nationkey = n_nationkey
WHERE n_name = 'CANADA' AND p_size < 20
GROUP BY s_name;