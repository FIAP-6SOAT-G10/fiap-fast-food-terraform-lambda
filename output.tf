# Output value definitions
output "lambda_bucket_name" {
  description = "Name of the S3 bucket used to store AWS Lambda function code. "
  value = aws_s3_bucket.login_bucket.id
}

output "function_name" {
  description = "AWS Lambda to perform login and authentication accordingly to username"
  value = aws_lambda_function.login.function_name
}