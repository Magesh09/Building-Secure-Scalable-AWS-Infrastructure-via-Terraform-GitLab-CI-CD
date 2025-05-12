//NAT Gateway
resource "aws_nat_gateway" "nat-gateway" {
  allocation_id = aws_eip.eip.id
  subnet_id     = element(aws_subnet.public_subnet[*].id, 0)
  depends_on    = [aws_internet_gateway.igw_vpc]
  tags = {
    Name = "Nat Gateway"
  }
}