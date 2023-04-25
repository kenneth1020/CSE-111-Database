select sum(o_totalprice)
from orders
inner join customer on o_custkey = c_custkey
inner join nation on c_nationkey = n_nationkey
inner join region on n_regionkey = r_regionkey
where r_name = 'ASIA' and strftime('%Y',o_orderdate) = '1997';