
resource "aws_route53_record" "dkim" {
   count   = 3
   zone_id = var.route53_zone_id
   name    = format(
    "%s._domainkey.%s",
    element(aws_ses_domain_dkim._.dkim_tokens, count.index),
    var.domain,
  )
  type    = "CNAME"
  ttl     = "600"
  records = ["${element(aws_ses_domain_dkim._.dkim_tokens, count.index)}.dkim.amazonses.com"]
}

resource "aws_route53_record" "verification" {
  zone_id = var.route_53_zone_id
  name    = "_amazonses.${aws_ses_domain_identity._.id}"
  type    = "TXT"
  ttl     = "600"
  records = [aws_ses_domain_identity._.verification_token]
}

resource "aws_route53_record" "mx" {
  zone_id = var.route_53_zone_id
  name    = aws_ses_domain_mail_from._.mail_from_domain
  type    = "MX"
  ttl     = "600"
  records = ["10 feedback-smtp.us-east-1.amazonses.com"]
}

resource "aws_route53_record" "txt" {
  zone_id = var.route_53_zone_id
  name    = aws_ses_domain_mail_from._.mail_from_domain
  type    = "TXT"
  ttl     = "600"
  records = ["v=spf1 include:amazonses.com -all"]
}

resource "aws_ses_domain_identity" "_" {
  domain = var.domain
}

resource "aws_ses_domain_dkim" "_" {
  domain = aws_ses_domain_identity._.domain
}

resource "aws_ses_domain_identity_verification" "_" {
  domain = aws_ses_domain_identity._.id

  depends_on = [aws_route53_record.verification]
}

resource "aws_ses_domain_mail_from" "_" {
  domain           = aws_ses_domain_identity._.domain
  mail_from_domain = "bounce.${aws_ses_domain_identity._.domain}"
}

