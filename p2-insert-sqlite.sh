#!/bin/bash

OUTPUT_FILE="/opt/airflow/dags/opt/airflow/dags/output_data.csv"

# SQLite path
DATABASE="/opt/airflow/dags/database.db"

SQL_CREATE="CREATE TABLE IF NOT EXISTS total_sales (year INTEGER, payment_method TEXT, total_spent FLOAT);"

sqlite3 $DATABASE "$SQL_CREATE"


sqlite3 $DATABASE <<EOF
.mode tabs
.separator ","
.import $OUTPUT_FILE dsa_p1_dados
EOF
