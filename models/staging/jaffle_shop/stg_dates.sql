{{
    config(
        materialized='table'
    )
}}

{{ dbt_utils.date_spine("day", "cast ('2020-01-01' as date)", "cast ('2020-12-31' as date)") }}