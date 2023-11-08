
resource "aws_iam_role" "cloudwatch_agent_role" {
  name = "CloudWatchAgentServerRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}
resource "aws_iam_policy" "cloudwatch_policy" {
  name        = "CloudWatchInlinePolicy"
  description = "Inline policy to allow PutMetricData"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action   = "cloudwatch:PutMetricData",
        Effect   = "Allow",
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "cloudwatch_policy_attachment" {
  policy_arn = aws_iam_policy.cloudwatch_policy.arn
  role       = aws_iam_role.cloudwatch_agent_role.name
}

resource "aws_iam_instance_profile" "cloudwatch_agent_profile" {
  name = "CloudWatchAgentServerInstanceProfile"
  role = aws_iam_role.cloudwatch_agent_role.name
}



