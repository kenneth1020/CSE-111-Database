select r_name, count(o_orderstatus)
from orders
inner join customer on o_custkey = c_custkey
inner join nation on c_nationkey = n_nationkey
inner join region on n_regionkey = r_regionkey
where o_orderstatus = 'P'
group by r_name;