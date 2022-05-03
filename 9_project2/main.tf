/*  1) Create a DB Server and output the private IP
    2) Create a web server and ensure it has a fixed public IP
    3) Creata a security group for the web server opening
    port 80 and 443(HTTP and HTTPS)
    4) Run the given script on the DB Server
*/
provider "aws" {
  region = "ap-south-1"
}
# AWS EC2 Database Server instance 
resource "aws_instance" "dbserver" {
  ami           = "ami-04893cdb768d0f9ee"
  instance_type = "t2.micro"
  tags = {
    "Name" = "DB Server"
  }
}
# AWS EC2 Web Server instance with Bootstrap script 
resource "aws_instance" "webserver" {
  ami             = "ami-04893cdb768d0f9ee"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.web_traffic.name]
  # user_data       = file("server-script.sh")
  tags = {
    "Name" = "Web Server"
  }
}
# AWS Elastic IP for webserver EC2 instance
resource "aws_eip" "webserver_ip" {
  instance = aws_instance.webserver.id
}

# Creating ingress and egress for Security group
variable "ingress" {
  type    = list(number)
  default = [80, 443]
}

variable "egress" {
  type    = list(number)
  default = [80, 443]
}

# Dynamic Security group
resource "aws_security_group" "web_traffic" {
  name = "Allow Web traffic"

  dynamic "ingress" {
    iterator = port
    for_each = var.ingress
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/32"]
    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.egress
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/32"]
    }

  }

}

# Output of the DB server Private IP
output "PrivateIP" {
  value = aws_instance.dbserver.private_ip

}

# Output of the Web server Public IP
output "PublicIP" {
  value = aws_eip.webserver_ip.public_ip

}
