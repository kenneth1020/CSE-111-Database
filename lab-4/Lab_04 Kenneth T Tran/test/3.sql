SELECT n_name, count(o_orderkey)
FROM orders
INNER JOIN customer ON o_custkey = c_custkey
INNER JOIN nation ON c_nationkey = n_nationkey
INNER JOIN region ON n_regionkey = r_regionkey
WHERE r_name = 'AMERICA'
GROUP BY n_name; 