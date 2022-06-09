data "aws_iam_policy_document" "AWS" {

}
resource "aws_iam_role" "basic_iam_for_lambda" {
  name = "iam_for_lambda"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Sid    = ""
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}
resource "aws_iam_role" "iam_for_lambda_with_dynamo_write_and_s3_read" {
  name = "iam_for_lambda_dynamo_write_s3_read"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Sid    = ""
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy" "dynamodb-write-and-s3-read-policy" {
  name = "dynamodb_write_lambda_policy"
  role = aws_iam_role.iam_for_lambda_with_dynamo_write_and_s3_read.id
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : var.dynamo_write_action_list,
        "Resource" : "${aws_dynamodb_table.photos-table.arn}"
      }
    ]
  })
}
resource "aws_iam_role_policy" "dynamodb-lambda-policy" {
  name = "dynamodb_read_lambda_policy"
  role = aws_iam_role.basic_iam_for_lambda.id
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : var.dynamo_read_action_list,
        "Resource" : "${aws_dynamodb_table.photos-table.arn}"
      }
    ]
  })
}