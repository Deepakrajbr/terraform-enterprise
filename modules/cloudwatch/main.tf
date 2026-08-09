resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name = "${var.project_name}-high-cpu"

  alarm_description = "High CPU utilization on the application Auto Scaling Group"

  comparison_operator = "GreaterThanThreshold"

  evaluation_periods = 2

  metric_name = "CPUUtilization"

  namespace = "AWS/EC2"

  period = 300

  statistic = "Average"

  threshold = 70

  dimensions = {
    AutoScalingGroupName = var.autoscaling_group_name
  }

  treat_missing_data = "notBreaching"

  tags = {
    Name = "${var.project_name}-high-cpu"
  }
}