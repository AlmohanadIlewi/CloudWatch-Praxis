# Create VPC
resource "aws_vpc" "main" {

  cidr_block = "10.0.0.0/16"

  tags = {

    Name = "grafana_vpc"
  }
}

# Create Subnets

resource "aws_subnet" "main" {

  vpc_id                                      = aws_vpc.main.id
  cidr_block                                  = "10.0.1.0/24"
  enable_resource_name_dns_a_record_on_launch = true
  map_public_ip_on_launch                     = true

  tags = {

    Name = "grafana-sb"

  }

}

# Provides a resource to create a VPC Internet Gateway.

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "grafana-gw"
  }
}

# Provides a resource to create a VPC routing table.

resource "aws_route_table" "rt" {

    vpc_id = aws_vpc.main.id

route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
    }

tags = {

    Name = "grafana-rt"

    }
}

#Provides a resource to create an association between a route table and a subnet 
# or a route table and an internet gateway or virtual private gateway.

resource "aws_route_table_association" "rt-association" {
    subnet_id      = aws_subnet.main.id
    route_table_id = aws_route_table.rt.id


}

