data "archive_file" "magic_photo_zip" {
  type        = "zip"
  source_dir  = "./magic-photo-api"
  output_path = "magic_photo.zip"
}

resource "aws_lambda_function" "magic_photo_batch_load" {
  filename         = "magic_photo.zip"
  function_name    = "batch_load"
  role             = aws_iam_role.iam_for_lambda_with_dynamo_write_and_s3_read.arn
  handler          = "magic.handler"
  source_code_hash = data.archive_file.magic_photo_zip.output_base64sha256
  runtime          = "nodejs14.x"
}