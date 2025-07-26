data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "iam_for_lambda" {
  name               = var.iam_name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

#resource "aws_iam_role_policy" "lambda_logging" {
# name   = "lambda_logging"
#role   = aws_iam_role.iam_for_lambda.id
# policy = data.aws_iam_policy_document.inline_policy_cloudwatch.json
#}