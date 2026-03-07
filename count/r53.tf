resource "aws_route53_record" "dev-ns" {

  count = length(var.instances)
  zone_id = var.zone_id
  #mongodb.dev.svjdevopsinfralab.online
  name    = "${var.instances[count.index]}.${var.ec2-tags["Environment"]}.${var.domain_name}"
  type    = "A"
  ttl     = "1"
  records = [aws_instance.roboshop[count.index].private_ip]

}