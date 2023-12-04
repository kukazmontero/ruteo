FROM postgres:16

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        postgresql-16-postgis-3 \
        postgresql-16-pgrouting \
        gdal-bin \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY fibra_optica_detectada.* /docker-entrypoint-initdb.d/
COPY init.sql /docker-entrypoint-initdb.d/

ENV POSTGRES_DB fibra_o
ENV POSTGRES_USER user
ENV POSTGRES_PASSWORD password

EXPOSE 5432
