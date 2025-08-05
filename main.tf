provider "aws" {
  region = "us-east-1"
}


# resource "aws_cloudwatch_log_group" "stepfn_logs" {
#   name              = "/aws/stepfunctions/example"
#   retention_in_days = 7
# }

module "hello_world_stepfunction" {
  source              = "./modules/stepfunction"
  name                = "hello-world-stepfunction"
  role_arn            = "step_fuunc role ARN"
  # log_group_arn       = aws_cloudwatch_log_group.stepfn_logs.arn
  definition_file_path = "statemachines/sample_hello_world.json"
}

