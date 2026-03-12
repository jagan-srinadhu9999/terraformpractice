

resource "aws_instance" "roboshop" {
    for_each = var.instances
  ami           = local.ami_id
  #lookup function to get the instance type based on the environment
 # instance_type = lookup(var.instance_type, local.environment)
 instance_type = each.value.instance_type
vpc_security_group_ids= [aws_security_group.allow_tls.id]

  tags = {
    Name = "${each.key}-${var.project}-${var.environment}"
    Project= var.project
    environment = var.environment
  }
}

resource "aws_security_group" "allow_tls" {

  name        = "${var.security_group_name}-${var.environment}"
  description = var.sg_description

egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
 dynamic "ingress" {
    for_each = local.ingress_rules
    content {
    from_port        = ingress.value.from_port
    to_port          = ingress.value.to_port
    protocol         = ingress.value.protocol
    cidr_blocks      = ["0.0.0.0/0"]
   # ipv6_cidr_blocks = ["::/0"]
    }
    
  }
  tags = {
   # Name = "allow_all_terraform-${local.environment}"
    Name = "allow_all_terraform-${var.environment}"
  }

}

  

