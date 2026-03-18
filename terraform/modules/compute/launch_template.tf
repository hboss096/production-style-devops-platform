resource "aws_launch_template" "web" {
  name_prefix   = "${var.project_name}-lt"
  image_id      = var.ami_id
  instance_type = "t3.micro"
  key_name      = var.key_name

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.web_sg.id]
  }

  user_data = base64encode(<<-EOF
              #!/bin/bash
              yum update -y
              yum install nginx -y
              systemctl start nginx
              systemctl enable nginx
              echo "Version 2 deployed via pipeline 🚀" > /usr/share/nginx/html/index.html
              EOF
  )
}
