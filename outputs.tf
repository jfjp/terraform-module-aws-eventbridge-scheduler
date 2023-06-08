output "eventbridge_scheduler_arn" {
  description = "ARN of the schedule"
  value       = aws_scheduler_schedule.this.arn
}

output "iam_role_name" {
    description = "Name of IAM role"
    value       = var.schedule_task_role_policy_json_filename == null ? data.aws_iam_role.this[0].name : aws_iam_role.this[0].name
}
