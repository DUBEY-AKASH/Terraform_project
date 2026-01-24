terraform {
    backend "s3" {
      bucket = "terraformstateemo"
      key = "ec2-demo/terrform.tfstate"
      region = "eu-north-1"
      dynamodb_table = "terraform-locks"
      encrypt = true
    }
