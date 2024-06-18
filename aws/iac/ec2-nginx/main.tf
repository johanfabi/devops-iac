# Terraform main configuration file
resource "aws_instance" "nginx_server" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = var.server_name
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y nginx
              echo 'Hello World' > /var/www/html/index.nginx-debian.html
              EOF

  key_name = var.key_name # Reemplaza con tu par de claves

  # Configuración del grupo de seguridad para permitir tráfico HTTP
  vpc_security_group_ids = [aws_security_group.nginx_sg.id]
}

resource "aws_security_group" "nginx_sg" {
  name        = var.security_group_name
  description = "Allow HTTP inbound traffic"

  ingress {
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
}