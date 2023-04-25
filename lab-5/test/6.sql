SELECT p_mfgr
FROM (SELECT ps_partkey as key, min(ps_availqty) as minimum
    FROM partsupp
    INNER JOIN part ON p_partkey = ps_partkey
    INNER JOIN supplier ON ps_suppkey = s_suppkey
    WHERE s_name = 'Supplier#000000010'
)as minimum_ps 
INNER JOIN part ON minimum_ps.key = p_partkey
INNER JOIN partsupp ON p_partkey = ps_partkey 
WHERE minimum_ps.minimum = ps_availqty;