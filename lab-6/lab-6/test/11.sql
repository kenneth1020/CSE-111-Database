SELECT n_name
    FROM nation
    INNER JOIN customer ON n_nationkey = c_nationkey
    GROUP BY n_name
    HAVING count(c_name) = (SELECT min(countCust.countName) FROM
                                    (SELECT n_name as nat, count(c_name) as countName
                                    FROM nation
                                    INNER JOIN customer ON n_nationkey = c_nationkey
                                    GROUP BY n_name) as countCust
                            );