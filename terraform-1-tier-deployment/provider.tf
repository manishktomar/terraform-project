provider "aws" {
  region = var.aws_region
}

provider "aws" {
  alias  = "credentials"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}