# Terraform variables
variable "region" {
  type        = string
  description = "The AWS region to deploy to"
  default     = "us-east-1"
}

variable "ami" {
  type        = string
  description = "The AMI to use for the EC2 instance"
  default     = "ami-04b70fa74e45c3917"
}

variable "instance_type" {
  type        = string
  description = "The instance type to use for the EC2 instance"
  default     = "t2.micro"
}

variable "key_name" {
  type        = string
  description = "The key pair name to use for the EC2 instance"
  default     = "terraform-key"
}

variable "server_name" {
  type        = string
  description = "The name of the EC2 instance"
  default     = "nginx-server"
}

variable "security_group_name" {
  type        = string 
  description = "The name of the security group"
  default     = "nginx-security-group"
}