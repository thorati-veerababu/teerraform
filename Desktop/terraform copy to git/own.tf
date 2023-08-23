provider "aws" {
  region = "ap-south-1"
  access_key = ""
  secret_key = ""
}
resource "aws_instance" "web_server1" {
  ami = "ami-0da59f1af71ea4ad2"
  instance_type = "t2.micro"
  vpc_security_group_ids = [var.vpc_security_group_ids]
  tags = {
    name ="veerababu"
  }
}
