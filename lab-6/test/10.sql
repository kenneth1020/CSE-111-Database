SELECT region.r_name
    FROM  orders, lineitem, nation as suppNation, nation as custNation
    INNER JOIN region ON r_regionkey = custNation.n_regionkey 
    AND r_regionkey = suppNation.n_regionkey
    INNER JOIN customer ON custNation.n_nationkey = customer.c_nationkey 
    AND c_custkey = o_custkey
    INNER JOIN supplier ON s_nationkey = suppNation.n_nationkey 
    AND s_suppkey = l_suppkey
    WHERE o_orderkey = l_orderkey
    GROUP BY r_name
    ORDER BY sum(l_extendedprice) ASC
    LIMIT 1