
variable "bucket_name" {
  nullable = false
  type    = string
  description = "Name of the storage bucket. This must be globally unique and can contain only lowercase letters and numbers. It must be between 3 and 24 characters long."
}
