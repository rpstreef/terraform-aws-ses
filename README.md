# AWS Simple Email Service (SES) Terraform Module

## Introduction

This module configures AWS SES and Route53 ready for use with any service that may require email sending such as AWS Cognito.

## Configuration

``master`` branch is the latest version of this module, otherwise use the ``?ref=`` parameter to specify which version you want to use. 

E.g.:

```terraform
module "ses" {
  source = "github.com/rpstreef/terraform-aws-ses?ref=v1.1"

  ...
}
```
