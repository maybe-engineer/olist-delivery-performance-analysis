| orders | 8 wierszy | Status 'delivered', lecz brak daty dostawy lub nadania | `WHERE order_status = 'delivered' AND order_delivered_customer_date IS NULL` | Wykluczyć z analizy czasu dostawy. Zostawić w ogólnej analizie liczby zamówień

| orders | 6 wierszy | Status 'canceled', i jednocześnie jest data dostawy | `WHERE order_status = 'canceled' AND order_delivered_customer_date IS NOT NULL` | Wykluczyć z analizy czasu dostawy. Zostawić w ogólnej analizie liczby zamówień
