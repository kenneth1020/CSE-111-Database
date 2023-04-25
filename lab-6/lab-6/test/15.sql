SELECT n1, (s3 - s4) - (s1 - s2), (s5 - s6) - (s3 - s4)
FROM (SELECT n_name AS n1, COUNT(l_extendedprice) AS s1
      FROM  lineitem, nation
      INNER JOIN supplier ON l_suppkey = s_suppkey
      INNER JOIN orders ON l_orderkey = o_orderkey
      INNER JOIN customer ON o_custkey = c_custkey
      WHERE s_nationkey = n_nationkey
            AND c_nationkey != n_nationkey
            AND strftime('%Y',l_shipdate) = '1994'
      GROUP BY n_name), 
      (SELECT n_name AS n2, COUNT(l_extendedprice) AS s2
     FROM  lineitem, nation
      INNER JOIN supplier ON l_suppkey = s_suppkey
      INNER JOIN orders ON l_orderkey = o_orderkey
      INNER JOIN customer ON o_custkey = c_custkey
       WHERE c_nationkey = n_nationkey
             AND s_nationkey != n_nationkey
             AND strftime('%Y',l_shipdate) = '1994'
             GROUP BY n_name),
        (SELECT n_name AS n3, COUNT(l_extendedprice) AS s3
            FROM  lineitem, nation
            INNER JOIN supplier ON l_suppkey = s_suppkey
            INNER JOIN orders ON l_orderkey = o_orderkey
            INNER JOIN customer ON o_custkey = c_custkey
            WHERE s_nationkey = n_nationkey
                  AND c_nationkey != n_nationkey
                  AND strftime('%Y',l_shipdate) = '1995'
            GROUP BY n_name),
        (SELECT n_name AS n4, COUNT(l_extendedprice) AS s4
            FROM  lineitem, nation
            INNER JOIN supplier ON l_suppkey = s_suppkey
            INNER JOIN orders ON l_orderkey = o_orderkey
            INNER JOIN customer ON o_custkey = c_custkey
            WHERE c_nationkey = n_nationkey
                  AND s_nationkey != n_nationkey
                  AND strftime('%Y',l_shipdate) = '1995'
            GROUP BY n_name),
        (SELECT n_name AS n5, COUNT(l_extendedprice) AS s5
            FROM  lineitem, nation
            INNER JOIN supplier ON l_suppkey = s_suppkey
            INNER JOIN orders ON l_orderkey = o_orderkey
            INNER JOIN customer ON o_custkey = c_custkey
            WHERE s_nationkey = n_nationkey
                  AND c_nationkey != n_nationkey
                  AND strftime('%Y',l_shipdate) = '1996'
            GROUP BY n_name),
        (SELECT n_name AS n6, COUNT(l_extendedprice) AS s6
            FROM  lineitem, nation
            INNER JOIN supplier ON l_suppkey = s_suppkey
            INNER JOIN orders ON l_orderkey = o_orderkey
            INNER JOIN customer ON o_custkey = c_custkey
            WHERE c_nationkey = n_nationkey
                  AND s_nationkey != n_nationkey
                  AND strftime('%Y',l_shipdate) = '1996'
            GROUP BY n_name)
        
WHERE n1 = n2 AND n1 = n3 AND n1 = n4 AND n1 = n5 AND n1 = n6