FROM python:3.12

RUN pip install pandas

WORKDIR /app

COPY data_pipeline.py pipeline.py

ENTRYPOINT ["bash"]
