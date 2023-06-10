data "aws_iam_role" "this" {
  count = var.schedule_task_role_policy_json_filename == null ? 1 : 0
  name  = var.schedule_task_role_name
}

resource "aws_iam_role" "this" {
  count       = var.schedule_task_role_policy_json_filename == null ? 0 : 1
  name_prefix = var.schedule_task_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = {
      Effect = "Allow"
      Action = "sts:AssumeRole"
      Principal = {
        Service = "scheduler.amazonaws.com"
      }
    }
  })
}

resource "aws_iam_policy" "this" {
  count       = var.schedule_task_role_policy_json_filename == null ? 0 : 1
  name_prefix = var.schedule_task_role_policy_name
  path        = "/"
  description = var.schedule_task_role_policy_description
  policy      = file(var.schedule_task_role_policy_json_filename)
}

resource "aws_iam_role_policy_attachment" "this" {
  count      = var.schedule_task_role_policy_json_filename == null ? 0 : 1
  role       = aws_iam_role.this[0].name
  policy_arn = aws_iam_policy.this[0].arn
}