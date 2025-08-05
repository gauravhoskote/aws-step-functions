resource "aws_iam_role" "stepfn_role" {
  name = "StepFunctionExecutionRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "states.amazonaws.com"
      }
    }]
  })
}

# resource "aws_cloudwatch_log_group" "stepfn_logs" {
#   name              = "/aws/stepfunctions/example"
#   retention_in_days = 7
# }

module "hello_world_stepfunction" {
  source              = "./modules/stepfunction"
  name                = "hello-world-stepfunction"
  role_arn            = module.aws_iam_role.stepfn_role
  # log_group_arn       = aws_cloudwatch_log_group.stepfn_logs.arn
  definition_file_path = "../statemachines/sample_hello_world.json"
}

