
SELECT c_mktsegment, 
    sum(c_acctbal)
from customer
group by c_mktsegment;