SELECT min(l_discount)
FROM lineitem
INNER JOIN orders ON l_orderkey = o_orderkey
WHERE strftime('%Y', o_orderdate) = '1996' AND
    strftime('%m', o_orderdate) = '10' AND
    l_discount > (SELECT avg(l_discount)
                FROM lineitem);