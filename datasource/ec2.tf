resource "aws_instance" "roboshop" {
  for_each = var.instances
  #ami           = var.ami_id
  ami = data.aws_ami.joindevops.id
  instance_type = each.value
vpc_security_group_ids= [aws_security_group.allow_tls.id]

  tags = {
    Name = "${each.key}-${var.ec2_tags["Project"]}-${var.ec2_tags["Environment"]}"
    Project= var.ec2_tags["Project"]
    Environment = var.ec2_tags["Environment"]
    Service = each.key
  }
}

resource "aws_security_group" "allow_tls" {
  name        = var.security_group_name
  description = var.sg_description

egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
   # ipv6_cidr_blocks = ["::/0"]
  }

  dynamic "ingress" {
    for_each = var.ingress_rules
    content{
    description = ingress.key
    from_port        = ingress.value.from_port
    to_port          = ingress.value.to_port
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
   # ipv6_cidr_blocks = ["::/0"]
  }
}
  
  tags = {
    Name = "allow_all_terraform_roboshop_dev_sg"
  }

# ── Ensure SG created before EC2 ────────────────────
  depends_on = [aws_security_group.allow_tls]

}

# resource "aws_vpc" "roboshop-vpc" {
#   cidr_block       = "10.0.0.0/16"
#   instance_tenancy = "default"

#   tags = {
#     Name = "main"
#   }
# }