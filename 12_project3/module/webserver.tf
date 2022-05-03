# AWS EC2 Web Server instance with Bootstrap script 
resource "aws_instance" "webserver" {
  ami           = "ami-04893cdb768d0f9ee"
  instance_type = "t2.micro"
  tags = {
    "Name" = "webserver"
  }
}

