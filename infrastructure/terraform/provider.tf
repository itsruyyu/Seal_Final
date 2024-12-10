provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

variable "aws_region" {
  description = "AWS region for the infrastructure"
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS CLI profile name"
  default     = "default"
}
