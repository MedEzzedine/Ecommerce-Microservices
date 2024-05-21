FROM postgres:14.7
COPY ./ecomm.sql /docker-entrypoint-initdb.d/ecomm.sql
COPY ./install-pgcrypto.sh /docker-entrypoint-initdb.d/
RUN chown -R postgres:postgres /docker-entrypoint-initdb.d/
