SELECT n_name
    FROM nation
    INNER JOIN customer ON n_nationkey = c_nationkey
    INNER JOIN orders ON c_custkey = o_custkey
    GROUP BY n_name
    HAVING sum(o_totalprice) = (SELECT min(sumPrice.totalP) FROM
                                    (SELECT n_name as nameNation, sum(o_totalprice) as totalP
                                    FROM nation
                                    INNER JOIN customer ON n_nationkey = c_nationkey
                                    INNER JOIN orders ON c_custkey = o_custkey
                                    GROUP BY n_name) as sumPrice
                                );