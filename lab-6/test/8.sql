SELECT count(DISTINCT c_custkey)
FROM orders, customer
WHERE c_custkey = o_custkey
AND o_orderkey NOT IN (SELECT DISTINCT(o_orderkey)
                        FROM lineitem
                        INNER JOIN orders ON l_orderkey = o_orderkey
                        INNER JOIN supplier ON l_suppkey = s_suppkey
                        INNER JOIN nation ON s_nationkey = n_nationkey
                        INNER JOIN region ON n_regionkey = r_regionkey
                        WHERE r_name NOT IN ('AMERICA')
                    );