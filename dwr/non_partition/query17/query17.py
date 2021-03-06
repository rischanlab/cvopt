from dwr import *
from dwr.non_partition.query17 import *

# create result table
hiveql.execute(create_result_table.format(RESULT_TABLE))

logging.info("Full query")
hiveql.execute(query17.format(
    table_name=RESULT_TABLE,
))
