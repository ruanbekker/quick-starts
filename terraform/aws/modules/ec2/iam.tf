data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

data "aws_iam_policy" "ec2_read_only_access" {
  arn = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
}

resource "aws_iam_role" "ec2_access_role" {
  name               = "${local.project_name}-ec2-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

resource "aws_iam_policy_attachment" "readonly_role_policy_attach" {
  name       = "${local.project_name}-ec2-role-attachment"
  roles      = [aws_iam_role.ec2_access_role.name]
  policy_arn = data.aws_iam_policy.ec2_read_only_access.arn
}

resource "aws_iam_instance_profile" "instance_profile" {
  name  = "${local.project_name}-ec2-instance-profile"
  role = aws_iam_role.ec2_access_role.name
}