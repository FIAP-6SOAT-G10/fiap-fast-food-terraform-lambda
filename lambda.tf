provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      tech-challenge-fase-3 = "fiap-fast-food-app"
    }
  }
}

resource "aws_lambda_function" "login" {
  function_name = "login"

  s3_bucket = aws_s3_bucket.login_bucket.id
  s3_key    = aws_s3_object.lambda_login.key

  runtime = "nodejs18.x"
  handler = "login"

  source_code_hash = data.archive_file.login.output_base64sha256
  role = "arn:aws:iam::968379224811:role/LabRole"
}

resource "aws_cloudwatch_log_group" "login" {
  name = "/aws/lambda/${aws_lambda_function.login.function_name}"
  retention_in_days = 30
}

resource "aws_lambda_permission" "login" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.login.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "${data.aws_apigatewayv2_api.api-gateway.execution_arn}/*/*"
}
