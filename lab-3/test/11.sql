select count(distinct c_name)
from lineitem
inner join orders on l_orderkey = o_orderkey
inner join customer on o_custkey = c_custkey
where l_discount >= 0.07;