
resource "aws_vpc" "example_vpc" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "example_vpc"
  }
}

resource "aws_subnet" "example_subnet" {
  vpc_id            = aws_vpc.example_vpc.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.availability_zone

  tags = {
    Name = "example_subnet"
  }
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.example_vpc.id

  ingress {
    description = "SSH from specific IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.trusted_ip_address]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_instance" "example" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = aws_subnet.example_subnet.id
  associate_public_ip_address = true # Enable auto-assigning public IP
  vpc_security_group_ids      = [aws_security_group.allow_ssh.id]

  tags = merge(
    var.tags,
    {
      "Name" = var.instance_name
    }
  )
}

# Create an Internet Gateway and associate it with the VPC
resource "aws_internet_gateway" "example_igw" {
  vpc_id = aws_vpc.example_vpc.id

  tags = {
    Name = "example_igw"
  }
}

# Create a public route table and associate it with the public subnet
resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.example_vpc.id

  route {
    cidr_block = "0.0.0.0/0" # Route all traffic
    gateway_id = aws_internet_gateway.example_igw.id
  }

  tags = {
    Name = "public_route"
  }
}

# Associate the public route table with the public subnet
resource "aws_route_table_association" "public_association" {
  subnet_id      = aws_subnet.example_subnet.id
  route_table_id = aws_route_table.public_route.id
}
