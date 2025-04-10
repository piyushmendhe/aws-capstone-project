provider "aws" {
  region = "us-east-1"
}

module "glue_jobs" {
  source = "./modules/glue"
}

module "step_function" {
  source = "./modules/step_function"
}

module "lambda" {
  source = "./modules/lambda"
}

module "s3" {
  source = "./modules/s3"
}

module "Crawler" {
  source = "./modules/crawler"
}

