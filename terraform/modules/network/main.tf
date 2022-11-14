#
# VPC for testing environment
#
resource "aws_vpc" "vpc_1" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    Name = "${var.tag_identifier}-vpc"
  }
}


#
# Create subnets
#
# Subnet for DSE core - application cluster
resource "aws_subnet" "subnet_1" {
  vpc_id                  = aws_vpc.vpc_1.id
  cidr_block              = var.vpc_cidr
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.tag_identifier}-subnet-1"
  }
}

#
# Create an internet gateway for public/internet access
#
resource "aws_internet_gateway" "ig_dse" {
  vpc_id = aws_vpc.vpc_1.id

  tags = {
    Name = "${var.tag_identifier}-ig_dse"
  }
}

#
# Create a custom route table for public/internet access
#
resource "aws_route_table" "rt_dse" {
  vpc_id = aws_vpc.vpc_1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig_dse.id
  }

  tags = {
    Name = "${var.tag_identifier}-rt_dse"
  }
}

resource "aws_main_route_table_association" "mrta_dse" {
  vpc_id         = aws_vpc.vpc_1.id
  route_table_id = aws_route_table.rt_dse.id
}
