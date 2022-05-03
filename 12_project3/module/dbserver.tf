# AWS EC2 Database Server instance 
resource "aws_instance" "dbserver" {
  ami           = "ami-04893cdb768d0f9ee"
  instance_type = "t2.micro"
  tags = {
    "Name" = "dbserver"
  }
}

