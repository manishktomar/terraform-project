# Security Group for Backend Servers
resource "aws_security_group" "backend_sg" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.web_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance for Backend Services
resource "aws_instance" "backend_instance" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = var.backend_instance_type
  subnet_id     = aws_subnet.private.id
  security_groups = [aws_security_group.backend_sg.id]

  tags = {
    Name = "backend-server"
  }
}
