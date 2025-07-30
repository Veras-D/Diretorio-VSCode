data "aws_ami" "ubuntu" {
  owners      = ["amazon"]
  most_recent = true
  name_regex  = "ubuntu"
}

data "aws_caller_identity" "current" {}

data "terraform_remote_state" "server" {
  backend = "s3"

  config = {
    bucket         = "tfstate-${data.aws_caller_identity.current.account_id}"
    key            = "./terraform.tfstate"
    region         = var.aws_region
    dynamodb_table = "tflock-tfstate-${data.aws_caller_identity.current.account_id}"
  }
}