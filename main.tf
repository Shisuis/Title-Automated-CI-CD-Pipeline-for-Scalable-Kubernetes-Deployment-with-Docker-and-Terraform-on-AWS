provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "kubejenkins" {
  ami                         = "ami-005fc0f236362e99f"
  instance_type               = "t2.medium"
  associate_public_ip_address = true
  key_name                    = "linux" # Replace with your AWS key pair name

  tags = {
    Name = "kubejenkins"
  }
}

resource "aws_instance" "slave1" {
  ami                         = "ami-005fc0f236362e99f"
  instance_type               = "t2.medium"
  associate_public_ip_address = true
  key_name                    = "linux" # Replace with your AWS key pair name

  tags = {
    Name = "slave1"
  }
}

resource "aws_instance" "slave3" {
  ami                         = "ami-005fc0f236362e99f"
  instance_type               = "t2.medium"
  associate_public_ip_address = true
  key_name                    = "linux" # Replace with your AWS key pair name

  tags = {
    Name = "slave2"
  }
}
