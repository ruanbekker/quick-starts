data "aws_ami" "latest_selected" {
  most_recent = true
  owners = var.ami_configs[var.selected_ami_type].owners

  filter {
    name   = "name"
    values = [var.ami_configs[var.selected_ami_type].name_pattern]
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
    values = [local.ami_architecture]
  }

}

resource "aws_key_pair" "this" {
  key_name   = "${local.project_name}-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "ec2" {
  ami                         = data.aws_ami.latest_selected.id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.this.key_name
  vpc_security_group_ids      = [aws_security_group.ec2.id]
  associate_public_ip_address = true
  monitoring                  = true
  iam_instance_profile        = aws_iam_instance_profile.instance_profile.name
  
  lifecycle {
    ignore_changes            = [ami]
  }
  
  root_block_device {
    volume_type           = "gp3"
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
