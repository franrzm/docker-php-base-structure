FROM postgres:16

COPY entrypoint-scripts/ /docker-entrypoint-initdb.d/

USER postgres

HEALTHCHECK --interval=3s --timeout=10s CMD pg_isready
