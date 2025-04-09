import boto3
import pandas as pd
import pyarrow.parquet as pq
import io

s3 = boto3.client('s3')
bucket = "pmendhe-capstone-target"
orders_key = "transformed/ecommerce_orders_data/"
output_key = "report/by_payment_methods/PaymentMethod.csv"

def lambda_handler(event, context):
    # Read Parquet files from orders path
    orders_obj = s3.list_objects_v2(Bucket=bucket, Prefix=orders_key)

    orders = []
    for obj in orders_obj['Contents']:
        key = obj['Key']
        if key.endswith(".parquet"):
            body = s3.get_object(Bucket=bucket, Key=key)['Body'].read()
            orders.append(pq.read_table(io.BytesIO(body)).to_pandas())
    
    if not orders:
        raise Exception("No order parquet files found.")
    
    df_orders = pd.concat(orders)

    # Group by 
    result = df_orders.groupby("payment_method").size().reset_index(name="count_orders")

    # Save to CSV and upload to S3
    csv_buffer = io.StringIO()
    result.to_csv(csv_buffer, index=False)
    s3.put_object(Bucket=bucket, Key=output_key, Body=csv_buffer.getvalue())
