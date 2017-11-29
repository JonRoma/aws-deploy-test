http://docs.aws.amazon.com/lambda/latest/dg/serverless-deploy-wt.html

### Package the function

```
: typeset -x AWS_DEFAULT_REGION=us-east-2
: typeset -x AWS_PROFILE=roma-superuser-test
: aws cloudformation package \
   --template-file example.yaml \
   --output-template-file serverless-output.yaml \
   --s3-bucket as-aws-lambda-zip-us-east-2-224588347132

```
#### Notes from the [documentation](http://docs.aws.amazon.com/cli/latest/reference/cloudformation/package.html)

##### package

##### Description

Packages the local artifacts (local paths) that your AWS CloudFormation template references. The command uploads local artifacts, such as source code for an AWS Lambda function or a Swagger file for an AWS API Gateway REST API, to an S3 bucket. The command returns a copy of your template, replacing references to local artifacts with the S3 location where the command uploaded the artifacts.

Use this command to quickly upload local artifacts that might be required by your template. After you package your template's artifacts, run the deploy command to deploy the returned template.

This command can upload local artifacts specified by following properties of a resource:

* BodyS3Location property for the AWS::ApiGateway::RestApi resource
* Code property for the AWS::Lambda::Function resource
* CodeUri property for the AWS::Serverless::Function resource
* DefinitionUri property for the AWS::Serverless::Api resource
* SourceBundle property for the AWS::ElasticBeanstalk::ApplicationVersion resource
* TemplateURL property for the AWS::CloudFormation::Stack resource

To specify a local artifact in your template, specify a path to a local file or folder, as either an absolute or relative path. The relative path is a location that is relative to your template's location.

For example, if your AWS Lambda function source code is in the `/home/user/code/lambdafunction/` folder, specify `CodeUri: /home/user/code/lambdafunction` for the AWS::Serverless::Function resource. The command returns a template and replaces the local path with the S3 location: CodeUri: s3://mybucket/lambdafunction.zip.

If you specify a file, the command directly uploads it to the S3 bucket. If you specify a folder, the command zips the folder and then uploads the .zip file. For most resources, if you don't specify a path, the command zips and uploads the current working directory. The exception is AWS::ApiGateway::RestApi; if you don't specify a BodyS3Location, this command will not upload an artifact to S3.

Before the command uploads artifacts, it checks if the artifacts are already present in the S3 bucket to prevent unnecessary uploads. The command uses MD5 checksums to compare files. If the values match, the command doesn't upload the artifacts. Use the --force flag to skip this check and always upload the artifacts.

### Deploy the function

```
: aws cloudformation deploy \
   --template-file serverless-output.yaml \
   --stack-name roma-example-stack \
   --capabilities CAPABILITY_IAM
```


