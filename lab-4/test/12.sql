SELECT n_name, max(s_acctbal) as maxbal
FROM supplier
INNER JOIN nation ON s_nationkey = n_nationkey
GROUP BY n_name
HAVING maxbal > 9000;