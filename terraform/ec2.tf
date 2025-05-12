# Launch Template for EC2 Instances
resource "aws_launch_template" "ec2_launch_template" {
  name = "web-server"

  image_id      = "ami-0f88e80871fd81e91" //Copy the ami id from aws console
  instance_type = "t2.micro"

  network_interfaces {
    associate_public_ip_address = false
    security_groups             = [aws_security_group.ec2_sg.id]
  }

  user_data = filebase64("userdata.sh")

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "ec2-web-server"
    }
  }
}
