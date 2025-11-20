FROM mysql:8.0

# Copy initialization script
COPY init-database.sql /docker-entrypoint-initdb.d/

# Set proper permissions
RUN chmod 644 /docker-entrypoint-initdb.d/init-database.sql
