SELECT SUM(l_extendedprice * (1 - l_discount)) / 
    (SELECT SUM(l_extendedprice * (1 - l_discount)) 
        FROM lineitem, nation n1, nation n2, region
        INNER JOIN supplier ON l_suppkey = s_suppkey
        INNER JOIN orders ON l_orderkey = o_orderkey
        INNER JOIN customer on o_custkey = c_custkey
            WHERE
            c_nationkey == n1.n_nationkey AND
            n1.n_regionkey == r_regionkey AND
            r_name == 'ASIA' AND
            s_nationkey == n2.n_nationkey AND
            n2.n_name NOT IN (SELECT r_name 
                        FROM region 
                        WHERE r_name == 'UNITED STATES') AND
            strftime('%Y', l_shipdate) = '1997') AS marketShare
FROM lineitem, nation n1, nation n2, region
INNER JOIN supplier ON l_suppkey = s_suppkey
INNER JOIN orders ON l_orderkey = o_orderkey
INNER JOIN customer on o_custkey = c_custkey
WHERE c_nationkey == n1.n_nationkey AND
    n1.n_regionkey == r_regionkey AND
    r_name == 'ASIA' AND
    s_nationkey == n2.n_nationkey AND
    n2.n_name == 'UNITED STATES' AND
    strftime('%Y', l_shipdate) = '1997';