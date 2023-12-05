CREATE EXTENSION IF NOT EXISTS postgis;

-- Eliminar la tabla si existe
DROP TABLE IF EXISTS shap;

-- Crear la tabla
CREATE TABLE IF NOT EXISTS shap (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255),
    probabilidad_falla FLOAT DEFAULT 0,
    geom GEOMETRY(LINESTRING, 4326) -- Ajustar el tipo de geometría según corresponda
);

-- Agregar la columna para la probabilidad de falla si no existe
DO $$ 
BEGIN
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'shap' AND column_name = 'probabilidad_falla') THEN
    ALTER TABLE shap ADD COLUMN probabilidad_falla FLOAT DEFAULT 0;
  END IF;
END $$;


--\! shp2pgsql -I -s 4326 -W "latin1" /path/to/data/fibra_optica_detectada.shp shap | psql -U postgres -d dbname

