# Application Load Balancer
resource "aws_lb" "app_lb" {
  name               = "app-lb"
  load_balancer_type = "application"
  internal           = false
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = aws_subnet.public_subnet[*].id
  depends_on         = [aws_internet_gateway.igw_vpc]
}

# Target Group for ALB
resource "aws_lb_target_group" "alb_ec2_tg" {
  name     = "web-server-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id
  tags = {
    Name = "alb_ec2_tg"
  }
}

# listener for alb
resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.app_lb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_ec2_tg.arn
  }
  tags = {
    Name = "alb-listener"
  }
}