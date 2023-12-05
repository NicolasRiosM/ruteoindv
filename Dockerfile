FROM postgres:14.1

# Actualiza el sistema e instala la extensión PostGIS y gdal-bin
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       postgis postgresql-14-postgis-3 gdal-bin \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       postgresql-14-pgrouting
# Configura la base de datos y copia el script de inicialización
ENV POSTGRES_DB=dbname \
    POSTGRES_USER=postgres \
    POSTGRES_PASSWORD=pass
COPY ./db/init.sql /docker-entrypoint-initdb.d/

# Exponer el puerto de PostgreSQL
EXPOSE 5432

# Comando por defecto para iniciar el servidor PostgreSQL
CMD ["postgres"]