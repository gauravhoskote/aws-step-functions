variable "name" {
  type = string
}

variable "role_arn" {
  type = string
}

variable "definition_file_path" {
  type        = string
  description = "Relative path from root to the Step Function JSON definition file"
}

variable "stepfunc_type"{
  type        = string
  description = "Type of Step Function - STANDARD or EXPRESS"
}