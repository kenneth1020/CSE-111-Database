SELECT count(*)
    FROM (SELECT count(*)
        FROM orders
        WHERE strftime('%Y', o_orderdate) = '1995' AND
        strftime('%m', o_orderdate) = '11'
        GROUP BY o_custkey
        HAVING count(*) > 2);