provider "aws" {
  region = "ap-south-1"

}

# AWS VPC Creation using string variable 
variable "vpcname" {
  type    = string
  default = "Bastion"
}

resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = var.vpcname
  }
}

output "vpcid" {
  value = aws_vpc.myvpc.id

}


variable "mytuple" {
  type    = tuple([string, number, string])
  default = ["cat", 1, "dog"]

}



variable "myobject" {
  type = object({ name = string, port = list(number) })
  default = {
    name = "Port Numbers"
    port = [22, 25, 80]
  }

}


/*

variable "sshport" {
  type    = number
  default = 22

}


variable "enabled" {
  default = true

}

variable "lists" {
  type    = list(string)
  default = ["Value1", "Value2"]

}

variable "mymap" {
  type = map(any)
  default = {
    key1 = "Value1"
    key2 = "Value2"
  }

}


Input from the user and then resouce vpc creation on aws

variable "inputname" {
  type        = string
  description = "set the name of VPC"
}

resource "aws_vpc" "testvpc" {
  cidr_block = "10.0.0.0/24"

    tags {
        Name = var.inputname
    }
}

*/

