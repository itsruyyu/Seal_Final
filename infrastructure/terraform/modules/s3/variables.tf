variable "project_name" {
  description = "Project name for tagging"
  type        = string
}

variable "environment" {
  description = "Environment for tagging (e.g., dev, staging, prod)"
  type        = string
}

variable "acl" {
  description = "ACL policy for S3 bucket"
  type        = string
  default     = "private"
}

variable "force_destroy" {
  description = "Whether to allow forced destruction of the bucket"
  type        = bool
  default     = false
}

variable "versioning" {
  description = "Enable versioning for the bucket"
  type        = bool
  default     = true
}

variable "bucket_policy" {
  description = "JSON policy for the bucket. Empty by default as it is managed in the root module."
  type        = string
  default     = ""
}
