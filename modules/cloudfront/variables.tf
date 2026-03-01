variable "bucket_id" {
  description = "S3 bucket ID"
  type        = string
}

variable "bucket_regional_domain" {
  description = "S3 bucket regional domain name"
  type        = string
}

variable "origin_access_control_id" {
  description = "CloudFront Origin Access Control ID"
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
