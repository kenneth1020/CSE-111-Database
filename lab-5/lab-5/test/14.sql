SELECT sRegion.r_name, cRegion.r_name, strftime('%Y', l_shipdate), SUM(l_extendedprice*(1-l_discount)) 
FROM lineitem
INNER JOIN orders ON l_orderkey = o_orderkey
INNER JOIN customer ON o_custkey = c_custkey
INNER JOIN nation cNation ON c_nationkey = cNation.n_nationkey
INNER JOIN region cRegion ON cNation.n_regionkey = cRegion.r_regionkey
INNER JOIN supplier ON l_suppkey = s_suppkey
INNER JOIN nation sNation ON s_nationkey = sNation.n_nationkey
INNER JOIN region sRegion ON sNation.n_regionkey = sRegion.r_regionkey
WHERE strftime('%Y', l_shipdate) = '1996' OR strftime('%Y', l_shipdate) = '1997'
GROUP BY sRegion.r_name, cRegion.r_name, strftime('%Y', l_shipdate)
ORDER BY sRegion.r_name, cRegion.r_name, strftime('%Y', l_shipdate);
