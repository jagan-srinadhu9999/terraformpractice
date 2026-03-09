resource "aws_instance" "roboshop" {
    /*without hardcoding the count number we just send the length of the list of instances 
    and it will create as many instances as the number of items in the list*/

    count = length(var.instances)
  ami           = var.ami_id
  instance_type = var.instance_type
vpc_security_group_ids= [aws_security_group.allow_tls.id]

  tags = {
    #name = mogodb-roboshop-dev and here we are using the count index to get the name of the instance from the list and also using the project and environment from the tags variable
    Name = "${var.instances[count.index]}-${var.ec2-tags["Project"]}-${var.ec2-tags["Environment"]}"
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
    Name = "allow_all_terraform_roboshop_dev_sg"
  }

}
