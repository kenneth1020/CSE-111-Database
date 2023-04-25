SELECT DISTINCT p_name
    FROM part
    INNER JOIN lineitem ON p_partkey = l_partkey
    INNER JOIN orders ON l_orderkey = o_orderkey
    INNER JOIN customer ON o_custkey = c_custkey
    INNER JOIN nation ON c_nationkey = n_nationkey
    INNER JOIN region ON n_regionkey = r_regionkey    
    WHERE r_name = 'AMERICA'
INTERSECT
SELECT p_name
    FROM part
    INNER JOIN lineitem ON p_partkey = l_partkey
    INNER JOIN supplier ON l_suppkey = s_suppkey
    INNER JOIN nation ON s_nationkey = n_nationkey
    INNER JOIN region ON n_regionkey = r_regionkey
    WHERE r_name = 'ASIA'
    GROUP BY p_name 
    HAVING count(*) = 3;