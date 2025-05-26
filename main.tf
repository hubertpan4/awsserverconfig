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

data "aws_ami" "aws_linux" {
    most_recent = true
    owners = ["amazon"]

    filter {
        name = "architecture"
        values = ["arm64"]
    }

    filter {
        name = "name"
        values = ["al2023-ami-2023.6*"]
    }

}

resource "aws_instance" "app_server" {
    ami = data.aws_ami.aws_linux.id
    instance_type = "t4g.small"
    tags = {
        Name = "exampleInstance"
    }
}