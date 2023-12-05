#!/bin/bash

# Ajusta la ruta al Shapefile según tu estructura de archivos
#shp2pgsql -I -s 4326 -W "latin1" /path/to/data/fibra_optica_detectada.shp shape | psql -U user -d dbname