resource "aws_sns_topic" "sns_cloudwatch_topic" {
  name = "MySNSTopic"
}

resource "aws_sns_topic_subscription" "my_sns_subscription" {
  topic_arn = aws_sns_topic.sns_cloudwatch_topic.arn
  protocol  = "email"
  endpoint  = "mohanad.ilewi@docc.techstarter.de"  # Ändern Sie dies in Ihre E-Mail-Adresse
}