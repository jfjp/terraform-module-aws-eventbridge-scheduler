variable "group_name" {
  type        = string
  description = "Name of the schedule group"
  default     = "default"
}

variable "schedule_name" {
  type        = string
  description = "Name of the schedule"
}

variable "schedule_description" {
  type        = string
  description = "Brief description of the schedule"
}

variable "schedule_expression_timezone" {
  type        = string
  description = "Timezone in which the scheduling expression is evaluated. Defaults to Asia/Tokyo."
  default     = "Asia/Tokyo"
}

variable "schedule_state" {
  type        = string
  description = "Whether the schedule is enabled or disabled. Defaults to disable."
  default     = "DISABLED"
}

variable "schedule_expression" {
  type        = string
  description = "Defines when the schedule runs"
}

variable "schedule_maximum_window_in_minutes" {
  type        = number
  description = "Maximum time window during which a schedule can be invoked. Defaults to no flexible window."
  default     = null
}

variable "schedule_target_arn" {
  type        = string
  description = "ARN of the target of this schedule. see https://docs.aws.amazon.com/scheduler/latest/UserGuide/managing-targets-universal.html#supported-universal-targets"
}

variable "schedule_target_input" {
  type        = string
  description = "Text, or well-formed JSON, passed to the target"
}

variable "schedule_task_role_name" {
  type        = string
  description = "Name of the IAM role that EventBridge Scheduler will use for this target when the schedule is invoked, assumed prefix of name when role is created."
}

variable "schedule_task_role_policy_name" {
  type        = string
  description = "Name prefix of the IAM role policy."
  default     = "policy_for_eventbridge_scheduler_execution_role"
}

variable "schedule_task_role_policy_description" {
  type        = string
  description = "Description of the IAM role policy."
  default     = "Policy for EventBridge Scheduler execution role."
}

variable "schedule_task_role_policy_json_filename" {
  type        = string
  description = "Name of JSON formatted file of policy document that will be attached to IAM role, specify appropriate name if you want to create IAM role."
  default = null
}