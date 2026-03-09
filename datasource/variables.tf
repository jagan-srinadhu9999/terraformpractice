variable "instances" {
    type= map(string)
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

variable "ec2_tags" {
  type = map(string)
    default = {
        Name = "terraform-example"
        Project= "roboshop"
        Terraform = "true"
        Environment = "dev"
    }
}

variable "ingress_rules" {
  description = "A map of services and the ports they need open"
  type = map(object({
    from_port = number
    to_port = number
  }))

  default = {
    ssh  ={from_port = 22, to_port = 22}
    http = {from_port = 80, to_port = 80}
    https = {from_port = 443, to_port = 443}
   # cidr_blocks = ["0.0.0.0/0"]
  }

}

variable "security_group_name" {
  type = string
  default = "allow_trafic_tls" 
}
variable "sg_description" {
  type = string
  default = "Allow TLS inbound traffic and all outbound traffic"
}

variable "zone_id" {
  type = string
  default = "Z020759124EBIDMP7BTBM"
}

variable "domain_name" {
  type = string
  default = "svjdevopsinfralab.online"
}

variable "vpc" {
  type = string
  default = "vpc-084c0c7810c71b908"
}

variable "ami_id" {
  default = "ami-0220d79f3f480ecf5"     
}