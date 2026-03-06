variable "ami_id" {
  type = string
  default = "ami-0220d79f3f480ecf5"
}

variable "instance_type" {
  type = string
  default = "t3.micro"
}

variable "security_group_name" {
  type = string
  default = "allow_trafic_tls" 
}

variable "sg_description" {
  type = string
  default = "Allow TLS inbound traffic and all outbound traffic"
}

variable "sg_egress_from_port" {
  type = number
  default = 0
  
}
variable "sg_egress_to_port" {
  type = number
  default = 0
  
}

variable "sg_egress_cidr_blocks" {
  type = list(string)
  default = ["0.0.0.0/0"]
}

variable "sg_ingress_from_port" {
  type = number
  default = 0 
  
}
variable "sg_ingress_to_port" {
  type = number
  default = 0
}
variable "sg_ingress_cidr_blocks" {
  type = list(string)
  default = ["0.0.0.0/0"]
}

variable "environment" {
  type = string
  default = "dev"
}

variable "ec2-tags" {
  type = map(string)
  default = {
    Name = "terraform-example"
    Project= "roboshop"
    Terraform = "true"
    Environment = "prod"
  }
}

  variable "sg-tags" {
    type = map(string)
    default = {
      Name = "allow_all_terraform"
      Terraform = "true"
      Environment = "prod"
    }

  
}

