data "archive_file" "hello_world_zip" {
  type        = "zip"
  source_dir  = "./hello-world"
  output_path = "hello_world_function.zip"
}

resource "aws_lambda_function" "hello_world" {
  filename         = "hello_world_function.zip"
  function_name    = "hello_world"
  role             = aws_iam_role.iam_for_lambda.arn
  handler          = "hello.handler"
  source_code_hash = data.archive_file.hello_world_zip.output_base64sha256
  runtime          = "nodejs14.x"
}