WITH payments AS
  (SELECT "ID" AS payment_id,
          "ORDERID" AS order_id,
          cast("AMOUNT" AS DOUBLE)/100 AS payment_amount,
          "PAYMENTMETHOD" AS payment_method,
          "STATUS" AS payment_status,
          "CREATED" AS payment_date
   FROM {{ source("stripe", "payment") }})

SELECT *
FROM payments