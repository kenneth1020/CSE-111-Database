SELECT SUM(ps_supplycost)
FROM partsupp
INNER JOIN part ON p_partkey = ps_partkey
INNER JOIN lineitem ON l_partkey = ps_partkey
INNER JOIN supplier ON s_suppkey = l_suppkey
WHERE strftime('%Y', l_shipdate) = '1997' AND p_retailprice < 1000
AND ps_suppkey NOT IN (SELECT s_suppkey 
                    FROM lineitem
                    INNER JOIN supplier ON l_suppkey = s_suppkey
                    WHERE l_extendedprice < 2000 
                    AND  strftime('%Y', l_shipdate) = '1996');