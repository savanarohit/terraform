# Crating an EC2 instance from AWS AMI ID ami-04893cdb768d0f9ee 
provider "aws" {
  region = "ap-south-1"
}

# AWS EC2 Web Server instance with Bootstrap script 
resource "aws_instance" "webserver" {
  ami           = "ami-04893cdb768d0f9ee"
  instance_type = "t2.micro"
  tags = {
    "Name" = "Web Server"
  }
}

# AWS Elastic IP for webserver EC2 instance
resource "aws_eip" "webserver_ip" {
  instance = aws_instance.webserver.id
}
