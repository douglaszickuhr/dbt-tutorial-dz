-- Verifiy if customers who have 0 orders do not have values on the following columns

SELECT 
    *
FROM 
{{ ref("dim_customer")}}
WHERE NUMBER_OF_ORDERS < 1
AND (FIRST_ORDER_DATE IS NOT NULL OR MOST_RECENT_ORDER_DATE IS NOT NULL OR NUMBER_OF_ORDERS > 0 OR LIFETIME_VALUE > 0)