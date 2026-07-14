############################################
# Task 3: the EC2 instance from the starter stack
############################################

resource "aws_instance" "main" {
  ami                    = data.aws_ami.amazon_linux_2023.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.web.id]

  # Bonus: installs Nginx on boot so you have something to curl
  user_data = <<-EOF
    #!/bin/bash
    dnf update -y
    dnf install -y nginx
    systemctl enable nginx
    systemctl start nginx
    echo "Hello from $(hostname -f)" > /usr/share/nginx/html/index.html
  EOF

  tags = {
    Name = "${var.project_name}-main"
  }
}


resource "aws_instance" "count_example" {
  count = var.instance_count

  ami                    = data.aws_ami.amazon_linux_2023.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.web.id]

  tags = {
    Name = "${var.project_name}-count-${count.index}"
  }
}


resource "aws_instance" "named" {
  for_each = var.instance_names

  ami                    = data.aws_ami.amazon_linux_2023.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.web.id]


  depends_on = [aws_internet_gateway.igw]

  ############################################
  # Task 4d: lifecycle
  ############################################
  lifecycle {
    # Build the replacement BEFORE destroying the old one, so there's no
    # gap in availability during a forced replace.
    create_before_destroy = true

    ignore_changes = [tags["LastModified"]]


  }

  tags = {
    Name = each.key
    Role = each.value
  }
}