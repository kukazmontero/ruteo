CREATE EXTENSION IF NOT EXISTS postgis;
CREATE EXTENSION IF NOT EXISTS pgrouting;

CREATE TABLE IF NOT EXISTS fibra_optica (
    id SERIAL PRIMARY KEY,
    probabilidad DOUBLE PRECISION DEFAULT 0,
    geom GEOMETRY(LineString, 4326)
);

CREATE INDEX idx_fibra_optica_geom ON fibra_optica USING GIST (geom);

GRANT ALL PRIVILEGES ON TABLE fibra_optica TO "user";

