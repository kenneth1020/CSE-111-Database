select sum(c_acctbal)
from customer
inner join nation on c_nationkey = n_nationkey
inner join region on n_regionkey = r_regionkey
where r_name = 'ASIA' and c_mktsegment = 'MACHINERY';