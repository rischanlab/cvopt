from dwr.CSRLSS import *
from dwr.non_partition.openaq_masg_complex_time import *

SAMPLE_TYPE = CS


def run():

    logging.info("get frequency of strata")
    t1 = time.time()  # ---------------------------------------
    # language=HQL
    hiveql.execute("""
        SELECT 
            country || "_" || parameter,
            COUNT(*)
        FROM openaq_clean
        GROUP BY country, parameter
    """)
    frequency = {r[0]: r[1] for r in hiveql.fetchall()}
    t2 = time.time()  # ---------------------------------------
    time_export("X", SAMPLE_TYPE, "Statistics", t2-t1)

    for sample_rate in sample_rates:
        logging.info("Sample rate: {0}".format(sample_rate))

        t1 = time.time()  # ---------------------------------------
        # create sampled table
        sample_input_table = cs_sample(
            sample_rate=sample_rate,
            table_name=INPUT_TABLE,
            group_by=['country', 'parameter'],
            frequency=frequency,
            overwrite=True
        )
        t2 = time.time()  # ---------------------------------------
        time_export(sample_rate, SAMPLE_TYPE, "Draw Sample", t2 - t1)

        # ----------------------------------------------------------
        # The following section applies to all three sampling methods

        # create result table
        logging.info('create result table')
        sample_result_table = sample_table_name(RESULT_TABLE, SAMPLE_TYPE, sample_rate)
        drop_table(sample_result_table, DROP)
        hiveql.execute(create_result_table.format(sample_result_table))

        t1 = time.time()  # ---------------------------------------
        # run query over sampled table
        logging.info('run query over sampled table')
        hiveql.execute(masg_sampled.format(
            input_table=sample_input_table,
            result_table=sample_table_name(RESULT_TABLE, SAMPLE_TYPE, sample_rate),
        ))
        t2 = time.time()  # ---------------------------------------
        time_export(sample_rate, SAMPLE_TYPE, "Query", t2 - t1)

        # # evaluate sample error
        # sample_evaluate(
        #     table_name=RESULT_TABLE,
        #     sample_type=SAMPLE_TYPE,
        #     sample_rate=sample_rate,
        #     group_by_columns=['country'],
        #     aggregation_columns=['avg_incre', 'cnt_incre'],
        #     weighted=True
        # )
