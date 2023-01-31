variable "main_region" {
  type    = string
  default = "us-east-1" # Use your region
}

provider "aws" {
  region = var.main_region
}

resource "aws_instance" "prometheus-server" {
  ami                    = "ami-0778521d914d23bc1"
  subnet_id              = "subnet-xxxx"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.prometheus-sg.id}"]
  key_name               = "udacity"
  tags = {
    Name = "prometheus-server"
  }
  user_data = "${file("init.sh")}"
}

resource "aws_security_group" "prometheus-sg" {
  name   = "prometheus-sg"
  vpc_id = "vpc-xxxx"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "prometheus port"
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "prometheus node port"
    from_port   = 9100
    to_port     = 9100
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "alertmanager port"
    from_port   = 9093
    to_port     = 9093
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "instances" {
  value       = aws_instance.prometheus-server.*.private_ip
  description = "PrivateIP address details"
}