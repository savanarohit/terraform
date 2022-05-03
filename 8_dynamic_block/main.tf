# Crating an EC2 instance from AWS AMI ID ami-04893cdb768d0f9ee 
provider "aws" {
  region = "ap-south-1"
}

variable "ingress" {
  type    = list(number)
  default = [80, 443]
}

variable "egress" {
  type    = list(number)
  default = [80, 443, 25, 3306]
}

resource "aws_instance" "nodeserver" {
  ami             = "ami-04893cdb768d0f9ee"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.webtraffic.name]
  tags = {
    "Name" = "NodeServer"
  }
}

# Dynamic Security group for webtraffic
resource "aws_security_group" "webtraffic" {
  name = "Allow HTTPS"

  dynamic "ingress" {
    iterator = port
    for_each = var.ingress

    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.egress

    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  tags = {
    "Name" = "Webtraffic"
  }

}
