variable "instances" {
  type = list(string)
  default = ["mongodb","redis","mysql","rabbitmq","catalogue","user","cart","payment","shipping","frontend"]
}

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

variable "ec2-tags" {
  type = map(string)
  default = {
    Name = "terraform-example"
    Project= "roboshop"
    Terraform = "true"
    Environment = "dev"
  }
}