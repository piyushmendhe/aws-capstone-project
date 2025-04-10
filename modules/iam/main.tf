resource "aws_iam_role" "pmendhe-Glue-role" {
  name = "pmendhe-Glue-role"
  description           = "Allows Glue to call AWS services on your behalf. "

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = ["events.amazonaws.com",
                  "glue.amazonaws.com"]
      },
      Action = "sts:AssumeRole"
    }]
  })
}


