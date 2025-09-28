-- Description: Insert data into STOCK_META table from STOCK_PRICES_RAW table

insert into FIRSTDB.PUBLIC.STOCK_META (SYMBOL, LAST_REFRESHED, INTERVAL, OUTPUT_SIZE, TIMEZONE)
select
    f.value:"json":"data":"my_field_1":"2. Symbol"::string,
        to_timestamp_ntz(f.value:"json":"data":"my_field_1":"3. Last Refreshed"::string),
    f.value:"json":"data":"my_field_1":"4. Interval"::string,
        f.value:"json":"data":"my_field_1":"5. Output Size"::string,
        f.value:"json":"data":"my_field_1":"6. Time Zone"::string
from FIRSTDB.PUBLIC.STOCK_PRICES_RAW r,
     lateral flatten(input => r.API_RESPONSE) f
where r.SYMBOL = 'AAPL'
order by r.LOAD_TS desc
    limit 2;
