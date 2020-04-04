provider "aws" {
  region = "us-east-2"
  profile = "coralbuffalo"
}

resource "aws_s3_bucket" "coralbuffalo_tfstate" {
  bucket = "coralbuffalo-tfstate"
  acl = "private"

  versioning {
    enabled = true
  }

    tags = {
    "cb_name" = "Coralbuffalo TF State"
  }
}

resource "aws_s3_bucket_policy" "coralbuffalo_tfstate" {  
  bucket = aws_s3_bucket.coralbuffalo_tfstate.bucket
  policy = <<POLICY
{
  "Id": "Policy1585933241544",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Action": [
        "s3:GetObject",
                "s3:PutObject"
      ],
      "Effect": "Allow",
      "Resource": "${aws_s3_bucket.coralbuffalo_tfstate.arn}/*",
      "Principal": {
        "AWS": [
          "arn:aws:iam::164169635437:user/wookie"
        ]
      }
    },
    {
      "Sid": "",
      "Action": [
        "s3:ListBucket"
      ],
      "Effect": "Allow",
      "Resource": "${aws_s3_bucket.coralbuffalo_tfstate.arn}",
      "Principal": {
        "AWS": [
          "arn:aws:iam::164169635437:user/wookie"
        ]
      }
      
    }
  ]
}
POLICY
}

resource "aws_dynamodb_table" "coralbuffalo_tfstate_dynamodb" {
  name = "coralbuffalo-tfstate-lock"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}