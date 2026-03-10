variable "environment" {
  type = string
    default = "dev"
}

variable "security_group_name" {
  type = string
  default = "allow_trafic_tls" 
}

variable "sg_description" {
  type = string
  default = "Allow TLS inbound traffic and all outbound traffic"
}

#sg ingress rules
variable "ingress_rules" {
  description = "A map of services and the ports they need open"
  type        = map(number)
  default = {
    ssh  = 22
    http = 80
    https = 443
   # cidr_blocks = ["0.0.0.0/0"]
  }
}

variable "ec2_tags" {
  default = {
    Name = "terraform-example"
    Project= "roboshop"
    Terraform = "true"
    Environment = "dev"
  }
}
variable "sg_tags" {
  default = {
    Name = "allow_all_terraform"
    Project= "roboshop"
    Terraform = "true"}
}