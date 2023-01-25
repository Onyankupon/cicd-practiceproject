variable "rds_vpc_id" {
  default     = "vpc-xxxx" # VPC id of aws account
  description = "Our default RDS virtual private cloud (rds_vpc)."
}

variable "rds_public_subnets" {
  default     = "subnet-xxxx,subnet-xxxx,subnet-xxxx" # Use your subnet id from your vpc
  description = "The public subnets of our RDS VPC rds-vpc."
}

variable "rds_public_subnet_group" {
  default     = "default-vpc-xxxx"
  description = "Apparently the group name, according to the RDS launch wizard."
}