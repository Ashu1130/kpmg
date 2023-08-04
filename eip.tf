resource "aws_eip" "eip-1a" {
  depends_on = [aws_internet_gateway.gw]
}
