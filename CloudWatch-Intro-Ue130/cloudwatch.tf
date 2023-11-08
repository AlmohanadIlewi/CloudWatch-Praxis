# Create Cloudwatch Alarm Metric
# Create Cloudwatch Alarm Metric
resource "aws_cloudwatch_metric_alarm" "ec2_metrics_alarm" {
    alarm_name                = "MyEc2CpuAlert"
    comparison_operator       = "GreaterThanOrEqualToThreshold"
    evaluation_periods        = 2
    metric_name               = "CPUUtilization"
    namespace                 = "CWAgent"
    period                    = 30
    statistic                 = "Average"
    threshold                 = 80
    alarm_description         = "This metric monitors CPU utilization"
    alarm_actions = [aws_sns_topic.sns_cloudwatch_topic.arn]
    
    insufficient_data_actions = []
    
    dimensions = {
        InstanceId = aws_instance.metricsInstance-cloudwatch.id
    }
}


