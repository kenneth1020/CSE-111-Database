--How many line items are supplied by suppliers in AFRICA for orders made by customers in UNITED
--STATES?

SELECT count(*)
    From orders, nation nCust, nation nSupp, region rSupp
    INNER JOIN lineitem ON o_orderkey = l_orderkey
    INNER JOIN supplier on l_suppkey = s_suppkey
    INNER JOIN customer on c_custkey = o_custkey
    WHERE(
        nCust.n_name = 'UNITED STATES' AND
        nCust.n_nationkey = c_nationkey AND
        s_nationkey = nSupp.n_nationkey AND
        nSupp.n_regionkey = rSupp.r_regionkey AND
        rSupp.r_name = 'AFRICA'
    );
