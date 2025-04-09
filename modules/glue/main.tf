resource "aws_glue_job" "spending-per-category" {
  name     = "spending-per-category"
  role_arn = "arn:aws:iam::260073349210:role/pmendhe-Glue-role"

  command {
    name            = "glueetl"
    script_location = "s3://aws-glue-assets-260073349210-us-east-1/scripts/spending-per-category.py"
    python_version  = "3"

  }
  execution_class           = "STANDARD"
  max_retries        = 0
  timeout            = 480
  number_of_workers  = 2
  worker_type        = "G.1X"

  default_arguments = {
    "--TempDir"                        = "s3://aws-glue-assets-260073349210-us-east-1/temporary/"
    "--job-language"                   = "python"
    "--enable-continuous-cloudwatch-log" = "true"
    "--enable-glue-datacatalog"          = "true"
    "--enable-job-insights"              = "true" 
    "--enable-metrics"                   = "true" 
    "--enable-observability-metrics"     = "true" 
    "--enable-spark-ui"                  = "true"
    "--job-bookmark-option"              = "job-bookmark-disable" 
    "--spark-event-logs-path"            = "s3://aws-glue-assets-260073349210-us-east-1/sparkHistoryLogs/" 
  }

}


resource "aws_glue_job" "top_spenders" {
  name     = "top_spenders"
  role_arn = "arn:aws:iam::260073349210:role/pmendhe-Glue-role"

  command {
    name            = "glueetl"
    script_location = "s3://aws-glue-assets-260073349210-us-east-1/scripts/top_spenders.py"
    python_version  = "3"

  }
  execution_class           = "STANDARD"
  max_retries        = 0
  timeout            = 480
  number_of_workers  = 2
  worker_type        = "G.1X"

  default_arguments = {
    "--TempDir"                        = "s3://aws-glue-assets-260073349210-us-east-1/temporary/"
    "--job-language"                   = "python"
    "--enable-continuous-cloudwatch-log" = "true"
    "--enable-glue-datacatalog"          = "true"
    "--enable-job-insights"              = "true" 
    "--enable-metrics"                   = "true" 
    "--enable-observability-metrics"     = "true" 
    "--enable-spark-ui"                  = "true"
    "--job-bookmark-option"              = "job-bookmark-disable" 
    "--spark-event-logs-path"            = "s3://aws-glue-assets-260073349210-us-east-1/sparkHistoryLogs/" 
  }

}


resource "aws_glue_job" "Orders_Transformed" {
  name     = "Orders_Transformed"
  role_arn = "arn:aws:iam::260073349210:role/pmendhe-Glue-role"

  command {
    name            = "glueetl"
    script_location = "s3://aws-glue-assets-260073349210-us-east-1/scripts/Orders_Transformed.py"
    python_version  = "3"

  }
  execution_class           = "STANDARD"
  max_retries        = 0
  timeout            = 480
  number_of_workers  = 2
  worker_type        = "G.1X"

  default_arguments = {
    "--TempDir"                        = "s3://aws-glue-assets-260073349210-us-east-1/temporary/"
    "--job-language"                   = "python"
    "--enable-continuous-cloudwatch-log" = "true"
    "--enable-glue-datacatalog"          = "true"
    "--enable-job-insights"              = "true" 
    "--enable-metrics"                   = "true" 
    "--enable-observability-metrics"     = "true" 
    "--enable-spark-ui"                  = "true"
    "--job-bookmark-option"              = "job-bookmark-disable" 
    "--spark-event-logs-path"            = "s3://aws-glue-assets-260073349210-us-east-1/sparkHistoryLogs/" 
  }

}


resource "aws_glue_job" "Customer_transformed" {
  name     = "Customer_transformed"
  role_arn = "arn:aws:iam::260073349210:role/pmendhe-Glue-role"

  command {
    name            = "glueetl"
    script_location = "s3://aws-glue-assets-260073349210-us-east-1/scripts/Customer_transformed.py"
    python_version  = "3"

  }
  execution_class           = "STANDARD"
  max_retries        = 0
  timeout            = 480
  number_of_workers  = 2
  worker_type        = "G.1X"

  default_arguments = {
    "--TempDir"                        = "s3://aws-glue-assets-260073349210-us-east-1/temporary/"
    "--job-language"                   = "python"
    "--enable-continuous-cloudwatch-log" = "true"
    "--enable-glue-datacatalog"          = "true"
    "--enable-job-insights"              = "true" 
    "--enable-metrics"                   = "true" 
    "--enable-observability-metrics"     = "true" 
    "--enable-spark-ui"                  = "true"
    "--job-bookmark-option"              = "job-bookmark-disable" 
    "--spark-event-logs-path"            = "s3://aws-glue-assets-260073349210-us-east-1/sparkHistoryLogs/" 
  }

}