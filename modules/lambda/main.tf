
data "archive_file" "by_payment_methods_lambda" {
  type        = "zip"
  source_file = "${path.module}/by_payment_methods_lambda.py"
  output_path = "${path.module}/by_payment_methods_lambda.zip"
}

resource "aws_lambda_function" "by_payment_methods_lambda" {
  function_name = "payment-methods-count"
  role          = "arn:aws:iam::260073349210:role/service-role/pmendhe-Lambda-function"
  handler       = "categories_report.lambda_handler"
  runtime       = "python3.11"
  filename      = data.archive_file.by_payment_methods_lambda.output_path
  source_code_hash = data.archive_file.by_payment_methods_lambda.output_base64sha256
  timeout = 300
  layers = ["arn:aws:lambda:us-east-1:336392948345:layer:AWSSDKPandas-Python311:20"]
}


data "archive_file" "counts_report" {
  type        = "zip"
  source_file = "${path.module}/counts_report.py"
  output_path = "${path.module}/counts_report.zip"
}

resource "aws_lambda_function" "counts_report" {
  function_name = "counts_report"
  role          = "arn:aws:iam::260073349210:role/service-role/pmendhe-Lambda-function"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.11"
  filename      = data.archive_file.counts_report.output_path
  source_code_hash = data.archive_file.counts_report.output_base64sha256
  timeout = 300
  layers = ["arn:aws:lambda:us-east-1:336392948345:layer:AWSSDKPandas-Python311:20"]
}

data "archive_file" "categories_report" {
  type        = "zip"
  source_file = "${path.module}/categories_report.py"
  output_path = "${path.module}/categories_report.zip"
}

resource "aws_lambda_function" "categories_report" {
  function_name = "categories_report"
  role          = "arn:aws:iam::260073349210:role/service-role/pmendhe-Lambda-function"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.11"
  filename      = data.archive_file.categories_report.output_path
  source_code_hash = data.archive_file.categories_report.output_base64sha256
  timeout = 300
  layers = ["arn:aws:lambda:us-east-1:336392948345:layer:AWSSDKPandas-Python311:20"]
}

data "archive_file" "Trigger_Step_Function" {
  type        = "zip"
  source_file = "${path.module}/Trigger_Step_Function.py"
  output_path = "${path.module}/Trigger_Step_Function.zip"
}

resource "aws_lambda_function" "Trigger_Step_Function" {
  function_name = "pmendhe_Trigger_Step_Function"
  role          = "arn:aws:iam::260073349210:role/service-role/pmendhe-Lambda-function"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.11"
  filename      = data.archive_file.Trigger_Step_Function.output_path
  source_code_hash = data.archive_file.Trigger_Step_Function.output_base64sha256
  timeout = 60
  
}
