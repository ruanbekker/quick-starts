resource "aws_security_group" "ec2" {
    name        = "${local.project_name}-ec2-sg"
    description = "${local.project_name}-ec2-sg"
    vpc_id      = var.vpc

    tags = merge(
      var.default_tags,
      {
       Name = "${local.project_name}-ec2-sg"
      },
    )
}

resource "aws_security_group_rule" "ssh" {
    description       = "allows public ssh access to ec2"
    security_group_id = aws_security_group.ec2.id
    type              = "ingress"
    protocol          = "tcp"
    from_port         = 22
    to_port           = 22
    cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "egress" {
    description       = "allows egress"
    security_group_id = aws_security_group.ec2.id
    type              = "egress"
    protocol          = "-1"
    from_port         = 0
    to_port           = 0
    cidr_blocks       = ["0.0.0.0/0"]
}