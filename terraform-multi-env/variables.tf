
variable "instance_type" {
    #pass this map into the lookup function in ec2.tf to get the instance type based on the environment
    type = map(string)
    default = {
        dev = "t3.micro"
        uat = "t3.small"
        prod = "t3.medium"
    }
        # mongodb = "t3.micro"
        # mysql = "t3.small"
        # redis = "t3.micro"
        # rabbitmq = "t3.micro"  
        # catalogue = "t3.micro"
        # # user = "t3.micro"
        # # cart = "t3.micro"
        # # payment = "t3.small"
        # # shipping = "t3.micro"
        # # frontend = "t3.micro"
    }
  
variable "security_group_name" {
  type = string
  default = "allow_trafic_tls" 
  
}
variable "sg_description" {
  type = string
  default = "Allow TLS traffic"
}
variable "project" {
    default = "roboshop"
}