resource "aws_vpc" "this" {
  cidr_block           = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.name_prefix}-vpc"
  }
}

resource "aws_subnet" "public" {
  count      = length(var.public_subnet_cidr_blocks)
  vpc_id     = aws_vpc.this.id
  cidr_block = var.public_subnet_cidr_blocks[count.index]

  map_public_ip_on_launch = true

  tags = {
    Name = "${var.name_prefix}-public-subnet-${count.index}"
  }
}

resource "aws_subnet" "private" {
  count      = length(var.private_subnet_cidr_blocks)
  vpc_id     = aws_vpc.this.id
  cidr_block = var.private_subnet_cidr_blocks[count.index]

  tags = {
    Name = "${var.name_prefix}-private-subnet-${count.index}"
  }
}