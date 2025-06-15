resource "aws_vpc" "tf_vpc" {
    cidr_block="192.168.0.0/16"
    assign_generated_ipv6_cidr_block = true
    tags = {
        Name = "tf_vpc"
    }

}

resource "aws_internet_gateway" "tf_vpc_gw" {
    vpc_id = aws_vpc.tf_vpc.id
    tags = {
        Name = "tf_igw"
    }
}

resource "aws_subnet" "subnet_a" {
    vpc_id = aws_vpc.tf_vpc.id 
    cidr_block= "192.168.1.0/24"
    ipv6_cidr_block = cidrsubnet(aws_vpc.tf_vpc.ipv6_cidr_block,8,1) 
    availability_zone="us-east-2a"
    assign_ipv6_address_on_creation=true
    tags = {
        Name = "tf_subnet_a"
    }
}

resource "aws_subnet" "subnet_b" {
    vpc_id = aws_vpc.tf_vpc.id 
    cidr_block= "192.168.2.0/24"
    availability_zone="us-east-2b"
    assign_ipv6_address_on_creation = false
    tags = {
        Name = "tf_subnet_b"
    }
}

resource "aws_route_table" "tf_rt_tbl" {
    vpc_id = aws_vpc.tf_vpc.id
    tags = {
        Name = "tf_rt_tbl"
    }
}

resource "aws_route" "internet_ip4" {
    route_table_id =  aws_route_table.tf_rt_tbl.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tf_vpc_gw.id
}

resource "aws_route" "internet_ip6" {
    route_table_id =  aws_route_table.tf_rt_tbl.id
    destination_ipv6_cidr_block = "::/0"
    gateway_id = aws_internet_gateway.tf_vpc_gw.id
}

resource "aws_vpc_endpoint" "s3" {
    vpc_id = aws_vpc.tf_vpc.id
    vpc_endpoint_type="Gateway"
    service_name="com.amazonaws.us-east-2.s3"
    tags = {
        Name = "s3_gateway"
    }
}

resource "aws_route_table_association" "subnet_a_tf_rt_tbl" {
    subnet_id = aws_subnet.subnet_a.id
    route_table_id = aws_route_table.tf_rt_tbl.id
}

resource "aws_route_table_association" "subnet_b_tf_rt_tbl" {
    subnet_id = aws_subnet.subnet_b.id
    route_table_id = aws_route_table.tf_rt_tbl.id
}