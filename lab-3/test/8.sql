select s_name, s_acctbal
from supplier 
inner join nation on s_nationkey = n_nationkey 
inner join region on n_regionkey = r_regionkey
where s_acctbal > 7000 and r_name = 'EUROPE';