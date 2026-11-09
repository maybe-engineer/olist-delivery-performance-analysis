# Analiza terminowości dostaw w e-commerce (Olist)
Analiza ok. 100 tys. zamówień z brazylijskiego marketplace Olist (2016–2018):
jak często dostawy są spóźnione, gdzie w procesie tracimy czas i jak
opóźnienia wpływają na zadowolenie klientów.

> **Status:** w toku. 
Zrobione: środowisko, import danych, schemat. W
kolejnych blokach: czyszczenie, analiza SQL, dashboard Power BI.

## Problem biznesowy
W e-commerce obietnica dostawy to część produktu. Spóźnione paczki obniżają
oceny, zwiększają liczbę reklamacji i ryzyko utraty klienta. Celem projektu
jest wskazanie, **gdzie** (etap procesu, region, kategoria, sprzedawca)
powstają opóźnienia i **co** zespół logistyki powinien zrobić w pierwszej
kolejności. Szczególnie skupię się na przekazaniu paczki przewoźnikowi.

## Kluczowe wnioski
TBD (uzupełnię po analizie).


## Dane
- **Źródło:** [Brazilian E-Commerce Public Dataset by Olist (Kaggle)]
(https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
- **Zakres:** 99 441 zamówień, 9 tabel, lata 2016–2018
- **Licencja:** CC BY-NC-SA 4.0 (użycie niekomercyjne, na tej samej
licencji). Dane **nie są** częścią repozytorium.
- **Jak pobrać:** zobacz [data/README.md](data/README.md)
Schemat relacji: [docs/schema.md](docs/schema.md)

## Pytania analityczne i hipotezy
| # | Pytanie | Hipoteza |
|---|---|---|
| 1 | Jaki odsetek zamówień dostarczono po terminie i jak to się zmienia w czasie? | Opóźnienia rosną w szczycie sprzedaży |
| 2 | Który etap procesu najbardziej wydłuża dostawę? | Największy udział ma transport, największą zmienność przekazanie paczki |
| 3 | Jak opóźnienie wpływa na ocenę klienta? | Opóźnione zamówienia mają wyraźnie niższe oceny |
| 4 | W których stanach i kategoriach opóźnienia są największe? | Odległe stany mają więcej opóźnień |
| 5 | Czy mała grupa sprzedawców generuje większość opóźnień? | Tak (zasada Pareto) |

## Definicje metryk
- **Dostarczone:** `order_status = 'delivered'` i niepusta data dostawy
- **Opóźnione:** data dostawy późniejsza niż obiecana
- **Czas dostawy:** dni od zakupu do dostawy

## Narzędzia
SQL Server (T-SQL), SSMS, Power BI Desktop, Excel (Power Query), Git/GitHub.
Python (Jupyter) – opcjonalnie w dalszych blokach.

## Struktura repozytorium
```text
├── data/
 # instrukcja pobrania (bez danych)
├── docs/
 # schemat, dziennik jakości danych
├── sql/
 # skrypty SQL w kolejności wykonywania
└── reports/
 # dashboard, zrzuty ekranu
```

## Jak odtworzyć analizę
1. Pobierz dane zgodnie z `data/README.md`.
2. Utwórz bazę i załaduj tabele (`sql/00_create_database.sql`, import CSV).
3. Uruchom skrypty z folderu `sql/` w kolejności numerów.

## Dziennik jakości danych
Zobacz [docs/data_quality_log.md](docs/data_quality_log.md).

## Plan
- [x] Blok 0: środowisko, repo, schemat, szkic README
- [ ] Blok 1: czyszczenie i walidacja danych
- [ ] Blok 2: analiza w SQL
- [ ] Blok 3: dashboard Power BI
- [ ] Blok 4: rekomendacje i podsumowanie
