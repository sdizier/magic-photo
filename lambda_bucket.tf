resource "random_pet" "lambda_bucket_name" {
  prefix = "magic-photos"
  length = 4
}

resource "aws_s3_bucket" "lambda_bucket" {
  bucket = random_pet.lambda_bucket_name.id

  force_destroy = true
}
resource "aws_s3_bucket_acl" "lambda_bucket_acl" {
  bucket = random_pet.lambda_bucket_name.id

  acl = "private"
}
