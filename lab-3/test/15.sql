select strftime('%Y',o_orderdate) as yr,count(l_linenumber)
from lineitem
inner join supplier on l_suppkey = s_suppkey
inner join nation on s_nationkey = n_nationkey
inner join orders on l_orderkey = o_orderkey
where o_orderpriority = '3-MEDIUM' and n_name in ('FRANCE', 'GERMANY')
group by yr;