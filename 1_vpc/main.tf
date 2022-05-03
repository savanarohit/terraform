provider "aws" {
  region = "ap-south-1"
}

# AWS VPC for Devops CI/CD Pipeline Testing , Development and Production

resource "aws_vpc" "Testing" {
  cidr_block = "10.0.0.0/16"

  tags = {
    "Name" = "Testing"
  }

}

resource "aws_vpc" "Development" {
  cidr_block = "10.0.1.0/28"

  tags = {
    "Name" = "Development"
  }

}

