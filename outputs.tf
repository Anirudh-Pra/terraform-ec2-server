output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.example.id
}

output "instance_public_ip" {
  description = "The public IP of the EC2 instance"
  value       = aws_instance.example.public_ip
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.example_vpc.id
}

output "subnet_id" {
  description = "The ID of the subnet"
  value       = aws_subnet.example_subnet.id
}

output "security_group_id" {
  description = "The ID of the security group"
  value       = aws_security_group.allow_ssh.id
}

output "trusted_ip_address" {
  description = "IP that can connect to EC2 AWS server instance"
  value = var.trusted_ip_address
}

