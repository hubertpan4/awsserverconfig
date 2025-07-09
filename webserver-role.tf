resource "aws_iam_role" "webserver_role" {
    name = "tf_webserver_role"
    assume_role_policy = data.aws_iam_policy_document.instance_assume_role_policy.json
}



data "aws_iam_policy_document" "instance_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    effect="Allow"
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "attach_reads3" {
  role       = aws_iam_role.webserver_role.name
  policy_arn = aws_iam_policy.reads3.arn
}

resource "aws_iam_role_policy_attachment" "attach_writeMetrics" {
  role       = aws_iam_role.webserver_role.name
  policy_arn = aws_iam_policy.writeMetrics.arn
}

resource "aws_iam_instance_profile" "webserver_instance_profile" {
  name = "webserver-instance-profile"
  role = aws_iam_role.webserver_role.name

  tags = {
    Name = "webserver_role_profile"
  }
}