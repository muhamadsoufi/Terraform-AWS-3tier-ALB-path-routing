resource "aws_route53_record" "apps" {
  zone_id = data.aws_route53_zone.mydomain.zone_id  # reference your existing hosted zone
  name    = "apps"                              # will create apps.example.com
  type    = "A"

  alias {
    name                   = module.alb.dns_name
    zone_id                = module.alb.zone_id
    evaluate_target_health = true
  }
}
