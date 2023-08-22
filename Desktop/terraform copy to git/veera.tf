provider "aws" {
   region = "us-east-1"
  access_key = ""
  secret_key = ""
}
resource "aws_vpc" "veera" {
 cidr_block ="10.0.0.0/24"    

}
