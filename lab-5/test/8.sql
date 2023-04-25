SELECT count(DISTINCT s_name)
FROM supplier
INNER JOIN part ON p_partkey = ps_partkey
INNER JOIN partsupp ON ps_suppkey = s_suppkey
WHERE ( p_type LIKE '%POLISHED%' AND 
(p_size == 3 OR p_size == 23 OR p_size == 36 OR p_size == 49));