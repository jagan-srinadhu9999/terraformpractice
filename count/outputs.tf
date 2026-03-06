#  output "ec2_instance_id" {
# description = "value of ec2 instance id"
# value = aws_instance.roboshop
  
# } 

# output "ec2_instances" {
#   value = [
#     for i, inst in aws_instance.roboshop : {
#       name       = var.instances[i]
#       id         = inst.id
#       public_ip  = inst.public_ip
#       private_ip = inst.private_ip
#     }
#   ]
# }

locals {
  ec2_data = aws_instance.roboshop[*]   # complete list of maps
}

# Print in terminal as list of maps
output "ec2_instances" {
  value = local.ec2_data
}

# Save to file
resource "local_file" "ec2_outputs" {
  filename   = "${path.module}/ec2_outputs.json"
  content    = jsonencode(local.ec2_data)
  depends_on = [aws_instance.roboshop]
}
# outputs.tf

# ✅ ONE output + ONE local_file
# Auto saves ONLY after all 10 instances are created
# No manual copy. No extra output block needed.

# resource "local_file" "ec2_outputs" {
  
#   # Waits for ALL instances to be ready — then saves
#   filename = "${path.module}/ec2_outputs.json"
  
#   content = jsonencode({
#     total_instances = length(aws_instance.roboshop)
#     created_at      = timestamp()
#     instances       = aws_instance.roboshop[*]   # ← dumps ALL attributes automatically
#   })

#   # Ensures file saves ONLY after all EC2s are created
#   depends_on = [aws_instance.roboshop]
# }
