resource "aws_s3_bucket" "devops-bucket" {
  bucket        = "webapp-devops-bucket"
  force_destroy = true

  tags = {
    Name        = "DevOps Bucket"
    Environment = "Prod"
  }
}

resource "aws_s3_bucket_versioning" "devops-bucket-versioning" {
  bucket = aws_s3_bucket.devops-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_object" "nginx-file" {
  bucket = aws_s3_bucket.devops-bucket.id
  key    = "deployment/deployment.zip"
  source = "deployment/deployment.zip"
}