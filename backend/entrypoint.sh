#!/bin/bash
set -e

echo "Starting Faculty App API..."

# Wait for database using Python
if [ -n "$DATABASE_URL" ]; then
    echo "Waiting for database (Python check)..."

    python << END
import time
import psycopg2
import os
from urllib.parse import urlparse

db_url = os.getenv("DATABASE_URL")

parsed = urlparse(db_url)

while True:
    try:
        conn = psycopg2.connect(
            dbname=parsed.path[1:],
            user=parsed.username,
            password=parsed.password,
            host=parsed.hostname,
            port=parsed.port or 5432
        )
        conn.close()
        print("Database is ready!")
        break
    except Exception as e:
        print("Database not ready, retrying...")
        time.sleep(1)
END

fi

# Run migrations
if [ -f "alembic.ini" ] && [ "$ENVIRONMENT" != "development" ]; then
    echo "Running database migrations..."
    alembic upgrade head
fi

# Start app
if [ "$ENVIRONMENT" = "development" ]; then
    echo "Starting in development mode..."
    exec uvicorn app.main:app --host 0.0.0.0 --port 8000 --reload
else
    echo "Starting in production mode..."
    exec gunicorn app.main:app \
        --workers 4 \
        --worker-class uvicorn.workers.UvicornWorker \
        --bind 0.0.0.0:8000
fi