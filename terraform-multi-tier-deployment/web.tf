# Security Group for Frontend Web Servers
resource "aws_security_group" "web_sg" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# ALB for Frontend
resource "aws_lb" "frontend_alb" {
  name               = "frontend-alb"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.web_sg.id]
  subnets            = [aws_subnet.public.id]
}

resource "aws_lb_listener" "frontend_listener" {
  load_balancer_arn = aws_lb.frontend_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "404 Not Found"
      status_code  = "404"
    }
  }
}

# Auto Scaling Group for Frontend
resource "aws_autoscaling_group" "frontend_asg" {
  vpc_zone_identifier = [aws_subnet.public.id]
  desired_capacity    = 2
  max_size            = 4
  min_size            = 1
  launch_configuration = aws_launch_configuration.frontend_lc.id

  tag {
    key                 = "Name"
    value               = "frontend-server"
    propagate_at_launch = true
  }
}

resource "aws_launch_configuration" "frontend_lc" {
  image_id      = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI
  instance_type = var.frontend_instance_type
  security_groups = [aws_security_group.web_sg.id]

  lifecycle {
    create_before_destroy = true
  }
}
