provider "aws" {
region = "ap-south-1"
  
}

resource "aws_eip" "my_ip_1" {

domain =  "vpc"
  
}
resource "aws_eip" "my_ip_2" {

domain =  "vpc"
  
}


resource "aws_security_group" "terraform_sg" {
    
    name ="terraform_created_this"
    description = "to test cross_ref"
    ingress {
        description = "to inbound"
        to_port ="80"
        from_port = "80"
        protocol = "TCP"
        cidr_blocks = ["${aws_eip.my_ip_1.public_ip}/32"]

    }
    egress {
        description = "outbound"
        from_port = "0"
        to_port = "0"
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]


    }
  
}
