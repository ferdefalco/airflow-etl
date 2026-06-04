# -- Project  - Extraction, Transformation, and Loading Pipeline with Apache Airflow

from airflow import DAG
from airflow.operators.bash_operator import BashOperator
from airflow.utils.dates import days_ago
from datetime import timedelta

default_args = {
    'owner': 'FD',              
    'start_date': days_ago(0),                      
    'retries': 3,                                   
    'retry_delay': timedelta(minutes=1),            
}

etl_dag = DAG(
    'etl_project',                                 
    default_args=default_args,                     
    description='ETL pipeline',                      
    schedule_interval='30 10 * * *',               
    tags= ['etl'])

etl = BashOperator(
    task_id="first_step_et",                  
    bash_command="./p1-etl.sh",                
    dag=etl_dag,                                   
)

insert_sqlite = BashOperator(
    task_id="second_step_insert_sqlite",                      
    bash_command="./p2-insert-sqlite.sh",      
    dag=etl_dag,                                  
)

etl >> insert_sqlite


