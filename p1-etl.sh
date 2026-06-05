#!/bin/bash

echo "-------------- ETL process --------------"

# NR = current line number
# NF = number of field in current line
# This command will transform all fields in lowercase, then filter only Food Category, then sum the Total Spent by year and Payment Method
awk -F',' '
NR==1 { next }  

{
    for(i=1;i<=NF;i++)
        $i=tolower($i)

    if($3!="food")
        next

    split($8,d,"/")
    year=d[3]

    if(year<=2023)
        next

    sum[year","$6] += $5
}
END{
    print "year,payment_method,total_spent"

    for(k in sum)
        printf "%s,%.2f\n", k, sum[k]
}
' /opt/airflow/dags/input_data.csv | sort -t',' -k1,1n -k2,2 > /opt/airflow/dags/output_data.csv

# Compresses the output_data.csv file into a tar.gz file called p1-output.tar.gz, storing it in the /opt/airflow/dags directory

tar -czvf /opt/airflow/dags/dsa-p1-log.tar.gz /opt/airflow/dags/output_data.csv
