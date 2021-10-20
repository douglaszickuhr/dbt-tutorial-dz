with orders_payments as 
(SELECT 
order_id,
customer_id,
payment_amount AS amount
FROM 
{{ref("stg_orders")}}
JOIN {{ref("stg_payments")}} USING (order_id))

select * from orders_payments