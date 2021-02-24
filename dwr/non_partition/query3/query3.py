from dwr import *
from dwr.non_partition.query3 import *

# create result table
hiveql.execute(create_result_table.format(RESULT_TABLE))

logging.info("Full query")
hiveql.execute(query3.format(
    table_name=RESULT_TABLE,
))