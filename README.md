# AWS Simple Email Service (SES) Terraform Module

## Introduction

This module configures AWS SES and Route53 ready for use with any service that may require email sending such as AWS Cognito.

## Configuration

To get the latest version, use the ``master`` branch, otherwise use the ``?ref=`` parameter to specify which version you want to use.

```terraform
module "ses" {
  source = "github.com/rpstreef/terraform-aws-ses?ref=v1.0"

  route53_zone_id = "Z141234029XXPUKGZ57OJ"
  domain           = "somedomain.com"
}
```
