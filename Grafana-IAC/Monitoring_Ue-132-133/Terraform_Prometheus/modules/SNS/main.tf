resource "aws_sns_topic" "prometheus-alerts" {
    name = "prom_alerts"
}

resource "aws_sns_topic_subscription" "prom_alerts_email_sub" {
    topic_arn = aws_sns_topic.prometheus-alerts.arn
    protocol  = "email"
    endpoint  = "<mohanad.ilewi.83@gmail.com>"
}

