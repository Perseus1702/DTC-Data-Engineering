import os
import argparse
from time import time
import pandas as pd
from sqlalchemy import create_engine

""" 
    Main function that downloads a CSV file, accesses a PostgreSQL database, and dumps the data into the database in chunks.
    @param {Object} params - The parameters for the function.
    @param {string} params.user - The username for the PostgreSQL database.
    @param {string} params.password - The password for the PostgreSQL database.
    @param {string} params.host - The host address for the PostgreSQL database.
    @param {number} params.port - The port number for the PostgreSQL database.
    @param {string} params.db - The name of the PostgreSQL database.
    @param {string} params.table_name - The name of the table in the PostgreSQL database.
    @param {string} params.url - The URL of the CSV file to download.
    Using argparser library input is taken from terminal and passed to main function as parameters.
    CSV is downloaded by running a wget script using os library
"""

 
def main(params):
    user=params.user
    password=params.password
    host=params.host
    port=params.port
    db=params.db
    table_name=params.table_name
    url=params.url
    
    csv_name='output.csv'
    
    # Download CSV
    os.system((f"wget {url} -O {csv_name}"))
    
    # Accessing postgres database
    engine= create_engine(f"postgresql+psycopg2://{user}:{password}@{host}:{port}/{db}")

    # Preparing databse to dump data in chunks of 100000
    df_iter=pd.read_csv(csv_name,iterator=True,chunksize=100000)
    
    df=next(df_iter)
    
    # Changing datatype of columns from text to datetime
    df.lpep_pickup_datetime=pd.to_datetime(df.lpep_pickup_datetime)
    
    df.lpep_dropoff_datetime=pd.to_datetime(df.lpep_dropoff_datetime)

    df.head(n=0).to_sql(con=engine,name=table_name,if_exists='replace')

    # Dumping data to database
    df.to_sql(con=engine,name=table_name,if_exists='append')

    while True:
        t_start=time()
        df=next(df_iter)
        df.lpep_pickup_datetime=pd.to_datetime(df.lpep_pickup_datetime)
        df.lpep_dropoff_datetime=pd.to_datetime(df.lpep_dropoff_datetime)
        df.to_sql(con=engine,name=table_name,if_exists='append')
        t_end=time()
        print(f"Inserted data chunk. Time taken={t_end-t_start}")
        
    
if __name__=='__main__':
    
    parser = argparse.ArgumentParser(description='Ingest CSV to Postgres table.')
    parser.add_argument('user', help='Postgres username')
    parser.add_argument('password', help='Postgres password')
    parser.add_argument('host', help='Postgres host')
    parser.add_argument('port', help='Postgres port')
    parser.add_argument('db', help='Database name')
    parser.add_argument('table_name', help='Table name')
    parser.add_argument('url', help='URL of CSV')
    
    args = parser.parse_args()
    
    main(args)



