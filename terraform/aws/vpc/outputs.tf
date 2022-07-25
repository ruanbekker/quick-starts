output vpcid {
  value       = aws_vpc.main.id
  sensitive   = false
  description = "the aws vpc id"
}

output private_subnet_1a {
  value       = aws_subnet.private_1a.id
  sensitive   = false
  description = "the private subnet-1a id"
}

output private_subnet_1b {
  value       = aws_subnet.private_1b.id
  sensitive   = false
  description = "the private subnet-1b id"
}

output private_subnet_1c {
  value       = aws_subnet.private_1c.id
  sensitive   = false
  description = "the private subnet-1c id"
}

output public_subnet_1a {
  value       = aws_subnet.public_1a.id
  sensitive   = false
  description = "the public subnet-1a id"
}

output public_subnet_1b {
  value       = aws_subnet.public_1b.id
  sensitive   = false
  description = "the public subnet-1b id"
}

output public_subnet_1c {
  value       = aws_subnet.public_1c.id
  sensitive   = false
  description = "the public subnet-1c id"
}

output natgw_ip {
  value       = aws_eip.nat.public_ip
  sensitive   = false
  description = "nat gateway elastic ip"
}
