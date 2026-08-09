module "vpc" {

  source = "./modules/vpc"

  project_name = var.project_name

  vpc_cidr = var.vpc_cidr

  public_subnet_a = var.public_subnet_a

  public_subnet_b = var.public_subnet_b

  private_subnet_a = var.private_subnet_a

  private_subnet_b = var.private_subnet_b

}

module "alb_sg" {
  source = "./modules/security-group"

  name        = "alb-sg"
  description = "ALB Security Group"
  vpc_id      = module.vpc.vpc_id

  ingress_port     = 80
  ingress_protocol = "tcp"

  cidr_blocks = ["0.0.0.0/0"]
}

module "ec2_sg" {
  source = "./modules/security-group"

  name        = "ec2-sg"
  description = "Application Server"
  vpc_id      = module.vpc.vpc_id

  ingress_port     = 8080
  ingress_protocol = "tcp"

  source_security_group_id = module.alb_sg.security_group_id

  enable_source_security_group_rule = true
}

module "rds_sg" {
  source = "./modules/security-group"

  name        = "rds-sg"
  description = "Database"
  vpc_id      = module.vpc.vpc_id

  ingress_port     = 3306
  ingress_protocol = "tcp"

  source_security_group_id = module.ec2_sg.security_group_id

  enable_source_security_group_rule = true
}

module "alb" {

  source = "./modules/alb"

  project_name = var.project_name

  vpc_id = module.vpc.vpc_id

  public_subnet_ids = [

    module.vpc.public_subnet_a,

    module.vpc.public_subnet_b

  ]

  security_group_id = module.alb_sg.security_group_id

}

module "iam" {
  source = "./modules/iam"

  project_name = var.project_name
}

module "ec2" {

  source = "./modules/ec2"

  project_name = var.project_name

  instance_type = var.instance_type

  key_name = var.key_name

  security_group_id = module.ec2_sg.security_group_id

  iam_instance_profile_name = module.iam.ec2_instance_profile_name

  private_subnet_ids = [
    module.vpc.private_subnet_a,
    module.vpc.private_subnet_b
  ]

  target_group_arn = module.alb.target_group_arn

}

module "rds" {

  source = "./modules/rds"

  project_name = var.project_name

  db_name = var.db_name

  username = var.db_username

  password = var.db_password

  private_subnet_ids = [
    module.vpc.private_subnet_a,
    module.vpc.private_subnet_b
  ]

  security_group_id = module.rds_sg.security_group_id

}

module "cloudwatch" {
  source = "./modules/cloudwatch"

  project_name = var.project_name

  autoscaling_group_name = module.ec2.autoscaling_group_name
}