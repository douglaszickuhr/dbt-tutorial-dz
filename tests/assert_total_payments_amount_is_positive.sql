-- Verify if sum of payments + returns are positive
SELECT 
    order_id,
    sum(PAYMENT_AMOUNT) as total_amount
FROM {{ref("stg_payments")}}
GROUP BY order_id
having total_amount < 0