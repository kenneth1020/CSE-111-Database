SELECT r_name, count(c_name)
FROM customer
INNER JOIN nation ON c_nationkey = n_nationkey
INNER JOIN region ON n_regionkey = r_regionkey
WHERE c_custkey NOT IN (SELECT o_custkey 
                    FROM orders) 
AND c_acctbal < (SELECT avg(c_acctbal) 
            FROM customer)
GROUP BY r_name;