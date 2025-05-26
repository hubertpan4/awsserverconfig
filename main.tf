terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 4.16"
        }
    }

    required_version = ">= 1.2.0"
}

provider "aws" {
    region = "us-east-2"
}

resource "aws_instance" "app_server" {
    ami = ""
    instance_type = "t4g.small"
    tags = {
        Name = "exampleInstance"
    }
}