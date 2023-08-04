resource "aws_key_pair" "web-key" {
  key_name   = "webkey"
  public_key = file(var.Web_PUB_KEY)
}

resource "aws_instance" "web" {
  ami           = "ami-08df646e18b182346"
  instance_type = "t2.micro"
  key_name = aws_key_pair.web-key.key_name
  subnet_id = aws_subnet.public[count.index].id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  associate_public_ip_address = true
  count = 2
  user_data              = file("apache.sh")

  tags = {
    Name = "WebServer"
  }
}