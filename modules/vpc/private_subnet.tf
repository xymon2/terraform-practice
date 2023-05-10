resource "aws_subnet" "private" {
	vpc_id = aws_vpc.main.id
	cidr_block = var.private_cidr_block
	availability_zone = var.private_az
	map_public_ip_on_launch = false
	tags = {
		Name = "${var.name}-private-subnet"
	}
}

resource "aws_route_table" "private" {
    vpc_id = aws_vpc.main.id
	route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat.id
    }
    tags = {
        Name = "${var.name}-private-route-table"
    }
}

resource "aws_route_table_association" "private" {
    subnet_id      = aws_subnet.private.id
    route_table_id = aws_route_table.private.id
}

resource "aws_eip" "nat" {
    vpc=true
}

resource "aws_nat_gateway" "nat" {
    allocation_id = aws_eip.nat.id
    subnet_id     = aws_subnet.private.id
    depends_on = [aws_internet_gateway.gw]
}
