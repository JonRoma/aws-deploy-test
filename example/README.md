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

```
```
: aws cloudformation deploy \
   --template-file serverless-output.yaml \
   --stack-name roma-example-stack \
   --capabilities CAPABILITY_IAM
```
