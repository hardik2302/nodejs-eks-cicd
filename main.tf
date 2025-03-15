# VPC Configuration
resource "aws_vpc" "eks_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "my_vpc"
  }
}

# Internet Gateway (Required for EKS Public Access)
resource "aws_internet_gateway" "eks_igw" {
  vpc_id = aws_vpc.eks_vpc.id

  tags = {
    Name = "eks_internet_gateway"
  }
}

# Public Subnet (For Load Balancers)
resource "aws_subnet" "eks_subnet_1" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name                              = "eks_subnet_1"
    "kubernetes.io/role/elb"          = "1"
    "kubernetes.io/cluster/my-eks-cluster" = "owned"
  }
}

# Private Subnet (For Worker Nodes)
resource "aws_subnet" "eks_subnet_2" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-south-1b"

  tags = {
    Name                               = "eks_subnet_2"
    "kubernetes.io/role/internal-elb"  = "1"
    "kubernetes.io/cluster/my-eks-cluster" = "owned"
  }
}

# NAT Gateway (For Private Subnet to Access Internet)
resource "aws_eip" "nat_eip" {
  domain = "vpc"
}

resource "aws_nat_gateway" "eks_nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.eks_subnet_1.id

  tags = {
    Name = "eks_nat_gateway"
  }
}

# Public Route Table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks_igw.id
  }

  tags = {
    Name = "eks_public_route_table"
  }
}

# Associate Public Subnet with Public Route Table
resource "aws_route_table_association" "public_association" {
  subnet_id      = aws_subnet.eks_subnet_1.id
  route_table_id = aws_route_table.public_rt.id
}

# Private Route Table (For Private Subnet)
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks_nat.id
  }

  tags = {
    Name = "eks_private_route_table"
  }
}

# Associate Private Subnet with Private Route Table
resource "aws_route_table_association" "private_association" {
  subnet_id      = aws_subnet.eks_subnet_2.id
  route_table_id = aws_route_table.private_rt.id
}
