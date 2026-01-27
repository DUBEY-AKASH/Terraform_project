variable "aws_region" {
    default = "eu-north-1"
}

variable "vpc_cidr" {
    default = "10.0.1.0/16"
  
}

variable "public_subnet_cidr" {
    default = "10.0.1.0/24"
  
}

variable "private_subnet_cidr" {
    default = "10.0.1.0/24"
  
}

variable "ami_id" {
    description = "Amazon Linux 2 AMI"
  
}

variable "key_name" {
    description = "EC2 key pair name"
  
}