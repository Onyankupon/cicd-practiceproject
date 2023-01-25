## Please configure according to needed requirement 

variable "main_region" {
  type    = string
  default = "us-east-1" # Use your region
}

provider "aws" {
  region = var.main_region
}
resource "aws_s3_bucket" "udapeople_bucket" {
  bucket = "udapeople-1234321" # Named for easy recognition from CircleCI
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.udapeople_bucket.id
  acl    = "public-read"
}

resource "aws_db_instance" "postgresdatabase" {
  allocated_storage       = 200 # gigabytes
  engine                  = "postgres" # PostgreSQL engine 
  engine_version          = "13.7"
  identifier              = "database-2"
  instance_class          = "db.t3.micro" # Use whichever is okay for you
  multi_az                = false
  db_name                 = "postgres" # Database Name
  parameter_group_name    = "default.postgres13"
  password                = "postgres" # Not advised to expose secrets 
  port                    = 5432
  publicly_accessible     = true
  storage_encrypted       = false
  storage_type            = "gp2"
  username                = "postgres" #database Username
  vpc_security_group_ids  = ["${aws_security_group.postgressg.id}"]
  skip_final_snapshot = true 
}

# Security group to allow connect from all ip addresses (Not advised for Production scenarios)
resource "aws_security_group" "postgressg" {
  name = "postgressg"

  description = "RDS postgres servers (terraform-managed)"
  vpc_id      = var.rds_vpc_id
  # Only postgres in
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # Allow all traffic in
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "ALL"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # Allow all outbound traffic.
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}