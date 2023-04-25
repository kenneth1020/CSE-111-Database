SELECT custName, custCount, suppCount
FROM (SELECT n_name as custName, count(c_name) as custCount
    FROM customer
    INNER JOIN nation ON c_nationkey = n_nationkey
    INNER JOIN region ON n_regionkey = r_regionkey
    WHERE r_name = 'AFRICA'
    GROUP BY n_name
) as custSub
INNER JOIN (SELECT n_name as suppName, count(s_name) as suppCount
        FROM supplier
        INNER JOIN nation ON s_nationkey = n_nationkey
        INNER JOIN region ON n_regionkey = r_regionkey
        WHERE r_name = 'AFRICA'
        GROUP BY n_name) as suppSub ON custSub.custName = suppSub.suppName
ORDER BY custName;