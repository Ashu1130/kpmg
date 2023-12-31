resource "aws_route_table" "pub-rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "MyRoute"
  }
}

resource "aws_route_table_association" "rt_associate_public" {
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.pub-rt.id
  count          = 2
}

resource "aws_route_table" "pri-rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natgw.id
  }
  tags = {
    Name = "pri-rt"
  }
}
resource "aws_route_table_association" "rt_associate_private1" {
  subnet_id      = aws_subnet.database-subnet-1.id
  route_table_id = aws_route_table.pri-rt.id
}
resource "aws_route_table_association" "rt_associate_private2" {
  subnet_id      = aws_subnet.database-subnet-2.id
  route_table_id = aws_route_table.pri-rt.id
}