resource "aws_subnet" "public" {
	vpc_id = aws_vpc.main.id
	cidr_block = var.public_cidr_block
	availability_zone = var.public_az
	map_public_ip_on_launch = true
	tags = {
		Name = "${var.name}-public-subnet"
	}
}

resource "aws_internet_gateway" "gw" {
    vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "public" {
    vpc_id = aws_vpc.main.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.gw.id
    }
    tags = {
        Name = "${var.name}-public-route-table"
    }
}

resource "aws_route_table_association" "public" {
    subnet_id      = aws_subnet.public.id
    route_table_id = aws_route_table.public.id
}


