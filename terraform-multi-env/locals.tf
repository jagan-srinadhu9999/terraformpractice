locals {
  
  ami_id = data.aws_ami.joindevops.id
 # instance_type = "t2.micro"
  project     = "roboshop"
  environment = terraform.workspace

 common_tags = {
    Project     = local.project
    Environment = local.environment
    Terraform   = "true"
  }

   ec2_tags = merge(local.common_tags, {
    Name = "roboshop-${local.environment}"
  })

  sg_tags = merge(local.common_tags, {
    Name = "allow_tls_${local.environment}"
  })
}

# locals.tf
#instance type for each instance
locals {
  instances = {
    mongodb = {
      instance_type = "t3.micro"
      disk_size     = 20
      
    }
    mysql = {
      instance_type = "t3.small"
      disk_size     = 50
    }
    redis = {
      instance_type = "t3.micro"
      
      disk_size     = 20
    }
    rabbitmq = {
      instance_type = "t3.micro"
      
      disk_size     = 20
    }
    catalogue = {
      instance_type = "t3.micro"
     
      disk_size     = 20
    }
  }
}