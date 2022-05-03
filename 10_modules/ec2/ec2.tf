variable "ec2name" {
  type = string

}

resource "aws_instance" "nodeserver" {
  ami           = "ami-04893cdb768d0f9ee"
  instance_type = "t2.micro"
  tags = {
    "Name" = var.ec2name
  }
}

output "instance_id" {
  value = aws_instance.nodeserver

}



