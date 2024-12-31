output "vpc_id" {
  value = aws_vpc.main.id
}

output "staging_subnet_id" {
  value = aws_subnet.staging.id
}

output "production_subnet_id" {
  value = aws_subnet.production.id
}

output "staging_security_group_id" {
  value = aws_security_group.staging_sg.id
}

output "production_security_group_id" {
  value = aws_security_group.production_sg.id
}
