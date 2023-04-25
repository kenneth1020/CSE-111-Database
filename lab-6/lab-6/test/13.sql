SELECT n_name
    FROM nation
    INNER JOIN supplier ON n_nationkey = s_nationkey
    INNER JOIN lineitem ON s_suppkey = l_suppkey
    WHERE strftime('%Y', l_shipdate) = '1994'
    GROUP BY n_name
    HAVING sum(l_extendedprice) = (SELECT max(sumPrice.countPrice) FROM
                                    (SELECT n_name as nameNation, sum(l_extendedprice) as countPrice
                                    FROM nation
                                    INNER JOIN supplier ON n_nationkey = s_nationkey
                                    INNER JOIN lineitem ON s_suppkey = l_suppkey
                                    WHERE strftime('%Y', l_shipdate) = '1994'
                                    GROUP BY n_name) as sumPrice
                                    );