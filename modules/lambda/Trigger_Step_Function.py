import boto3
import json

step_function_arn = 'arn:aws:states:us-east-1:260073349210:stateMachine:pmendhe_CAPStone_stepfunction'
client = boto3.client('stepfunctions')

def lambda_handler(event, context):
    
    print("Received event:", json.dumps(event))

    # Start execution
    response = client.start_execution(
        stateMachineArn=step_function_arn,
        input=json.dumps(event)  
    )
    
    print("Step Function Triggered:", response)
    return {
        'statusCode': 200,
        'body': json.dumps('Step Function triggered Successfully!')
    }
