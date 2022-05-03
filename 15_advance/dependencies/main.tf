provider "aws" {
  region = "ap-south-1"
}


# AWS EC2 Web Server instance 
resource "aws_instance" "webserver" {
  ami           = "ami-04893cdb768d0f9ee"
  instance_type = "t2.micro"
  tags = {
    "Name" = "webserver"
  }
}

# AWS EC2 Web Server instance 
resource "aws_instance" "nodeserver" {
  ami           = "ami-04893cdb768d0f9ee"
  instance_type = "t2.micro"
  tags = {
    "Name" = "nodeserver"
  }
  depends_on = [aws_instance.webserver]
}
