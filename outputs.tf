output "aws_ses_domain_identity_arn" {
  value = aws_ses_domain_identity._.arn
}

output "aws_ses_email_identity_arn" {
  value = aws_ses_email_identity.noreply.arn
}