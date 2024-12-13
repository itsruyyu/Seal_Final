resource "random_pet" "unique_suffix" {
  length    = 2
  separator = "-"
}



resource "aws_s3_bucket" "this" {
  bucket = "${var.bucket_name}-${random_pet.unique_suffix.id}"
  acl    = "private"

  tags = {
    Name = "${var.bucket_name}-${random_pet.unique_suffix.id}"
  }
}
