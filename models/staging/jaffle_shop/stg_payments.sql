WITH payments AS 
  (SELECT "ID" AS payment_id,
          "ORDERID" AS order_id,
          {{ cents_to_dollar('amount', 4) }} AS payment_amount,
          "PAYMENTMETHOD" AS payment_method,
          "STATUS" AS payment_status,
          "CREATED" AS payment_date
   FROM {{ source("stripe", "payment") }}),
test as (
SELECT 
{{ dbt_utils.star(from=source("stripe", "payment"))}}
FROM
{{source("stripe", "payment") -}}
)
SELECT 
*
from test

{{ dbt_audit(
    cte_ref="payments",
    created_by="@dzickuhr",
    updated_by="@dzickuhr",
    created_date="2020-11-13",
    updated_date="2021-03-01"
) }}
