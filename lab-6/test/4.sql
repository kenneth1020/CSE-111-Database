SELECT count(*)
    FROM (SELECT ps_suppkey as sKey, count(ps_partkey) as num
        FROM partsupp
        GROUP BY ps_suppkey
    ) as countSup
    INNER JOIN supplier ON countSup.sKey = s_suppkey
    INNER JOIN nation ON s_nationkey = n_nationkey
    WHERE n_name = 'UNITED STATES';