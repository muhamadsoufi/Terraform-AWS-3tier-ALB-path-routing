module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "6.1.1"

  domain_name  = trimsuffix(data.aws_route53_zone.mydomain.name, ".")   
  zone_id      = data.aws_route53_zone.mydomain.zone_id

  validation_method = "DNS"

  subject_alternative_names = [
    "*.cicd.click"
  ]

  wait_for_validation = true

  tags = local.common_tags
}
