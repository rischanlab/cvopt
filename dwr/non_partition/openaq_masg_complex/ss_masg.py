from dwr.CSRLSS import *
from dwr.non_partition.openaq_masg_complex import *

SAMPLE_TYPE = SS

logging.info("get statistics")

# language=HQL
hiveql.execute("""
    SELECT
        COUNT(*),
        SUM(value)
    FROM {input_table}
""".format(input_table=INPUT_TABLE))
result = hiveql.fetchone()
total = result[0]
sum_value = result[1]


for sample_rate in sample_rates:

    logging.info("Sample rate: {0}".format(sample_rate))

    # create sampled table
    sample_input_table = ss_sample(
        sample_rate=sample_rate,
        table_name=INPUT_TABLE,
        aggregate_column='value',
        total=total,
        sum_value=sum_value,
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
    hiveql.execute(masg_ss.format(
        input_table=sample_input_table,
        result_table=sample_table_name(RESULT_TABLE, SAMPLE_TYPE, sample_rate),
    ))

    # evaluate sample error
    sample_evaluate(
        table_name=RESULT_TABLE,
        sample_type=SAMPLE_TYPE,
        sample_rate=sample_rate,
        group_by_columns=['country'],
        aggregation_columns=['avg_incre', 'cnt_incre'],
        weighted=True
    )
