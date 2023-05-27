output "eventbridge_scheduler_arn" {
  description = "ARN of the schedule"
  value       = aws_scheduler_schedule.this.arn
}