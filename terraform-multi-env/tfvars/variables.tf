variable "environment" {
  type = string
}

# variable "instance_type" {
#   type = string
# }

# ── Map of Objects — instances with full config ────────
variable "instances" {
  type = map(object({
    instance_type = string
    volume_size   = number
  }))
}

variable "project" {
  type = string
  default = "roboshop"
}

variable "security_group_name" {
  type = string
  default = "allow_trafic_tls" 
  
}
variable "sg_description" {
  type = string
  default = "Allow TLS traffic"
}