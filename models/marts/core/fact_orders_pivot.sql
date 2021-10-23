{{
    config(
        materialized='view'
    )
}}

{%- set payment_methods = [
    'bank',
    'coupon',
    'bank_transfer',
    'gift_card']
-%}

WITH payments as (
    SELECT 
    * 
    FROM {{ ref("stg_payments")}}
)
SELECT 
ORDER_ID,
{%- for method in payment_methods %}
sum(CASE WHEN PAYMENT_METHOD = '{{ method }}' THEN PAYMENT_AMOUNT ELSE 0 END) AS {{ method }}_amount {%- if not loop.last -%},{%- endif -%}
{%- endfor %}
FROM payments
GROUP BY ORDER_ID
