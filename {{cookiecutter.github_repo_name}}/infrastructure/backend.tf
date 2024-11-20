terraform {
  required_version = ">= 1.0.0"

  backend "s3" {
    region         = "eu-central-1"
    bucket         = "553336977060-terraform-state"
    key            = "travel-data-skyscannertool/terraform.tfstate" # <Change me>
    dynamodb_table = "553336977060-terraform-state"

    profile        = ""
    role_arn       = ""
    encrypt        = "true"
  }
}
