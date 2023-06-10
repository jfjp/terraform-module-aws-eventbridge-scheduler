resource "aws_scheduler_schedule_group" "this" {
  # group name "default" cannot be create.
  count = var.group_create && var.group_name != "default" ? 1 : 0
  name  = var.group_name
}

resource "aws_scheduler_schedule" "this" {
  name                         = var.schedule_name
  description                  = var.schedule_description
  group_name                   = var.group_name
  schedule_expression_timezone = "Asia/Tokyo"

  state = var.schedule_state

  schedule_expression = var.schedule_expression

  flexible_time_window {
    maximum_window_in_minutes = var.schedule_maximum_window_in_minutes != null ? var.schedule_maximum_window_in_minutes : null
    mode                      = var.schedule_maximum_window_in_minutes != null ? "FLEXIBLE" : "OFF"
  }

  target {
    arn      = var.schedule_target_arn
    input    = var.schedule_target_input
    role_arn = var.schedule_task_role_policy_json_filename == null ? data.aws_iam_role.this[0].arn : aws_iam_role.this[0].arn
  }

  depends_on = [
    aws_scheduler_schedule_group.this
  ]

}