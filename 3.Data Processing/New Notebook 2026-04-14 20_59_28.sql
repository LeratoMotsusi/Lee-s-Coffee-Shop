-- Databricks notebook source
SELECT 
        transaction_id,
        transaction_date,
        transaction_time,
        transaction_qty,
        store_id,
        store_location,
        product_id,
        unit_price,
        product_category,
        product_type,
        product_detail,
---Adding columns to enhance the table for better insights
---New column added 1
        Dayname(transaction_date) AS Day_name,
---New column added 2
        Monthname(transaction_date) AS Month_name,
---New column added 3
        Dayofmonth(transaction_date) AS Date_of_month,
---New column added 4 - Determing weekday/weekend
    CASE
        WHEN Dayname(transaction_date) IN ('Sun','Sat') THEN 'Weekend'
        ELSE 'Weekday'
    END AS Day_classification,    
---New column added 5 - Time buckets
CASE
        WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '05:00:00' AND '08:59:59' THEN '01.Rush Hour'
        WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '09:00:00' AND '11:59:59' THEN '02.Mid Morning'
        WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '12:00:00' AND '15:59:59' THEN '03.Afternoon'
        WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '16:00:00' AND '18:00:00' THEN '04.Rush Hour'
        ELSE '05.Night'
    END AS Time_classification,
---New column added 6 - Spend buckets
CASE
        WHEN (transaction_qty*unit_price) <=50 THEN '01.Low Spender'
        WHEN (transaction_qty*unit_price) BETWEEN 51 AND 200 THEN '02.Medium Spender'
        WHEN (transaction_qty*unit_price) BETWEEN 201 AND 300 THEN '03. Moreki'
        ELSE '04.Blesser'
    END AS Spend_bucket,
---New column added 7 - Revenue
    transaction_qty*unit_price AS Revenue
    FROM brightcoffeeshop.default.bcshop;

