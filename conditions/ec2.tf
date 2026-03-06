

resource "aws_instance" "roboshop" {
  ami           = var.ami_id
 # instance_type = var.instance_type
 #condition for if dev environment then t3.micro else t3.small
 instance_type = var.environment == "dev" ? "t3.micro" : "t3.small"

vpc_security_group_ids= [aws_security_group.allow_tls.id]

  # tags = {
  #   Name = "terraform-example"
  #   Project= "roboshop"
  # }
  tags = var.ec2-tags
}

resource "aws_security_group" "allow_tls" {
  name        = var.security_group_name
  description = var.sg_description

egress {
    from_port        = var.sg_egress_from_port
    to_port          = var.sg_egress_to_port
    protocol         = "-1"
    cidr_blocks      = var.sg_egress_cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    from_port        = var.sg_ingress_from_port
    to_port          = var.sg_ingress_to_port
    protocol         = "-1"
    cidr_blocks      = var.sg_ingress_cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }
  # tags = {
  #   Name = "allow_all_terraform"
  # }
   tags = var.sg-tags
}

  

