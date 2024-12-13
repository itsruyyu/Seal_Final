resource "random_pet" "unique_suffix" {
  length    = 2
  separator = "-"
}

resource "aws_s3_bucket" "this" {
  bucket = "${var.bucket_name}-${random_pet.unique_suffix.id}"

  tags = {
    Name = "${var.bucket_name}-${random_pet.unique_suffix.id}"
  }
}

resource "aws_s3_bucket_acl" "this" {
  bucket = aws_s3_bucket.this.id
  acl    = "private"
}

