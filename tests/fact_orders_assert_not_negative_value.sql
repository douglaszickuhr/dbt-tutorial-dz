select  * 
from
{{ ref("fact_orders")}}
where amount < 0