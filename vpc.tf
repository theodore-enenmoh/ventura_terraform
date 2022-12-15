# Create VPC
# terraform aws create vpc
resource "aws_vpc" "VenturaProdVpc" {
  cidr_block              = "${var.VenturaProdVpcPara}"
  instance_tenancy        = "default"
  enable_dns_hostnames    = true

  tags      = {
    Name    = "VenturaProdVpc"
  }
}

# Create Internet Gateway and Attach it to VPC
# terraform aws create internet gateway
resource "aws_internet_gateway" "VenturaProdIGW" {
  vpc_id    = aws_vpc.VenturaProdVpc.id

  tags      = {
    Name    = "VenturaProdIGW"
  }
}

# Create Public Subnet 1
# terraform aws create subnet
resource "aws_subnet" "VenturaProdNATALBSN1" {
  vpc_id                  = aws_vpc.VenturaProdVpc.id
  cidr_block              = "${var.VenturaProdNATALBSN1Para}"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags      = {
    Name    = "VenturaProdNATALBSN1"
  }
}

# Create Public Subnet 2
# terraform aws create subnet
resource "aws_subnet" "VenturaProdNATALBSN2" {
  vpc_id                  = aws_vpc.VenturaProdVpc.id
  cidr_block              = "${var.VenturaProdNATALBSN2Para}"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags      = {
    Name    = "VenturaProdNATALBSN2"
  }
}

# Create Route Table and Add Public Route
# terraform aws create route table
resource "aws_route_table" "public-route-table" {
  vpc_id       = aws_vpc.VenturaProdVpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.VenturaProdIGW.id
  }

  tags       = {
    Name     = "Public Route Table"
  }
}

# Associate Public Subnet 1 to "Public Route Table"
# terraform aws associate subnet with route table
resource "aws_route_table_association" "public-subnet-1-route-table-association" {
  subnet_id           = aws_subnet.VenturaProdNATALBSN1.id
  route_table_id      = aws_route_table.public-route-table.id
}

# Associate Public Subnet 2 to "Public Route Table"
# terraform aws associate subnet with route table
resource "aws_route_table_association" "public-subnet-2-route-table-association" {
  subnet_id           = aws_subnet.VenturaProdNATALBSN2.id
  route_table_id      = aws_route_table.public-route-table.id
}

# Create Private Subnet 1
# terraform aws create subnet
resource "aws_subnet" "VenturaProdWebSN1" {
  vpc_id                   = aws_vpc.VenturaProdVpc.id
  cidr_block               = "${var.VenturaProdWebSN1Para}"
  availability_zone        = "us-east-1a"
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "VenturaProdWebSN1 | Web Tier"
  }
}

# Create Private Subnet 2
# terraform aws create subnet
resource "aws_subnet" "VenturaProdWebSN2" {
  vpc_id                   = aws_vpc.VenturaProdVpc.id
  cidr_block               = "${var.VenturaProdWebSN2Para}"
  availability_zone        = "us-east-1b"
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "VenturaProdWebSN2 | Web Tier"
  }
}

# Create Private Subnet 3
# terraform aws create subnet
resource "aws_subnet" "VenturaProdAPPSN1" {
  vpc_id                   = aws_vpc.VenturaProdVpc.id
  cidr_block               = "${var.VenturaProdAPPSN1Para}"
  availability_zone        = "us-east-1a"
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "VenturaProdAPPSN1 | App Tier"
  }
}

# Create Private Subnet 4
# terraform aws create subnet
resource "aws_subnet" "VenturaProdAPPSN2" {
  vpc_id                   = aws_vpc.VenturaProdVpc.id
  cidr_block               = "${var.VenturaProdAPPSN2Para}"
  availability_zone        = "us-east-1b"
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "VenturaProdAPPSN2 | App Tier"
  }
}

# Create Private Subnet 5
# terraform aws create subnet
resource "aws_subnet" "VenturaProdDBSN1" {
  vpc_id                   = aws_vpc.VenturaProdVpc.id
  cidr_block               = "${var.VenturaProdDBSN1Para}"
  availability_zone        = "us-east-1a"
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "VenturaProdDBSN1 | Database Tier"
  }
}

# Create Private Subnet 6
# terraform aws create subnet
resource "aws_subnet" "VenturaProdDBSN2" {
  vpc_id                   = aws_vpc.VenturaProdVpc.id
  cidr_block               = "${var.VenturaProdDBSN2Para}"
  availability_zone        = "us-east-1b"
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "VenturaProdDBSN2 | Database Tier"
  }
}