provider "aws" {
  region = "us-east-1"
  access_key = "AKIAX2L2JFX3KKBD266N"
  secret_key = "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"
}


resource "aws_instance" "first_test" {
  ami           = "ami-052efd3df9dad4825"
  instance_type = "t2.micro"
   tags = {
     Name = "ubuntu"
   }
  
}

resource "aws_vpc" "my_firstvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Production"
  }

}


resource "aws_subnet" "subnet_1" {
  vpc_id     = aws_vpc.my_firstvpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "prod-subnet"
  }
}
