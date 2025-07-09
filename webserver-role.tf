resource "aws_iam_role" "webserver_role" {
    name = "tf_webserver_role"
    managed_policy_arns = [
        aws_iam_policy.reads3.arn, 
        aws_iam_policy.writeMetrics.arn
        ]
}