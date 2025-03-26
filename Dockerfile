

FROM apache/airflow:2.10.5-python3.12

USER root

RUN apt-get update && \
    apt-get install -y gcc python3-dev openjdk-17-jdk && \
    apt-get clean

# Set JAVA_HOME for OpenJDK 17 (Debian Bookworm default)
ENV JAVA_HOME /usr/lib/jvm/java-17-openjdk-amd64

USER airflow

RUN pip install apache-airflow apache-airflow-providers-apache-spark pyspark "apache-airflow-providers-openlineage>=1.8.0"
