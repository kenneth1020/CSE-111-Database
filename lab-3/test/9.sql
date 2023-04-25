select n_name, count(s_nationkey) , min(s_acctbal)
from supplier
inner join nation on s_nationkey = n_nationkey
group by n_name
having count(s_nationkey) > 5;
