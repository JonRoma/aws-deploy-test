http://docs.aws.amazon.com/lambda/latest/dg/serverless-deploy-wt.html

```
: typeset -x AWS_DEFAULT_REGION=us-east-2
: typeset -x AWS_PROFILE=roma-superuser-test
```

```
: aws cloudformation package \
   --template-file example.yaml \
   --output-template-file serverless-output.yaml \
   --s3-bucket as-aws-lambda-zip-us-east-2-224588347132
Uploading to 2a0681b6f581a8a0351ac6ffa85b81f3  13086052 / 13086052.0  (100.00%)
Successfully packaged artifacts and wrote output template to file serverless-output.yaml.
Execute the following command to deploy the packaged template
aws cloudformation deploy --template-file /Users/roma/Documents/Git/Develop/aws-deploy-test/example/serverless-output.yaml --stack-name <YOUR STACK NAME>
```
