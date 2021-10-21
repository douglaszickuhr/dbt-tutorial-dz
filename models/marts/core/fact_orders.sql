with payments as (
    SELECT
    order_id,
    SUM(payment_amount) as payment_amount
    FROM
    {{ ref("stg_payments") }}
    WHERE payment_status = 'success'
    GROUP BY order_id
),
orders_payments as (
    SELECT 
    order_id,
    customer_id,
    coalesce(payment_amount, 0) AS amount
    FROM 
    {{ ref("stg_orders") }}
    LEFT JOIN payments USING (order_id)
)

SELECT * FROM orders_payments