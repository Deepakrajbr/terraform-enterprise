data "aws_ami" "ubuntu" {

  most_recent = true

  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}

resource "aws_launch_template" "this" {

  name_prefix = "${var.project_name}-lt"

  image_id = data.aws_ami.ubuntu.id

  instance_type = var.instance_type

  key_name = var.key_name

  vpc_security_group_ids = [
    var.security_group_id
  ]

  iam_instance_profile {
    name = var.iam_instance_profile_name
  }

  user_data = base64encode(file("${path.module}/userdata.sh"))

}

resource "aws_autoscaling_group" "this" {

  name = "${var.project_name}-asg"

  desired_capacity = 2

  min_size = 2

  max_size = 4

  vpc_zone_identifier = var.private_subnet_ids

  target_group_arns = [
    var.target_group_arn
  ]

  health_check_type = "ELB"

  launch_template {

    id = aws_launch_template.this.id

    version = "$Latest"

  }

}