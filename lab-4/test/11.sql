SELECT r_name,s_name, max(s_acctbal)
FROM supplier
INNER JOIN nation ON s_nationkey = n_nationkey
INNER JOIN region ON n_regionkey = r_regionkey
GROUP BY r_name;