# airflow-etl

# ETL Pipeline with Apache Airflow

## Overview

This project implements an ETL (Extract, Transform, Load) pipeline orchestrated with Apache Airflow. The pipeline automates the process of extracting raw retail sales data, applying data transformations and cleaning operations, and loading the processed data into a SQLite database for further analysis and reporting.

The workflow is scheduled and managed through an Airflow DAG.

## Data Source

The input dataset used in this project comes from Kaggle:

Retail Store Sales (Dirty Dataset for Data Cleaning)
https://www.kaggle.com/datasets/ahmedmohamed2003/retail-store-sales-dirty-for-data-cleaning?resource=download

## Pipeline Architecture

The Airflow DAG consists of two sequential tasks: 
   first_step_et (Extraction and Transformation)
        ↓
second_step_insert_sqlite (Loading in SQLite)
