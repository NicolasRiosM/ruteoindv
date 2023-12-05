FROM postgres:14.1
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       postgis postgresql-14-postgis-3 gdal-bin \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       postgresql-14-pgrouting
ENV POSTGRES_DB=dbname \
    POSTGRES_USER=postgres \
    POSTGRES_PASSWORD=pass
COPY ./db/init.sql /docker-entrypoint-initdb.d/
EXPOSE 5432
CMD ["postgres"]
