data "aws_route53_zone" "selected" {
  count = var.hostname_create && var.hosted_zone != "" ? 1 : 0
  name  = var.hosted_zone
}

resource "aws_route53_record" "hostname" {
  count   = var.hostname_create ? 1 : 0
  zone_id = var.hosted_zone_id != "" ? var.hosted_zone_id : data.aws_route53_zone.selected.*.zone_id[0]
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = aws_lb.ecs.dns_name
    zone_id                = aws_lb.ecs.zone_id
    evaluate_target_health = true
  }
}