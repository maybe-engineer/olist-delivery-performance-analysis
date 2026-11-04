USE olist;
SELECT 'orders' AS tabela, COUNT(*) AS wiersze FROM dbo.orders
UNION ALL SELECT 'order_items', COUNT(*) FROM dbo.order_items
UNION ALL SELECT 'order_payments', COUNT(*) FROM dbo.order_payments
UNION ALL SELECT 'order_reviews', COUNT(*) FROM dbo.order_reviews
UNION ALL SELECT 'customers', COUNT(*) FROM dbo.customers
UNION ALL SELECT 'sellers', COUNT(*) FROM dbo.sellers
UNION ALL SELECT 'products', COUNT(*) FROM dbo.products
UNION ALL SELECT 'geolocation', COUNT(*) FROM dbo.geolocation
UNION ALL SELECT 'category_translation', COUNT(*) FROM
dbo.category_translation;