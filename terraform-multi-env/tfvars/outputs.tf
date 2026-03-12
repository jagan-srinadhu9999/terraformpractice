output "instance_details" {
  value = {
    for k, inst in aws_instance.roboshop : k => {
      id            = inst.id
      public_ip     = inst.public_ip
      private_ip    = inst.private_ip
      instance_type = inst.instance_type
      volume_size   = inst.root_block_device[0].volume_size
    }
  }
}