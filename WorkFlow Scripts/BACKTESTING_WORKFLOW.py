# The Snowpark package is required for Python Worksheets.
# You can add more packages by selecting them using the Packages control and then importing them.

import snowflake.snowpark as snowpark
from snowflake.snowpark.functions import col
from snowflake.snowpark.functions import col, sum as sf_sum, when
from snowflake.snowpark.window import Window


def main(session: snowpark.Session):

 # Step 1: Load Features
    features_df = session.table("FIRSTDB.PUBLIC.FEATURES_PER_INTERVAL")

    # Step 2: Generate Signals
    features_signals_df = features_df.with_column(
        "SIGNAL",
        when((col("AVG_SENTIMENT") > 0.2) & (col("RETURN") > 0), 1)
        .when((col("AVG_SENTIMENT") < -0.2) | (col("RETURN") < 0), -1)
        .otherwise(0)
    )

    # Step 3: Compute Position and Strategy P&L
    window_spec = Window.partition_by("SYMBOL").order_by("INTERVAL_TS").rows_between(Window.UNBOUNDED_PRECEDING, Window.CURRENT_ROW)
    features_position_df = features_signals_df.with_column(
        "POSITION",
        sf_sum(col("SIGNAL")).over(window_spec)
    ).with_column(
        "STRATEGY_PNL",
        col("POSITION") * col("RETURN")
    )

    # Step 4: Compute Cumulative P&L
    features_backtest_df = features_position_df.with_column(
        "CUMULATIVE_PNL",
        sf_sum(col("STRATEGY_PNL")).over(window_spec)
    )

    # Step 5: Save results to Snowflake table (append mode)
    features_backtest_df.write.save_as_table("FIRSTDB.PUBLIC.BACKTEST_RESULTS", mode="append")

    # Optional: show some sample rows
    features_backtest_df.show(10)

    return features_backtest_df