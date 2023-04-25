select distinct n_name
from orders
inner join customer on o_custkey = c_custkey
inner join nation on c_nationkey = n_nationkey
where o_orderdate between '1994-09-09' and '1994-09-11'
order by n_name; 