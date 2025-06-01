resource "aws_security_group" "webserver" {
    name = "webserver"
    description = "Firewall rules for webservers"
    vpc_id = aws_vpc.tf_vpc.id
}

resource "aws_vpc_security_group_egress_rule" "allow_all_egress_ipv4" {
    security_group_id = aws_security_group.webserver.id
    cidr_ipv4 = "0.0.0.0/0"
    ip_protocol = "-1"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_egress_ipv6" {
    security_group_id = aws_security_group.webserver.id
    cidr_ipv6 = "::/0"
    ip_protocol = -1
}

/*
resource "aws_vpc_security_group_ingress_rule" "allow_tcp_8080_from_subnet" {
    security_group_id = aws_security_group.webserver.id
    cidr_ipv4 = aws_vpc.tf_vpc.cidr_block
    from_port = 8080
    ip_protocol = "tcp"
    to_port = 8080
}
*/

resource "aws_vpc_security_group_ingress_rule" "allow_tcp_443_from_ipv6_internet" {
    security_group_id = aws_security_group.webserver.id
    cidr_ipv6 = "::/0"
    from_port = 443
    ip_protocol = "tcp"
    to_port = 443
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_from_ipv6_internet" {
    security_group_id = aws_security_group.webserver.id
    cidr_ipv6 = "::/0"
    from_port = 22
    ip_protocol = "tcp"
    to_port = 22
}