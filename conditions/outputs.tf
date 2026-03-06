output "ec2_instance_id" {
description = "value of ec2 instance id"
value = aws_instance.roboshop.id
  
}

output "ec2_public_ip" {
  value = aws_instance.roboshop.public_dns
}

output "ec2_private_ip" {
  value = aws_instance.roboshop.private_dns
}
output "sg_id" {
  value = aws_security_group.allow_tls.id
}

output "vpc_id" {
  value = aws_security_group.allow_tls.vpc_id
  
}