SELECT c_name, sum(o_totalprice)
FROM customer
INNER JOIN nation ON c_nationkey = n_nationkey
INNER JOIN orders ON c_custkey = o_custkey
WHERE n_name in ('FRANCE') AND strftime('%Y',o_orderdate) = '1995'
GROUP BY c_name;