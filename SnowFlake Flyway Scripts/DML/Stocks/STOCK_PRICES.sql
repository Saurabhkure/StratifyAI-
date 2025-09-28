-- Description: Insert data into STOCK_PRICES table from STOCK_PRICES_RAW table

insert into FIRSTDB.PUBLIC.STOCK_PRICES (SYMBOL, TS, OPEN, HIGH, LOW, CLOSE, VOLUME)
select
    f.value:"json":"data":"my_field_1":"2. Symbol"::string as SYMBOL,
        to_timestamp_ltz(k.key) as TS,
    k.value:"1. open"::float   as OPEN,
    k.value:"2. high"::float   as HIGH,
    k.value:"3. low"::float    as LOW,
    k.value:"4. close"::float  as CLOSE,
    k.value:"5. volume"::float as VOLUME
from FIRSTDB.PUBLIC.STOCK_PRICES_RAW r,
    lateral flatten(input => r.API_RESPONSE) f,                  -- unwrap outer array
    lateral flatten(input => f.value:"json":"data":"my_field_2") k -- unwrap timestamps
order by TS;