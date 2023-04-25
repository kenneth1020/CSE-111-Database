SELECT p_name
FROM part
INNER JOIN partsupp ON p_partkey = ps_partkey
INNER JOIN supplier ON ps_suppkey = s_suppkey
INNER JOIN nation ON s_nationkey = n_nationkey
WHERE n_name = 'UNITED STATES' AND ps_supplycost 
* ps_availqty IN (SELECT ps_supplycost * ps_availqty
            FROM partsupp
            ORDER BY ps_supplycost * ps_availqty
            DESC LIMIT (SELECT COUNT(ps_supplycost * ps_availqty) * 0.01 
                FROM partsupp) );