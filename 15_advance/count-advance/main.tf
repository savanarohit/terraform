provider "aws" {
  region = "ap-south-1"
}
# AWS EC2 multiple instance using count 
resource "aws_instance" "webserver" {
  ami           = "ami-04893cdb768d0f9ee"
  instance_type = "t2.micro"
  tags = {
    "Name" = "webserver"
  }
  count = 2
}

