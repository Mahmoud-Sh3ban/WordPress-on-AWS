# Create a VPC
resource "aws_vpc" "wp_vpc" {
  cidr_block = var.vpc_cidr_block
    enable_dns_support   = true  
    enable_dns_hostnames = true  

}

# Create public and private subnets
resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.wp_vpc.id
  cidr_block = var.public_subnet_cidr_block
  availability_zone = "us-east-2a"
}

resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.wp_vpc.id
  cidr_block = var.public_subnet2_cidr_block
  availability_zone = "us-east-2b"
}

resource "aws_subnet" "private1" {
  vpc_id            = aws_vpc.wp_vpc.id
  cidr_block        = var.private_subnet_cidr_block
  availability_zone = "us-east-2a"

}

resource "aws_subnet" "private2" {
  vpc_id            = aws_vpc.wp_vpc.id
  cidr_block        = var.private_subnet2_cidr_block
  availability_zone = "us-east-2b"
}

# DB subnet group  
resource "aws_db_subnet_group" "db_subnet" {
  subnet_ids = [aws_subnet.public1.id, aws_subnet.public2.id] 
}

# Create an internet gateway and attach it to the VPC
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.wp_vpc.id
}

# Create a route table for the public subnet
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.wp_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

# Associate the public subnet with the public route table
resource "aws_route_table_association" "public" {
  count          = length(var.public_subnet_ids)
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public2" {
  count          = length(var.public_subnet_ids)
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public.id
}

# Security Group for DB
resource "aws_security_group" "allow_data_in_db" {
  name        = "allow_db"
  description = "Allow WP to put data in DB"
  vpc_id      = aws_vpc.wp_vpc.id

  ingress {
    description = "MySQL"
    from_port   = 3306
    to_port     = 3306
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