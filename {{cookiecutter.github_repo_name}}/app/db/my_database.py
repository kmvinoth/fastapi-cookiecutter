import os
import json
import boto3
from databases import Database


REGION = "eu-central-1"
client = boto3.client("secretsmanager", region_name=REGION)
response = client.get_secret_value(SecretId="<secret-name>") # use your secret name or arn <CHANGE ME>
secrets = json.loads(response['SecretString'])

# Access mysql db in aws
db_user = secrets['username']
db_password = secrets['password']
db_host = secrets['host']
db_port = "port"  # <CHANGE ME>
db_schema = "db_schema" # <CHANGE ME>

# RDS
database_url = (
    f"mysql+aiomysql://{db_user}:{db_password}@{db_host}:{db_port}/" f"{db_schema}"
)

# TODO: test/observe connection pooling
database = Database(database_url, min_size=2, max_size=5)
