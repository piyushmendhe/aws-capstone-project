resource "aws_s3_bucket" "source_bucket" {
  bucket = "pmendhe-capstone-source"
  force_destroy = true
}

resource "aws_s3_bucket" "target_bucket" {
  bucket = "pmendhe-capstone-target"
  force_destroy = true
}