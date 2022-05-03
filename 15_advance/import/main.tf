provider "aws" {
  region = "ap-south-1"
}

variable "servers" {
  type = number

}

# AWS EC2 multiple instance in different stages using count 
resource "aws_instance" "webserver" {
  ami           = "ami-04893cdb768d0f9ee"
  instance_type = "t2.micro"
  count         = var.servers
}

