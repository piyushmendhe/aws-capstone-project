resource "aws_glue_catalog_database" "pmendhe_capstone_report" {
  name = "pmendhe_capstone_report"
}

resource "aws_glue_catalog_database" "pmendhe_capstone_source" {
  name = "pmendhe_capstone_source"
}

resource "aws_glue_catalog_database" "pmendhe_capstone_target" {
  name = "pmendhe_capstone_target"
}


# Glue Crawler
resource "aws_glue_crawler" "pmendhe_capstone_source" {
  name          = "pmendhe_capstone_source"
  role          = "pmendhe-Glue-role"
  database_name = aws_glue_catalog_database.pmendhe_capstone_source.name
  tags                   = {}

    lake_formation_configuration {
         use_lake_formation_credentials = false 
          
        }
    lineage_configuration {
          crawler_lineage_settings = "DISABLE"
        }
    recrawl_policy {
        recrawl_behavior = "CRAWL_EVERYTHING"
        }
    s3_target {
    exclusions          = []
    path = "s3://pmendhe-capstone-source/ecommerce/"

  }

  classifiers   = []

  configuration = jsonencode({
    Version = 1.0
    CreatePartitionIndex = true
     
  })

  schema_change_policy {
        delete_behavior = "DEPRECATE_IN_DATABASE" 
        update_behavior = "UPDATE_IN_DATABASE"
        }

}

resource "aws_glue_crawler" "pmendhe_capstone_report" {
  name          = "pmendhe_capstone_report"
  role          = "pmendhe-Glue-role"
  database_name = aws_glue_catalog_database.pmendhe_capstone_report.name
  tags                   = {}

    lake_formation_configuration {
         use_lake_formation_credentials = false 
          
        }
    lineage_configuration {
          crawler_lineage_settings = "DISABLE"
        }
    recrawl_policy {
        recrawl_behavior = "CRAWL_EVERYTHING"
        }
    s3_target {
    exclusions          = []
    path = "s3://pmendhe-capstone-target/report/"

  }

  classifiers   = []

  configuration = jsonencode({
    Version = 1.0
    CreatePartitionIndex = true
     
  })

  schema_change_policy {
        delete_behavior = "DEPRECATE_IN_DATABASE" 
        update_behavior = "UPDATE_IN_DATABASE"
        }

}


resource "aws_glue_crawler" "pmendhe_capstone_target" {
  name          = "pmendhe_capstone_target"
  role          = "pmendhe-Glue-role"
  database_name = aws_glue_catalog_database.pmendhe_capstone_target.name
  tags                   = {}

    lake_formation_configuration {
         use_lake_formation_credentials = false 
          
        }
    lineage_configuration {
          crawler_lineage_settings = "DISABLE"
        }
    recrawl_policy {
        recrawl_behavior = "CRAWL_EVERYTHING"
        }
    s3_target {
    exclusions          = []
    path = "s3://pmendhe-capstone-target/transformed/"

  }

  classifiers   = []

  configuration = jsonencode({
    Version = 1.0
    CreatePartitionIndex = true
     
  })

  schema_change_policy {
        delete_behavior = "DEPRECATE_IN_DATABASE" 
        update_behavior = "UPDATE_IN_DATABASE"
        }

}