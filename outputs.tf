output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "alb_dns_name" {
  description = "Application Load Balancer DNS name"
  value       = module.alb.alb_dns_name
}

output "autoscaling_group_name" {
  description = "Auto Scaling Group name"
  value       = module.ec2.autoscaling_group_name
}

output "rds_endpoint" {
  description = "RDS database endpoint"
  value       = module.rds.db_endpoint
}

output "rds_identifier" {
  description = "RDS database identifier"
  value       = module.rds.db_identifier
}

output "cloudwatch_alarm_name" {
  description = "CloudWatch high CPU alarm"
  value       = module.cloudwatch.high_cpu_alarm_name
}

output "iam_instance_profile" {
  description = "EC2 IAM instance profile"
  value       = module.iam.ec2_instance_profile_name
}