#!/bin/bash

# Inicia PostgreSQL
docker-entrypoint.sh postgres &

# Espera a que PostgreSQL esté en funcionamiento
while ! pg_isready -q -h localhost -p 5432 -U postgres
do
  sleep 5
done

/usr/local/bin/load_shapefile.sh

tail -f /dev/null
