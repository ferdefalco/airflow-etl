#!/bin/bash

OUTPUT_FILE="/opt/airflow/dags/output_data.csv"

# SQLite path
DATABASE="/opt/airflow/dags/database.db"

SQL_CREATE="CREATE TABLE IF NOT EXISTS total_sales (year INTEGER, payment_method TEXT, total_spent FLOAT);"

sqlite3 $DATABASE "$SQL_CREATE"

sqlite3 $DATABASE <<EOF
.mode csv
.headers on
.import $OUTPUT_FILE total_sales
EOF
