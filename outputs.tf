# Output value definitions

output "lambda_bucket_name" {
  description = "Name of the S3 bucket used to store function code."

  value = aws_s3_bucket.lambda_bucket.id
}

output "hello_world_lambda_function" {
  description = "The hello world lambda function"
  value       = aws_lambda_function.hello_world.function_name
}
output "photo_table_dynamo" {
  description = "A DynamoDB table to store photos"
  value       = aws_dynamodb_table.photos-table.name 
}

output "base_url" {
  description = "Base URL for API Gateway stage"
  value       = aws_apigatewayv2_stage.lmabda.invoke_url
}
