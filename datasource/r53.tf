resource "aws_route53_record" "www" {
    for_each = var.instances
  zone_id = var.zone_id
  #mongodb.dev.svjdevopsinfralab.online
  name    = "${each.key}.${var.ec2_tags["Environment"]}.${var.domain_name}"
  type    = "A"
  ttl     = "1"
  records = [aws_instance.roboshop[each.key].private_ip]
}
