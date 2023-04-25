SELECT s_name, p_size, min(ps_supplycost) 
FROM supplier
INNER JOIN partsupp ON s_suppkey = ps_suppkey
INNER JOIN nation ON s_nationkey = n_nationkey
INNER JOIN region ON n_regionkey = r_regionkey
INNER JOIN part ON ps_partkey = p_partkey
WHERE r_name = 'ASIA' AND p_type LIKE '%STEEL%'
GROUP BY p_size
ORDER BY s_name, p_size;