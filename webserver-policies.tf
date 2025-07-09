resource "aws_iam_policy" "reads3" {
    name = "reads3"
    path = "/"
    description = "reads3 policy"
    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action = [
                    "s3:GetObject",
                    "s3:ListBucket"
                ]
                Effect = "Allow"
                Resource = "arn:aws:s3:::com.icarusfrog.test/**"
            }
        ]
    })
}

resource "aws_iam_policy" "writeMetrics" {
    name = "writeMetrics"
    path = "/"
    description = "reads3 policy"
    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action = ["cloudwatch:PutMetricData",]
                Effect = "Allow"
                Resource = "*"
            }
        ]
    })
}