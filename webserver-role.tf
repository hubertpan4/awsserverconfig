resource "aws_iam_role" "webserver_role" {
    name = "tf_webserver_role"
    managed_policy_arns = [
        aws_iam_policy.reads3.arn, 
        aws_iam_policy.writeMetrics.arn
        ]
        assume_role_policy = data.aws_iam_policy_document.instance_assume_role_policy.json
}



data "aws_iam_policy_document" "instance_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}