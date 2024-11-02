import subprocess
import time
import logging
from datetime import datetime, timedelta
from dbt.cli.main import dbtRunner, dbtRunnerResult

# Set up logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

def run_dbt():
    try:
        # initialize
        dbt = dbtRunner()

        # create CLI args as a list of strings
        cli_args = ["run", "--profiles-dir", "./"]

        # run the command
        res: dbtRunnerResult = dbt.invoke(cli_args)

        # inspect the results
        for r in res.result:
            print(f"{r.node.name}: {r.status}")
    except subprocess.CalledProcessError as e:
        logging.error("DBT run failed with error:\n%s", e.stderr)

def time_until_midnight():
    now = datetime.now()
    # Calculate the next midnight
    next_midnight = (now + timedelta(days=1)).replace(hour=0, minute=0, second=0, microsecond=0)
    return next_midnight

if __name__ == "__main__":
    while True:
        # Wait until midnight
        seconds_until_midnight = time_until_midnight()
        logging.info("Waiting %s seconds until the next midnight.", seconds_until_midnight)
        time.sleep(seconds_until_midnight)
        
        # Run dbt job at midnight
        logging.info("Running dbt job at midnight.")
        run_dbt()
