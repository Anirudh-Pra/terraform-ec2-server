
variable "aws_region" {
  description = "The AWS region to create resources in."
  type        = string
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "The named profile in AWS credentials to use."
  type        = string
  default     = "default"
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
  // Example: default = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  description = "The CIDR block for the subnet."
  type        = string
  // Example: default = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "The availability zone where the subnet will be created."
  type        = string
  default     = ""
  // Example: default = "us-east-1a"
}

variable "trusted_ip_address" {
  description = "The public IP address of your laptop"
  type        = string
  default     = "174.209.97.83" # Replace with your actual public IP address
}

variable "ami_id" {
  description = "The ID of the AMI to use for the instance."
  type        = string
  // No default here; it should be specified based on the chosen AMI
}

variable "instance_type" {
  description = "The type of instance to start."
  type        = string
  default     = "t2.micro"
}

variable "instance_name" {
  description = "The name of the EC2 instance."
  type        = string
  default     = "MyEC2Instance"
}

variable "key_name" {
  description = "The key name of the Key Pair to use for the instance; ensure this key is already created in the specified AWS region."
  type        = string
  default     = ""
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default = {
    Terraform = "true"
  }
}

