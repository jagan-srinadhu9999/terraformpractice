variable "instances" {
    type= map
    default = {
        mongodb = "t3.micro"
        mysql = "t3.small"
        redis = "t3.micro"
        rabbitmq = "t3.micro"  
        catalogue = "t3.micro"
        # user = "t3.micro"
        # cart = "t3.micro"
        # payment = "t3.small"
        # shipping = "t3.micro"
        # frontend = "t3.micro"
    }

}

variable "ec2-tags" {
  type = map(string)
  default = {
    Name = "terraform-example"
    Project= "roboshop"
    Terraform = "true"
    Environment = "dev"
  }
}

#route53 zone id

variable "zone_id" {
  type = string
  default = "Z020759124EBIDMP7BTBM"
}

variable "domain_name" {
  type = string
  default = "svjdevopsinfralab.online"
}

variable "ami_id" {
    type = string
    default = "ami-0220d79f3f480ecf5"
  
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

