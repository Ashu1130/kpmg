resource "aws_security_group" "alb-sg" {
  name = "alb-listner"
  description = "listen from outside"
  vpc_id = aws_vpc.main.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "web-sg" {
  name        = "web-sg"
  description = "web-sg"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "ssh from my IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.myip]
  }

  ingress {
    description = "listen from alb"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.alb-sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_security_group" "database-sg" {
  name        = "database-sg"
  description = "allow inbound traffic from application layer"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "allow traffic from web-server"
    from_port       = 3306
    to_port         = 3306
    protocol        = "-1"
    security_groups = [aws_security_group.web-sg.id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}