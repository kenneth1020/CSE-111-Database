SELECT DISTINCT p_name
FROM lineitem
INNER JOIN (SELECT l_partkey as key, min(l_extendedprice*(1 - l_discount)) as minimum
        FROM lineitem) as temp
INNER JOIN part ON temp.key = p_partkey
WHERE l_shipdate > '1996-10-2';