

resource "aws_instance" "roboshop" {
  ami           = var.ami_id
  instance_type = var.instance_type
vpc_security_group_ids= [aws_security_group.allow_tls.id]

  tags = {
    Name = "terraform-example"
    Project= "roboshop"
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
    Name = "allow_all_terraform"
  }

}

  

