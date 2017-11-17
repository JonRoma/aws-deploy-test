resource "aws_codepipeline" "foo" {
  name = "roma-lambda-deploy"

  # role_arn = "${aws_iam_role.foo.arn}"
  role_arn = "arn:aws:iam::224588347132:role/AWS-CodePipeline-Service"

  artifact_store {
    # TODO: Where is this bucket created?
    # location = "${aws_s3_bucket.foo.bucket}"
    location = "codepipeline-us-east-2-224588347132"
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "S3"
      run_order        = "1"
      output_artifacts = ["MyApp"]
      version          = "1"

      configuration {
        S3Bucket             = "as-aws-lambda-zip-us-east-2-224588347132"
        S3ObjectKey          = "foo/foo.zip"
        PollForSourceChanges = "true"
      }
    }
  }

  stage {
    name = "Staging"

    action {
      name      = "Approval"
      category  = "Approval"
      owner     = "AWS"
      provider  = "Manual"
      run_order = "1"
      version   = "1"
    }

    action {
      name            = "Deploy"
      category        = "Deploy"
      input_artifacts = ["MyApp"]
      owner           = "AWS"
      provider        = "CloudFormation"
      run_order       = "2"
      version         = "1"

      configuration {
        ActionMode   = "CREATE_UPDATE"
        Capabilities = "CAPABILITY_IAM"
        RoleArn      = "arn:aws:iam::224588347132:role/roma-codepipeline-lambda"
        StackName    = "roma-foo"

        # TODO: What are these files?
        TemplateConfiguration = "MyApp::configuration.json"

        # TODO: What are these files?
        TemplatePath = "MyApp::template.json"
      }
    }
  }
}
