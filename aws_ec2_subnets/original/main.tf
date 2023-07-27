terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.9.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_vpc" "lab_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "ca-lab-vpc"
  }
}

# Security Groups
resource "aws_security_group" "sg-webserver" {
  vpc_id      = aws_vpc.lab_vpc.id
  name        = "sg-webserver"
  description = "Security Group for Web Servers"

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = [var.vpc-cidr]
  }

  egress {
    protocol    = "tcp"
    from_port   = 1433
    to_port     = 1433
    cidr_blocks = [var.vpc-cidr]
  }
}

