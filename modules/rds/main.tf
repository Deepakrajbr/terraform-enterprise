resource "aws_db_subnet_group" "this" {

  name = "${var.project_name}-db-subnet-group"

  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "${var.project_name}-db-subnet-group"
  }

}

resource "aws_db_instance" "this" {

  identifier = "${var.project_name}-mysql"

  engine = "mysql"

  engine_version = "8.0"

  instance_class = "db.t3.micro"

  allocated_storage = 20

  db_name = var.db_name

  username = var.username

  password = var.password

  skip_final_snapshot = true

  publicly_accessible = false

  db_subnet_group_name = aws_db_subnet_group.this.name

  vpc_security_group_ids = [
    var.security_group_id
  ]

}