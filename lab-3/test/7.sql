select strftime('%Y-%m', l_receiptdate), count(l_receiptdate)
from lineitem
inner join orders on l_orderkey = o_orderkey
inner join customer on o_custkey = c_custkey
where c_name = 'Customer#000000020'
group by strftime('%Y-%m', l_receiptdate);