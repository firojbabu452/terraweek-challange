output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "security_group_id" {
  value = aws_security_group.web.id
}

output "ami_used" {
  value = data.aws_ami.amazon_linux_2023.id
}

output "availability_zones_in_region" {
  value = data.aws_availability_zones.available.names
}

output "main_instance_public_ip" {
  value = aws_instance.main.public_ip
}

output "count_example_public_ips" {
  value = aws_instance.count_example[*].public_ip
}

output "named_instance_public_ips" {
  value = { for k, inst in aws_instance.named : k => inst.public_ip }
}