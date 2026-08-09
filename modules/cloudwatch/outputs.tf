output "high_cpu_alarm_name" {
  description = "High CPU CloudWatch alarm name"
  value       = aws_cloudwatch_metric_alarm.high_cpu.alarm_name
}