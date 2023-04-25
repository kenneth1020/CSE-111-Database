select count(o_orderpriority)
from orders
inner join customer on o_custkey = c_custkey
inner join nation on c_nationkey = n_nationkey
inner join region on n_regionkey = r_regionkey
where o_orderpriority = '1-URGENT' and n_name = 'PERU' and strftime('%Y',o_orderdate) between '1995' and '1997';