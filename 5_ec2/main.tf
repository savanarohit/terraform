# Crating an EC2 instance on AWS  (Amazon Linux 2 AMI ID ami-04893cdb768d0f9ee)
provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "nodeserver" {
  ami = "ami-08ee6644906ff4d6c"

  instance_type = "t2.medium"
  tags = {
    "Name" = "Docker"
  }
}




