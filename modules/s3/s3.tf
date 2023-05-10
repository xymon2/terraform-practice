# Private S3 Settings
resource "aws_s3_bucket" "s3_for_ec2" {
    bucket = var.bucket
    tags = {
        Name = var.name
    }
}

resource "aws_s3_bucket_ownership_controls" "s3_for_ec2_controls" {
  bucket = aws_s3_bucket.s3_for_ec2.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "s3_for_ec2" {
    depends_on = [aws_s3_bucket_ownership_controls.s3_for_ec2_controls]
    bucket = aws_s3_bucket.s3_for_ec2.id
    acl = "private"
}


# IAM role and policy setting to access this s3.
resource "aws_iam_role" "ec2_iam_role" {
  name = "ec2_iam_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy" "s3_policy" {
  name        = "s3_policy"
  description = "Allows EC2 instances to access S3"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket"
        ]
        Resource = [
          aws_s3_bucket.s3_for_ec2.arn,
          "${aws_s3_bucket.s3_for_ec2.arn}/*"
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "s3_policy_attachment" {
  policy_arn = aws_iam_policy.s3_policy.arn
  role       = aws_iam_role.ec2_iam_role.name
}

resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "ec2_instance_profile"
  role = aws_iam_role.ec2_iam_role.name
}

output "iam_instance_profile_for_ec2" {
    value = aws_iam_instance_profile.ec2_instance_profile.name
}