WITH payments AS
  (SELECT "ORDERID" AS order_id,
          cast(SUM("AMOUNT") AS DOUBLE)/ 100 AS payment_amount
   FROM {{ source("stripe", "payment") }}
   WHERE STATUS = 'success'
   GROUP BY order_id)

SELECT * FROM payments