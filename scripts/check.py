import boto3
print("If the login is succesful, you will find the bucket list here:")
# Create session and list buckets
my_session = boto3.session.Session()
s3 = my_session.resource('s3')
for bucket in s3.buckets.all():
    print(bucket.name)