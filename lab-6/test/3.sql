SELECT count(*)
    FROM (SELECT count(ps_suppkey) as num
        FROM partsupp
        INNER JOIN supplier ON ps_suppkey = s_suppkey
        INNER JOIN nation ON s_nationkey = n_nationkey
        WHERE n_name = 'UNITED STATES'
        GROUP BY ps_partkey)
WHERE num == 2;