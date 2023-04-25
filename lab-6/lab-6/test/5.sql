SELECT count(ps_suppkey)
    FROM (SELECT p_partkey as pKey, max(p_retailprice) 
    FROM part) as maxPrice
    INNER JOIN partsupp ON maxPrice.pKey = ps_partkey;