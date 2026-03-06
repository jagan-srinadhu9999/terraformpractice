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