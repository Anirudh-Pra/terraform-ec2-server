# terraform.tfvars

aws_region          = "us-east-1"
aws_profile         = "default"
vpc_cidr_block      = "10.0.0.0/16"
subnet_cidr_block   = "10.0.1.0/24"
availability_zone   = "us-east-1a"            # Choose a valid availability zone in your region
ami_id              = "ami-05fd593d8c7e89cc7" #Replace with your AMI ID
instance_type       = "t2.micro"
instance_name       = "HealyEC2Instance"
key_name            = "test-key" # Replace with your key pair name if applicable
trusted_ip_address  = "99.96.116.235/32" # Replace with your ip
# Tags can be customized as needed
tags = {
  Name        = "HealyEC2Instance"
  Environment = "Development"
}

