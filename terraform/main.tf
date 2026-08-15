# Main Terraform configuration

resource "aws_vpc" "main" {

  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "${var.project_name}-vpc"
  }

}


# Internet Gateway

resource "aws_internet_gateway" "main" {


  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.project_name}-igw"
  }

}

# Public Subnet 

resource "aws_subnet" "public" {

  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {

    Name = "${var.project_name}-public-subnet"

  }

}

# Public Route Table

resource "aws_route_table" "public" {

  vpc_id = aws_vpc.main.id

  route {

    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {

    Name = "${var.project_name}-public-route-table"
  }

}

# Route Table Association

resource "aws_route_table_association" "public" {

  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id

}

# Security Group Creation

resource "aws_security_group" "public" {

  name        = "${var.project_name}-public-sg"
  description = "Security Group for Public EC2 Instances"
  vpc_id      = aws_vpc.main.id

  ingress {

    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["103.74.138.68/32"]
  }

  ingress {

    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {

    description = "Allow All Outbound Traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {

    Name = "${var.project_name}-public-sg"

  }

}

# Creating EC2 Instance Along with this VPC

resource "aws_instance" "public" {

  ami           = "ami-07e5ce642bbc48c0d"
  instance_type = "t3.micro"

  key_name = "usabinsonkey"

  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.public.id]

  tags = {

    Name = "${var.project_name}-public-ec2"

  }

}

# creating an elastic ip address for the ec2 instance

resource "aws_eip" "public" {

  domain = "vpc"

  instance = aws_instance.public.id

  tags = {

    Name = "${var.project_name}-public-eip"

  }

}



