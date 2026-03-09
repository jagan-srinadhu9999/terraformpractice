output "default_vpc_id" {
  value = data.aws_vpc.default.id
}

output "default_vpc_cidr" {
  value = data.aws_vpc.default.cidr_block
}

output "joindevops_ami" {
  value = data.aws_ami.joindevops.id
}

output "joindevops_ami_name" {
  value = data.aws_ami.joindevops.name
}

output "joindevops_root_device_type" {
  value = data.aws_ami.joindevops.root_device_type
}