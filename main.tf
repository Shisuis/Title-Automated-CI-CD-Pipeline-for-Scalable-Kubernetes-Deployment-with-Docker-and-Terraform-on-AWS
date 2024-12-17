provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "kubejenkins" {
  ami                         = "ami-005fc0f236362e99f"
  instance_type               = "t2.medium"
  associate_public_ip_address = true
  key_name                    = "linux" # Replace with your AWS key pair name

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install openjdk-8-jdk -y
              sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
              sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
              sudo yum install jenkins -y
              sudo systemctl start jenkins
              sudo systemctl enable jenkins
              EOF

  tags = {
    Name = "kubejenkins"
  }
}

resource "aws_instance" "kubeslave2" {
  ami                         = "ami-005fc0f236362e99f"
  instance_type               = "t2.medium"
  associate_public_ip_address = true
  key_name                    = "linux" # Replace with your AWS key pair name

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install openjdk-8-jdk -y
              sudo apt install docker.io -y
              sudo systemctl start docker
              sudo systemctl enable docker
              EOF

  tags = {
    Name = "kubeslave2"
  }
}

resource "aws_instance" "kubeslave3" {
  ami                         = "ami-005fc0f236362e99f"
  instance_type               = "t2.medium"
  associate_public_ip_address = true
  key_name                    = "linux" # Replace with your AWS key pair name

  tags = {
    Name = "kubeslave3"
  }
}
