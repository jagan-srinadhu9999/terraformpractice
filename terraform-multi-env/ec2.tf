

resource "aws_instance" "roboshop" {
  ami           = local.ami_id
  #lookup function to get the instance type based on the environment
  instance_type = lookup(var.instance_type, local.environment)
vpc_security_group_ids= [aws_security_group.allow_tls.id]

  tags = {
    Name = "${local.project}-${local.environment}"
    Project= local.project
    environment = local.environment
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "${var.security_group_name}-${local.environment}"
  description = var.sg_description

egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
   # Name = "allow_all_terraform-${local.environment}"
    Name = "allow_all_terraform-${local.environment}"
  }

}

  

