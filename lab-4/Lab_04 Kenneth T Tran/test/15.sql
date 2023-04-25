 --How many distinct orders are between customers with positive account balance and suppliers with
--negative account balance?
SELECT count(DISTINCT o_orderkey)
FROM orders
INNER JOIN customer ON o_custkey = c_custkey
INNER JOIN lineitem ON o_orderkey = l_orderkey
INNER JOIN supplier ON l_suppkey = s_suppkey
WHERE c_acctbal > 0 and s_acctbal < 0;