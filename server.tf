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
    vpc_security_group_ids = [aws_security_group.webserver.id]
    subnet_id = aws_subnet.subnet_a.id
}