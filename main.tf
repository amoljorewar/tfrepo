## PUT TERRAFORM CLOUD BLOCK HERE!  ##

terraform {

  cloud {

    organization = "amoljorewar"

    workspaces {
      name = "amoljorewar"
    }
  }


  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.01"
    }
  }



}


# Variable blocks directly within the main.tf. No arguments necessary.
# variable "aws_access_key" {}
# variable "aws_secret_key" {}
variable "region" {}

# provider arguments call on the variables which then call on terraform.tfvars for the values.
provider "aws" {
  # access_key = var.aws_access_key
  # secret_key = var.aws_secret_key
  region = var.region
}

# Add .gitignore file in this directory with the terraform.tfvars

resource "aws_instance" "tc_instance" {
  ami           = "ami-0b40807e5dc1afecf"
  instance_type = "t2.micro"

  tags = {
    Name = "TC-triggered-instance"
  }
}

resource "aws_iam_user" "test_git_user" {
  name = "test_git_user"
}