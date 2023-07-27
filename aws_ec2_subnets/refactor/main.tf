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

locals {
  name = value
  tags = {
    Team           = "cloudacademy"
    DeploymentType = "terraform"
    Environment    = "dev"
    Name           = "ca-lab"
    Project        = "lab"
  }
}

resource "aws_vpc" "lab_vpc" {
  cidr_block = "10.0.0.0/16"



  # Tags

}