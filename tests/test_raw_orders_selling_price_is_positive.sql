with orders as (
    SELECT *
    FROM {{ ref('raw_orders') }}
)
SELECT ORDERID,
       SUM(ORDERSELLINGPRICE) AS total_sp
FROM ORDERS
GROUP BY ORDERID
HAVING total_sp<0