resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = var.vpc_name
  }
}

# Staging Subnet
resource "aws_subnet" "staging" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.staging_cidr
  availability_zone       = var.staging_az
  map_public_ip_on_launch = false
  tags = {
    Name = "${var.vpc_name}-staging"
  }
}

# Production Subnet
resource "aws_subnet" "production" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.production_cidr
  availability_zone       = var.production_az
  map_public_ip_on_launch = false
  tags = {
    Name = "${var.vpc_name}-production"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.vpc_name}-igw"
  }
}

# Routing Table
resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "${var.vpc_name}-main-route-table"
  }
}

# Route Table Association
resource "aws_route_table_association" "staging" {
  subnet_id      = aws_subnet.staging.id
  route_table_id = aws_route_table.main.id
}

resource "aws_route_table_association" "production" {
  subnet_id      = aws_subnet.production.id
  route_table_id = aws_route_table.main.id
}

# Security Groups
resource "aws_security_group" "staging_sg" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.vpc_name}-staging-sg"
  }
}

resource "aws_security_group" "production_sg" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.vpc_name}-production-sg"
  }
}
