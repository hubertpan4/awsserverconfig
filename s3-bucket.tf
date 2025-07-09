resource "aws_s3_bucket" "code-bucket" {
   bucket = "com.icarusfrog.us.east.2.code.bucket"
   acl = "private"  
}

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.code-bucket.bucket
  key    = "aws-demo-0.0.1-SNAPSHOT.jar"
  source = "aws-demo-0.0.1-SNAPSHOT.jar"

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  # etag = filemd5("path/to/file")
}