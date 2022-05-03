# Crating an EC2 instance from AWS AMI ID ami-04893cdb768d0f9ee 
provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "nodeserver" {
  ami             = "ami-04893cdb768d0f9ee"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.webtraffic.name]
  tags = {
    "Name" = "NodeServer"
  }
}

# Security group for webtraffic
resource "aws_security_group" "webtraffic" {
  name = "Allow HTTPS"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 25
    to_port     = 25
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    "Name" = "Webtraffic"
  }

}
