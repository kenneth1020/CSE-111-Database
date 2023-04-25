SELECT r_name, COUNT(s_name)
FROM supplier
INNER JOIN nation ON s_nationkey = n_nationkey
INNER JOIN region ON n_regionkey = r_regionkey
INNER JOIN (SELECT r_name AS referName, avg(s_acctbal) AS average_bal
        FROM supplier
        INNER JOIN nation ON s_nationkey = n_nationkey
        INNER JOIN region ON n_regionkey = r_regionkey
        GROUP BY r_name
    ) as average ON average.referName = r_name
WHERE s_acctbal < average.average_bal
GROUP BY r_name;

