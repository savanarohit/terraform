provider "aws" {
  region = "ap-south-1"
}

module "module" {
  source = "./module"
}




