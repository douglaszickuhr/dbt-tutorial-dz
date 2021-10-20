with payments as (
    SELECT
    "ORDERID" as order_id,
    cast(SUM("AMOUNT") as double)/100 as payment_amount
    FROM raw.STRIPE.PAYMENT
    WHERE STATUS = 'success'
    GROUP BY order_id
)

select * from payments