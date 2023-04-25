SELECT s_name, c_name, min(o_totalprice)
    FROM supplier
    INNER JOIN lineitem ON s_suppkey = l_suppkey
    INNER JOIN orders ON l_orderkey = o_orderkey
    INNER JOIN customer ON o_custkey = c_custkey;