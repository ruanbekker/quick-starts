output "id" {
  description = "The ec2 instance id"
  value       = aws_instance.ec2.id
  sensitive   = false
}

output "ip" {
  description = "The ec2 instance public ip address"
  value       = aws_instance.ec2.public_ip
  sensitive   = false
}

