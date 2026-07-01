output "public_web_security_group_id" {
  value = aws_security_group.public_web.id
}

output "application_security_group_id" {
  value = aws_security_group.application.id
}

output "database_security_group_id" {
  value = aws_security_group.database.id
}
