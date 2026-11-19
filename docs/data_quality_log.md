| Tabela | Skala | Problem | Jak sprawdzono | Decyzja |
|---|---|---|---|---|
| orders | 8 wierszy | Status 'delivered', lecz brak daty dostawy lub nadania | `WHERE order_status = 'delivered' AND order_delivered_customer_date IS NULL` | Wykluczyć z analizy czasu dostawy. Zostawić w ogólnej analizie liczby zamówień |

| orders | 6 wierszy | Status 'canceled', i jednocześnie jest data dostawy | `WHERE order_status = 'canceled' AND order_delivered_customer_date IS NOT NULL` | Wykluczyć z analizy czasu dostawy. Zostawić w ogólnej analizie liczby zamówień |

| orders | 1359 wierszy | Data nadania wcześniejsza niż data zatwierdzenia płatności | ` WHERE order_approved_at > order_delivered_carrier_date` | Zostawić w tabeli zamówień, oznaczyć i uwzględnić jako ryzyko zaniżenia średniej w analizie etapu przekazania (do wyjaśnienia ze źródłem danych) |

| orders | 360 wierszy | Czas dostawy dłuższy o ponad 30 dni od zakładanego czasu dostawy | `WHERE order_delivered_customer_date > DATEADD(day, 30, order_estimated_delivery_date) AND order_status = 'delivered'` |Zostawić (realne opóźnienia, nie błąd danych), w raportowaniu pokazywać średnią razem z medianą i P90, aby ograniczyć wpływ skrajnych wartości | 
