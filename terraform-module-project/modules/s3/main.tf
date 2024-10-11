resource "aws_s3_bucket" "app_bucket" {
  bucket = "app-storage-${var.bucket_name_suffix}"
  acl    = "private"
}
