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
                Resource = [
                    "${aws_s3_bucket.code-bucket.arn}/*",
                    aws_s3_bucket.code-bucket.arn
                ]
            }
        ]
    })
}

resource "aws_iam_policy" "writeMetrics" {
    name = "writeMetrics"
    path = "/"
    description = "write metrics policy"
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