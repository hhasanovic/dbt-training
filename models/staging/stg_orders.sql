select 
--from raw orders
o.ORDERID, 
o.ORDERDATE,
o.SHIPDATE,
o.SHIPMODE, 
o.ORDERSELLINGPRICE - o.ORDERCOSTPRICE AS ORDERPROFIT,
o.ORDERCOSTPRICE,
o.ORDERSELLINGPRICE,
--from raw customers
c.CUSTOMERID,
c.CUSTOMERNAME,
c.SEGMENT,
c.COUNTRY,
--from raw products
p.PRODUCTID,
p.CATEGORY,
p.PRODUCTNAME,
p.SUBCATEGORY,
{{ markup('ordersellingprice', 'ordercostprice') }} AS markup
FROM {{ ref('raw_orders') }} AS o
LEFT JOIN {{ ref('raw_customers') }} AS c ON o.CUSTOMERID = c.CUSTOMERID
LEFT JOIN {{ ref('raw_products') }} AS p ON o.PRODUCTID = p.PRODUCTID