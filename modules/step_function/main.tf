resource "aws_sfn_state_machine" "etl_state_machine" {
  name     = "pmendhe_CAPStone_stepfunction"
  role_arn = "arn:aws:iam::260073349210:role/service-role/StepFunctions-pmendhe_CAPStone_stepfunction-role-iji9jmgox"

  definition = jsonencode({
    Comment       = "A description of my state machine"
    QueryLanguage = "JSONata"
    StartAt       = "Customer_transformed"
    States        = {
    Customer_transformed = {
        Type     = "Task"
        Resource = "arn:aws:states:::glue:startJobRun.sync"
        Arguments = {
          JobName = "Customer_transformed"
        }
        Next = "Orders_Transformed"
      }

    Orders_Transformed = {
        Type     = "Task"
        Resource = "arn:aws:states:::glue:startJobRun.sync"
        Arguments = {
          JobName = "Orders_Transformed"
        }
        Next = "Count"
      }

    Count = {
        Type     = "Task"
        Resource = "arn:aws:states:::lambda:invoke"
        Arguments = {
          FunctionName = "arn:aws:lambda:us-east-1:260073349210:function:counts_report:$LATEST"
          Payload      = "{% $states.input %}"
        }
        Output = "{% $states.result.Payload %}"
        Retry = [
          {
            ErrorEquals     = ["Lambda.ServiceException", "Lambda.AWSLambdaException", "Lambda.SdkClientException", "Lambda.TooManyRequestsException"]
            IntervalSeconds = 1
            MaxAttempts     = 3
            BackoffRate     = 2
            JitterStrategy  = "FULL"
          }
        ]
        Next = "By_Category"
      }

    By_Category = {
        Type     = "Task"
        Resource = "arn:aws:states:::lambda:invoke"
        Arguments = {
          FunctionName = "arn:aws:lambda:us-east-1:260073349210:function:categories_report:$LATEST"
          Payload      = "{% $states.input %}"
        }
        Output = "{% $states.result.Payload %}"
        Retry = [
          {
            ErrorEquals     = ["Lambda.ServiceException", "Lambda.AWSLambdaException", "Lambda.SdkClientException", "Lambda.TooManyRequestsException"]
            IntervalSeconds = 1
            MaxAttempts     = 3
            BackoffRate     = 2
            JitterStrategy  = "FULL"
          }
        ]
        Next = "By_Payment_Method"
      }

      By_Payment_Method = {
        Type     = "Task"
        Resource = "arn:aws:states:::lambda:invoke"
        Arguments = {
          FunctionName = "arn:aws:lambda:us-east-1:260073349210:function:payment-methods-count:$LATEST"
          Payload      = "{% $states.input %}"
        }
        Output = "{% $states.result.Payload %}"
        Retry = [
          {
            ErrorEquals     = ["Lambda.ServiceException", "Lambda.AWSLambdaException", "Lambda.SdkClientException", "Lambda.TooManyRequestsException"]
            IntervalSeconds = 1
            MaxAttempts     = 3
            BackoffRate     = 2
            JitterStrategy  = "FULL"
          }
        ]
        Next = "top_spenders"
      }

    top_spenders = {
        Type     = "Task"
        Resource = "arn:aws:states:::glue:startJobRun.sync"
        Arguments = {
          JobName = "top_spenders"
        }
        Next = "spending-per-category"
      }


    spending-per-category = {
        Type     = "Task"
        Resource = "arn:aws:states:::glue:startJobRun.sync"
        Arguments = {
          JobName = "spending-per-category"
        }
        End       = true
      }
    }
  })
}

