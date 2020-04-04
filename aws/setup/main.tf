provider "aws" {
  region = "us-east-2"
  profile = "wookie"
}


terraform {
    backend "s3" {
        bucket = "coralbuffalo-tfstate"
        key = "setup/terraform.tfstate"
        region = "us-east-2"
        encrypt = true
        dynamodb_table = "coralbuffalo-tfstate-lock"
        profile = "wookie"
    }
}

resource "aws_vpc" "firstvpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    cbname = "First VPC"
  }  
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "publicA" {
  vpc_id = aws_vpc.firstvpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    cbname = "Public Subnet A"
  }
}

resource "aws_subnet" "publicB" {
  vpc_id = aws_vpc.firstvpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = {
    cbname = "Public Subnet B"
  }
}

resource "aws_subnet" "privateA" {
  vpc_id = aws_vpc.firstvpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    cbname = "Public Subnet A"
  }
}

resource "aws_subnet" "privateB" {
  vpc_id = aws_vpc.firstvpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = {
    cbname = "Public Subnet B"
  }
}