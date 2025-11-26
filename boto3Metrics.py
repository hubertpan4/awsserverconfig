import boto3 
from botocore.client import Config 

config = Config(use_dualstack_endpoint=True)
cloudwatch = boto3.client('cloudwatch', region_name='us-east-2', config=config)

response = cloudwatch.put_metric_data(
    Namespace='MyApp/Metrics',
    MetricData=[
        {
            'MetricName': 'TestMetric',
            'Dimensions': [
                {
                    'Name': 'Environment',
                    'Value': 'Development'
                }
            ],
            'Unit': 'Count',
            'Value': 1
        }
    ]
)
print(f"Response from cloudwatch: {response}")