variable "lambda_function_name" {
  description = "Name of lambda function"
  type        = string
  default     = "vrush-package-scan-lambda-fn"
}

variable "lambda_file_name" {
  description = "Name of lambda file to be zipped"
  type        = string
  default     = "index"
}

variable "iam_name" {
  description = "Name of IAM"
  type        = string
  default     = "vrush_iam_package_scan_lambda"
}

variable "vpc_name" {
  description = "The ID of the VPC"
  type        = string
  default     = "vrush-vpc-tf-module"
}

variable "created_by" {
  description = "The name of vpc creator"
  type        = string
  default     = "Vrush"
}
