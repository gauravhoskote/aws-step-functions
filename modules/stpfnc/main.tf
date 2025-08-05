resource "aws_sfn_state_machine" "this" {
  name     = var.name
  role_arn = var.role_arn
  type     = "STANDARD"
  definition = file("${path.root}/${var.definition_file_path}")
}

