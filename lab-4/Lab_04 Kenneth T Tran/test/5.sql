SELECT c_name, count(o_orderkey)
FROM orders 
INNER JOIN customer ON o_custkey = c_custkey
INNER JOIN nation ON c_nationkey = n_nationkey
WHERE n_name in ('GERMANY') AND strftime('%Y',o_orderdate) = '1993'
GROUP BY c_name;