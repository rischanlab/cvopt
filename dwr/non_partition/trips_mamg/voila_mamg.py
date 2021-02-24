from dwr import *
from dwr.non_partition.trips_mamg import *

SAMPLE_TYPE = VOILA_CUBE

for sample_rate in sample_rates:
    logging.info("Sample rate: {0}".format(sample_rate))

    # create sampled table
    sample_table = cvopt_cube(
        sample_rate=sample_rate,
        table_name=INPUT_TABLE,
        group_by=GROUP_BY,
        aggregate_column=AGG,
        overwrite=True,
    )

    # ----------------------------------------------------------
    # The following section applies to all three sampling methods

    # create result table
    logging.info('create result table')
    sample_result_table = sample_table_name(RESULT_TABLE, SAMPLE_TYPE, sample_rate)
    drop_table(sample_result_table, DROP)
    hiveql.execute(create_result_table.format(sample_result_table))

    # run query over sampled table
    logging.info('run query over sampled table')
    hiveql.execute(mamg_s.format(
        input_table=sample_table,
        result_table=sample_table_name(RESULT_TABLE, SAMPLE_TYPE, sample_rate),
    ))

    # evaluate sample error
    sample_evaluate(
        table_name=RESULT_TABLE,
        sample_type=SAMPLE_TYPE,
        sample_rate=sample_rate,
        group_by_columns=GROUP_BY,
        aggregation_columns=['agg1', 'agg2'],
        weighted=True
    )
