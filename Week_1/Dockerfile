FROM python:3.12.1

RUN apt-get install wget

RUN pip install pandas SQLAlchemy psycopg2

WORKDIR /app

COPY ingest_data.py ingest_data.py

ENTRYPOINT ["python", "ingest_data.py" ]
