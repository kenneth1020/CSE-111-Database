--List the maximum total price of an order between any two regions, i.e., the suppliers are from one
--region and the customers are from the other region

SELECT rSupp.r_name, rCust.r_name, max(o_totalprice)
FROM orders, nation nCust, nation nSupp, region rSupp, region rCust
INNER JOIN customer ON o_custkey = c_custkey
INNER JOIN lineitem ON o_orderkey = l_orderkey
INNER JOIN supplier ON l_suppkey = s_suppkey
WHERE(
    rCust.r_regionkey = nCust.n_regionkey AND
    nCust.n_nationkey = c_nationkey AND
    s_nationkey = nSupp.n_nationkey AND
    nSupp.n_regionkey = rSupp.r_regionkey
)
GROUP BY rSupp.r_name, rCust.r_name;