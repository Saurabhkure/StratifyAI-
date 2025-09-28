-- Description: Insert a new record into STOCK_PRICES_RAW table with JSON data

INSERT INTO FIRSTDB.PUBLIC.STOCK_PRICES_RAW (SYMBOL, API_RESPONSE)
SELECT
    'AAPL',
    PARSE_JSON('{{ $json.myNewKey.replace(/'/g,"''") }}');