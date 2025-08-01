resource "aws_security_group" "sg-demo" {
  name        = "alb-go"
  vpc_id      = aws_vpc.vpc1.id
  description = "Allow httpd"



  ingress {
    description = "allow http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    env = "Dev"
  }

  depends_on = [aws_vpc.vpc1]
}

# EC2-sg

resource "aws_security_group" "sg-demo1" {
  name        = "web-sg"
  vpc_id      = aws_vpc.vpc1.id
  description = "Allow and httpd"



  ingress {
    description = "allow http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    //cidr_blocks = ["0.0.0.0/0"]
    security_groups = [aws_security_group.sg-demo.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    env = "Dev"
  }

  depends_on = [aws_vpc.vpc1, aws_security_group.sg-demo]
}