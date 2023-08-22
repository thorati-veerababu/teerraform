provider "aws" {
  region     = "ap-south-1"
  access_key = ""
  secret_key = ""
}

resource "aws_instance" "example_instance" {
  ami           = "ami-0da59f1af71ea4ad2"  # Change this to your desired AMI ID
  instance_type = "t2.micro"

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install httpd -y
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Hello from Terraform EC2 with Apache HTTPD</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Name = "ExampleInstance"
  }

  security_groups = [aws_security_group.example_security_group.name]
}

resource "aws_security_group" "example_security_group" {
  name_prefix = "example-security-group-"
  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  // All protocols
    cidr_blocks = ["0.0.0.0/0"]
  }
}


output "public_ip" {
  value = aws_instance.example_instance.public_ip
}