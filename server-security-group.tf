resource "aws_security_group" "server" {
    name = "server"
    description = "Firewall rules for servers"
    vpc_id = aws_vpc.tf_vpc.id
}

resource "aws_vpc_security_group_egress_rule" "allow_all_egress_ipv4" {
    security_group_id = aws_security_group.server.id
    cidr_ipv4 = "0.0.0.0/0"
    ip_protocol = "-1"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_egress_ipv6" {
    security_group_id = aws_security_group.server.id
    cidr_ipv4 = "::/0"
    ip_protocol = "-1"
}

resource "aws_vpc_security_group_ingress_rule" "allow_tcp_8080_from_subnet" {
    security_group_id = aws_security_group.server.id
    cidr_ipv4 = aws_vpc.tf_vpc.cidr_block
    from_port = -1
    ip_protocol = "tcp"
    to_port = 8080
}

resource "aws_vpc_security_group_ingress_rule" "allow_tcp_443_from_ipv6_internet" {
    security_group_id = aws_security_group.server.id
    cidr_ipv6 = "::/0"
    from_port = -1
    ip_protocol = "tcp"
    to_port = 443
}