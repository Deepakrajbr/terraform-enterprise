resource "aws_security_group" "this" {
  name        = var.name
  description = var.description
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.name
  }
}

resource "aws_vpc_security_group_ingress_rule" "cidr" {
  count = length(var.cidr_blocks) > 0 ? 1 : 0

  security_group_id = aws_security_group.this.id

  cidr_ipv4 = var.cidr_blocks[0]

  from_port   = var.ingress_port
  to_port     = var.ingress_port
  ip_protocol = var.ingress_protocol
}

resource "aws_vpc_security_group_ingress_rule" "security_group" {
  count = var.enable_source_security_group_rule ? 1 : 0

  security_group_id = aws_security_group.this.id

  referenced_security_group_id = var.source_security_group_id

  from_port   = var.ingress_port
  to_port     = var.ingress_port
  ip_protocol = var.ingress_protocol
}