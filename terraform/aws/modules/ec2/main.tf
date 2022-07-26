data "aws_ami" "latest_ubuntu" {
  most_recent = true
  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-*-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "architecture"
    values = [var.arch]
  }

}

resource "aws_instance" "ec2" {
  ami                         = data.aws_ami.latest_ubuntu.id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  key_name                    = var.keyname
  vpc_security_group_ids      = [aws_security_group.ec2.id]
  associate_public_ip_address = true
  monitoring                  = true
  iam_instance_profile        = aws_iam_instance_profile.instance_profile.name
  
  lifecycle {
    ignore_changes            = [subnet_id, ami]
  }
  
  root_block_device {
      volume_type           = "gp2"
      volume_size           = var.ebs_root_size_in_gb
      encrypted             = false
      delete_on_termination = true
  }

  tags = merge(
    local.default_tags,
    {
     Name = "${local.project_name}"
    },
  )

}
