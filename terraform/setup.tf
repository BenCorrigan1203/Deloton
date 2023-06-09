terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

# Configure AWS provider
provider "aws" {
  shared_credentials_files = ["~/.aws/credentials"]
  region                   = "eu-west-2"
}

# Use existing VPC
data "aws_vpc" "c7-vpc" {
  id         = "vpc-010fd888c94cf5102"
  cidr_block = "10.0.0.0/16"
}

# Use existing subnet
data "aws_db_subnet_group" "c7-subnets" {
  name = "c7-db-subnet-group"
}

# Use existing security group
data "aws_security_group" "c7-remote-access" {
  name   = "c7-remote-access"
  vpc_id = data.aws_vpc.c7-vpc.id
  id     = "sg-01745c9fa38b8ed68"
}
