
output "sns_arn" {
  description = "SNS ARN"
  value       = aws_sns_topic.prometheus-alerts.arn
}