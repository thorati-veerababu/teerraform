provider "aws" {
  
}
data "aws_ami" "my-ec2" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name = "name"
    values = [ "amzn-ami-hvm*" ]
  }
}
resource "aws_instance" "veerababu" {
  instance_type = "t2.micro"
ami = data.aws_ami.my-ec2.id  
count = 10
}