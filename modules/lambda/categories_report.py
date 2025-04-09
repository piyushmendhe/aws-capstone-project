import boto3
import pandas as pd
import pyarrow.parquet as pq
import io

s3 = boto3.client('s3')
bucket = "pmendhe-capstone-target"
customer_key = "transformed/ecommerce_customer_data/"
orders_key = "transformed/ecommerce_orders_data/"
output_key = "report/by_categories/Category_report.csv"

def lambda_handler(event, context):
    # Read Parquet
    customer_obj = s3.list_objects_v2(Bucket=bucket, Prefix=customer_key)
    orders_obj = s3.list_objects_v2(Bucket=bucket, Prefix=orders_key)

    customers = []
    for obj in customer_obj['Contents']:
        body = s3.get_object(Bucket=bucket, Key=obj['Key'])['Body'].read()
        customers.append(pq.read_table(io.BytesIO(body)).to_pandas())
    df_customers = pd.concat(customers)

    orders = []
    for obj in orders_obj['Contents']:
        body = s3.get_object(Bucket=bucket, Key=obj['Key'])['Body'].read()
        orders.append(pq.read_table(io.BytesIO(body)).to_pandas())
    df_orders = pd.concat(orders)

    # Join + Aggregate
    merged = df_customers.merge(df_orders, on="customer_id")
    result = merged.groupby("product_category")["product_price"].sum().reset_index()
    result.columns = ["category", "total_spent"]

    # Save to S3
    csv_buffer = io.StringIO()
    result.to_csv(csv_buffer, index=False)
    s3.put_object(Bucket=bucket, Key=output_key, Body=csv_buffer.getvalue())
