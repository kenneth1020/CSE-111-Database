SELECT name1, (sum1 - sum2)
FROM (SELECT n_name AS name1, COUNT(l_extendedprice) AS sum1
      FROM  lineitem, nation
      INNER JOIN supplier ON l_suppkey = s_suppkey
      INNER JOIN orders ON l_orderkey = o_orderkey
      INNER JOIN customer ON o_custkey = c_custkey
      WHERE s_nationkey = n_nationkey
            AND c_nationkey != n_nationkey
            AND strftime('%Y',l_shipdate) = '1994'
      GROUP BY n_name), 
      (SELECT n_name AS name2, COUNT(l_extendedprice) AS sum2
       FROM  lineitem, nation
      INNER JOIN supplier ON l_suppkey = s_suppkey
      INNER JOIN orders ON l_orderkey = o_orderkey
      INNER JOIN customer ON o_custkey = c_custkey
       WHERE c_nationkey = n_nationkey
             AND s_nationkey != n_nationkey
             AND strftime('%Y',l_shipdate) = '1994'
             GROUP BY n_name)
WHERE name1 = name2;