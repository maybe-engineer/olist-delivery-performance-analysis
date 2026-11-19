USE olist;
GO

IF OBJECT_ID('dbo.sample_orders') IS NOT NULL DROP TABLE dbo.sample_orders;
SELECT TOP (5000) *
INTO dbo.sample_orders
FROM dbo.orders
ORDER BY CHECKSUM(order_id);

IF OBJECT_ID('dbo.sample_customers') IS NOT NULL DROP TABLE
dbo.sample_customers;
SELECT c.*
INTO dbo.sample_customers
FROM dbo.customers c
WHERE c.customer_id IN (SELECT customer_id FROM dbo.sample_orders);

SELECT (SELECT COUNT(*) FROM dbo.sample_orders) AS zamowienia,
        (SELECT COUNT(*) FROM dbo.sample_customers) AS klienci;
