resource "aws_vpc" "vpc" {
  cidr_block = "192.168.0.0/22"
}

data "aws_availability_zones" "azs" {
  state = "available"
}

resource "aws_subnet" "subnet_az1" {
  availability_zone = "${data.aws_availability_zones.azs.names[0]}"
  cidr_block        = "192.168.0.0/24"
  vpc_id            = aws_vpc.vpc.id
  map_public_ip_on_launch = true
}

resource "aws_subnet" "subnet_az2" {
  availability_zone = "${data.aws_availability_zones.azs.names[1]}"
  cidr_block        = "192.168.1.0/24"
  vpc_id            = aws_vpc.vpc.id
  map_public_ip_on_launch = true
}

resource "aws_subnet" "subnet_az3" {
  availability_zone = "${data.aws_availability_zones.azs.names[2]}"
  cidr_block        = "192.168.2.0/24"
  vpc_id            = aws_vpc.vpc.id
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.vpc.id}"
}

resource "aws_route_table" "route_igw" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }
}

resource "aws_route_table_association" "route_table_association" {
  count = 3
  route_table_id = "${aws_route_table.route_igw.id}"
  subnet_id = "${aws_subnet.subnet_az1.id}"
}
