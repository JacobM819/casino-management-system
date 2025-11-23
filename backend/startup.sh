#!/bin/bash

echo "Checking for DuckDB initialization..."

if [ ! -f "db/casino.duckdb" ]; then
    echo "Initializing database..."
    duckdb db/casino.duckdb < app/db/init.sql
    echo "Database initialized."
else
    echo "Existing database found."
fi

uvicorn app.main:app --host 0.0.0.0 --port 8000 --reload
