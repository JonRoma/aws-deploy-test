```
aws cloudformation package --template-file cloudformation/foo.yaml \
	--s3-bucket as-aws-lambda-zip-us-east-2-224588347132 \
	--s3-prefix foo --output-template-file output.yaml
```

```
aws cloudformation deploy \
	--template-file /Users/roma/Documents/Git/Develop/aws-deploy-test/output.yaml \
	--stack-name roma-foo --capabilities CAPABILITY_IAM
```