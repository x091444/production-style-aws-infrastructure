variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Project name used for resource tagging"
  type        = string
  default     = "production-style-aws-infrastructure"
}

variable "environment" {
  description = "deployment environment"
  type        = string
  default     = "dev"
}