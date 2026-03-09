resource "aws_instance" "roboshop" {

    for_each = var.instances
  ami           = var.ami_id
  instance_type = each.value
vpc_security_group_ids= [aws_security_group.allow_tls.id]

  tags = {

    Name = "${each.key}-${var.ec2-tags["Project"]}-${var.ec2-tags["Environment"]}"
    Project= "roboshop"
  }
}

resource "aws_security_group" "allow_tls" {
  name        = var.security_group_name
  description = var.sg_description

egress {
    from_port        = 0
    to_port          = 0
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  dynamic "ingress" {
    for_each = var.ingress_rules
    content{
      description = ingress.key
    from_port        = ingress.value
    to_port          = ingress.value
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
   # ipv6_cidr_blocks = ["::/0"]
  }
}
  
  tags = {
    Name = "allow_all_terraform_roboshop_dev_sg"
  }

}
