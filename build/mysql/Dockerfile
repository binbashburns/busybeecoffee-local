FROM mysql:8.0.31
COPY busybee-db-rebuild.sql /docker-entrypoint-initdb.d/initdb.sql
USER root
RUN chmod 755 /var/lib/mysql